N = 6;              % nombre de fonctions de base
M = 20;             % nombre de points de quadrature
beta = 1.2;            % paramètre des Hermite généralisées

[x, w] = hermpts(M); % points et poids de Gauss-Hermite (nécessite Chebfun)

% Évaluation des fonctions de base
Phi = zeros(N, M);       % Phi(j, k) = phi_j(x_k)
d2Phi = zeros(N, M);     % deuxième dérivée

for j = 0:N-1
    Hn = hermiteH(j, beta*x);           % polynôme d’Hermite H_j(βx)
    d2Hn = hermiteH_kderivative(2,j, beta*x); % à implémenter ou approximer numériquement

    norm = 1 / sqrt(beta * 2^j * factorial(j) * sqrt(pi));
    expfac = exp(-(beta*x).^2 / 2);

    Phi(j+1, :) = norm * Hn .* expfac;
    d2Phi(j+1, :) = norm * expfac .* (beta^2 * d2Hn - beta^3 * 2 * x .* hermiteH_kderivative(1,j, beta*x) + beta^4 * (x.^2 - 1) .* Hn);
end

% Potentiel général (ex. harmonique)
Vx = 0.5 * x.^2;

% Calcul de Hφ_j(x_k)
Hphi = -0.5 * d2Phi + Vx' .* Phi;

% Construction de la matrice H_{ij}
H = Phi * diag(w) * Hphi';   % produit matriciel quadrature

% Diagonalisation
% Diagonalisation
[V, D] = eig(H);
energies1 = sort(diag(D));
energies1 = energies1(1:round(N/3));

exact = (0.5 + 0:round(N/3))';

erreur = abs(energies1-exact);

% Affichage des énergies
fprintf('Valeurs propres (énergies) :\n');
disp(energies1);
disp(erreur);
