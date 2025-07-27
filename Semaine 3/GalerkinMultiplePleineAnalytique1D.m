clc;clear;% Paramètres
%N = 20;                 % Nombre de fonctions de base
beta = 0.5;             % Paramètre d'échelle

N_list = 5:20:1000;        % Valeurs croissantes de N
k = 5;                  % Nombre de valeurs propres à suivre
erreurs = zeros(length(N_list), k);  % Stockage des erreurs
test = zeros(length(N_list), k);

tic
for idx = 1:length(N_list)
    N = N_list(idx);
% Initialisation de la matrice H
H = zeros(N+1, N+1);

% Remplissage de H selon les formules analytiques
for j = 0:N
    for i = 0:N
        val = 0;

        if i == j-2
            val = (1 - beta^4)/(4*beta^2) * sqrt(j*(j-1));
        elseif i == j
            val = (1 - beta^4)/(4*beta^2)*(2*j + 1) + 0.5*beta^2*(1 + 2*j);
        elseif i == j+2
            val = (1 - beta^4)/(4*beta^2) * sqrt((j+1)*(j+2));
        end

        H(i+1,j+1) = val;  % +1 car MATLAB indexe à partir de 1
    end
end

% Diagonalisation
    D = eig(H);
    D = sort(D);  % On trie les valeurs propres croissantes

    % Calcul de l'erreur relative sur les k premières valeurs propres
    for n = 0:k-1
        E_exact = n + 0.5;
        E_num = D(n+1);
        erreurs(idx, n+1) = abs(E_num - E_exact);
        test(idx,n+1) = E_num;
    end
end


figure;
semilogy(N_list, erreurs, 'o-','LineWidth',1.5);
xlabel('Taille de la base N');
ylabel('Erreur relative');
title(sprintf('Erreur relative sur les %d premières valeurs propres (\\beta = %.1f)', k, beta));
legend(arrayfun(@(n) sprintf('E_%d', n), 0:k-1, 'UniformOutput', false));
grid on;

toc
% % Optionnel : tracer les fonctions propres reconstruites
% x = linspace(-8, 8, 1000);
% phi = zeros(N+1, length(x));
% 
% % Construction des fonctions de base phi_n(x)
% for n = 0:N
%     Hn = hermiteH(n, beta*x);
%     phi(n+1, :) = exp(-(beta*x).^2 / 2) .* Hn ./ sqrt(beta*2^n * factorial(n) * sqrt(pi));
% end
% 
% % Tracer les 3 premières fonctions propres
% figure;
% for k = 1:3
%     psi = V(:,k)' * phi;
%     plot(x, psi, 'DisplayName', sprintf('n = %d, E = %.3f', k-1, energies(k)));
%     hold on;
% end
% legend;
% xlabel('x');
% ylabel('\psi(x)');
% title('Fonctions propres approx. par méthode de Galerkin');
% grid on;
