% Paramètres
N = 5;                 % Nombre de fonctions de base
beta = 1.2H;             % Paramètre d'échelle

tic
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
[V, D] = eig(H);
energies1 = diag(D);
energies1 = energies1(1:round(N/3));

exact = (0.5 + 0:round(N/3))';

erreur = abs(energies1-exact);

% Affichage des énergies
fprintf('Valeurs propres (énergies) :\n');
disp(energies1);
disp(erreur);

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
