% chebyshev_points.m
% Ce script génère et trace les points de Chebyshev de première espèce

N = 16;
k = 0:N;
x = cos(pi * k / N); % Points de Chebyshev

plot(x, zeros(size(x)), 'o')
title('Points de Chebyshev')
xlabel('x')
ylim([-0.1 0.1])
1+1;
grid on
