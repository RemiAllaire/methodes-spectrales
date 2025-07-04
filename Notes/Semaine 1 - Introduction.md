# 📘 Chapitre 1 – Introduction

## 🎯 Objectifs
- Résumer la matière
- Recréer quelques exemples

## 📝 Notes
Soit $u(x)$ la solution d'une équation différentielle, on assume qu'elle peut être représentée par une somme de fonction de bases $\phi_{n}(x)$  tel que:
$$
u(x) \approx u_{N}(x) = \sum_{N=0}^{N}a_{n}\phi_{n}(x)
$$
Soit $L$ l'opérateur différentiel de sorte que
$$
Lu = f(x)
$$
alors l'équation résiduelle est
$$
R(x;a_{0},a_{1},\dots,a_{N}) = Lu_{N}-f
$$
On cherche donc les coefficients $\{ a_{n} \}$ qui minimisent $|R(x;a_{n})|$ (qui est nulle si $u_{N}$ est exacte.

#example1
On souhaite résoudre 
$$
u_{x x}-(x^{6}+3x^{2})u = 0
$$
$$
u(-1)=u(1) = 1
$$
On cherche une solution de la forme polynômiale:
$$u_{2}(x)=1+(1-x^{2})(a_{0}+a_{1}x+a_{2}x^{2})$$
afin de respecter les conditions initiales. On veut calculer les paramètres $(a_{0},a_{1},a_{2})$ qui minimise la fonction résidu:
$$
\begin{align}
R(x;a_{0},a_{1},a_{2}) &= u_{2x x}-(x^{6}+3x^{2})u_{2} \\ \\
&= (2a_{2}-2a_{0})- 6a_{1}x-(3+3a_{0}+12a_{2})x^{2}-3a_{1}x^{3} +3(a_{0} -a_{2})x^{4}\\ \\
& +3a_{1}x^{5} +(-1-a_{0} +3a_{2})x^{6} -a_{1}x^{7} +(a_{0} -a_{2})x^{8} +a_{1}x^{9} +a_{2}x^{10}
\end{align}
$$


Pour ce faire, on procède par collocation. On choisit 3 points $\{ x_{1},x_{2},x_{3} \}$ (même nombre que de paramètre/degré liberté) où l'on suppose que $u_{2}$ est exacte, c'est à dire que $R(x_{1})=R(x_{2})=R(x_{3}) =0$. On peut choisir $\{ -0.5,0,0.5 \}$. Cela entraine une système d'équations pour les paramètres $(a_{0},a_{1},a_{2})$. On trouve que 
$$
\begin{align}
a_{0}=-\frac{764}{3807}, \quad a_{1}=0, \quad a_{2}=-\frac{764}{3807}
\end{align}
$$
Ce qui donne comme fonction d'approximation:
$$
u_{2}(x)=(x^{2}-1)\left( \frac{784x^{2}}{3807}+\frac{784}{3807} \right)+1
$$
On peut comparer avec la vraie solution
$$
\exp\left( \frac{x^{4}-1}{4} \right)
$$
Voici la difference entre les deux:
![Solution exacte (bleu) vs approximation](uexact_vs_u2.png)

et voici l'erreur:
![[erreur1.png]]

# Comparaison entre méthode pseudo-spectrales et de différence (finie et éléments)

Pour les méthodes de différences, le domaine est divisé en intervalles. Les fonctions de bases $\phi _{n}(x)$ sont non nulles  seulement sur un petit nombre de sous intervalles, d'où le comportement local. Ainsi, cela produit une matrice de différentiation qui est dite creuse, qui possède plusieurs avantages computationnels. Cependant, pour approximer les dérivées, en utilisant les différences centrées, on obtient souvent un ordre de convergence $O(h^{2}),O(h^{4}), O(h^{k})$  (ex: extrapolation de Richardson), dépendant du nombre de points qu'on utilise pour l'approximation.

De l'autre coté, pour les méthodes pseudo-spectrales, si on effectue une collocation à N points, les N points sont utilisé pour chaque fonction de bases. Il faudrait parvenir à une méthode de différence avec un ordre de $O(h^{N})$ pour l'équivaloir. Si on double le nombre de points, non seulement, il faudrait parvenir à $O(h^{2N})$, mais en plus vu que l'espace entre les points $h = O\left( \frac{1}{2N} \right)$, l'ordre de convergence de la méthode pseudo-spectrales  est $O\left[\left( \frac{1}{N} \right)^{N}\right]$. C'est pourquoi on dit que les méthodes pseudo-spectrales ont une convergence "exponentielle", plus vite que la convergence polynomiale pour tout $N$ fini.

Donc les méthodes pseudo-spectrales sont utilises si:
- On a besoin d'une très grande précision décimale (physique, chimie).
- On veut parvenir à la précision requise avec peu de degrés de liberté et donc moins de points
Ironiquement, cette deuxième propriété rends les méthodes pseudo-spectrales efficientes en mémoire. Ainsi, même en météorologie, où la précision n'est pas l'objectif, les méthodes spectrales sont utilisées. 
Cependant, il y a des défauts:
- Plus difficile à programmer et implémenter
- Plus gros coût calculatoire (non de mémoire) pour un même degré de liberté
- Travailler sur un domaine  irrégulier affecte plus la précision que les autres méthodes.

# 1.6 Choix des fonctions de bases

Les fonctions de bases $\phi_{n(x)}$ doivent idéalement être
- Facile à calculer
- Converger rapidement
- Complètent l'espace

Un bon candidat de $\phi_{n}(x)$ dans la majorité des cas sont les séries de Fourier exprimées en terme de  sommation de $\cos(nx)\text{ et } \sin(nx)$.
# Note sur les polynômes de Tchebychev

Cela inclus donc comme base la famille de polynômes de Tchebychev, très utilisée pour approximer des fonctions.
En effet, on peut les définir comme
$$
T_{n}(\cos \theta )= \cos(n\theta)
$$
De plus ils sont facilement calculable avec la relation de récurrence
$$
T_{n+1}(x) = 2xT_{n}(x)-T_{n-1}(x)
$$
avec $T_{0} = 1$ et $T_{1}= x$.

Cela équivaut aussi à la relation
$$
\cos n\theta = 2\cos \theta \cos[(n-1)\theta] - \cos[(n-2)\theta]
$$

Ils constituent en un excellent choix de base pourvu une solution non périodique  (sinon Fourier) et un domaine fini (sinon Laguerre, Hermite ou Tchebychev rationnel).