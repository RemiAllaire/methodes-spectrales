Soit $H$ l'opérateur différentiel, l'idée est toujours de minimiser l'erreur résiduelle 
$$
R(x;a_{0},a_{1},\dots,a_{N}) = Hu_{N}-f
$$
avec
$$
u_{N}=\sum_{n=0}^{\infty}a_{n}\phi_{n}(x)
$$
Si $\phi_{n}(x)$ respecte déjà les conditions aux frontières, on peut déterminer les coefficients $a_{n}$ en imposant (N+1) conditions avec (N+1) fonctions tests $w_{i}$ de sorte que le produit scalaire
$$
(w_{i},R(x;a_{0},a_{1},\dots,a_{N}))=0
$$
où
$$
(a,b) := \int_{a}^{b}w(x)a(x)b(x) \,dx
$$
##### Méthodes pseusdo-spectrales
La fonction test est $w_{ii} = \delta(x-x_{i})$. Ainsi,
$$
(\delta(x-x_{i}),R(x;a_{0},a_{1},\dots,a_{N}))= R(x_{i},a_{0},a_{1},\dots,a_{N}) = 0
$$
##### Méthode des moments (à éviter)
La fonction test est $w_{i}(x)  =x^{i}$, 

##### Méthode de Galerkin
La fonction test est $w_{i}(x)=\phi_{i}(x)$
L'idée est de choisir une famille de fonction de base $\phi_{n}$ qui est complète, linéairement indépendante et possiblement orthogonales.      


### Conditions aux bords

Supposons que l'on travaille avec Tchebchev. Si on impose que $u(-1)=u(1)=0$, il y a deux choix. Soit on ajoute deux équations de plus pour respecter la condition $\sum_{n=0}^{N}a_{n}T_{n}(\pm 1) =0$ ce qui complexifie la programmation. Sinon, on peux adapter nos fonctions de bases: $\phi_{2n} = T_{2n}-T_{0}$, $\phi_{2n+1}=T_{2n+1}-T_{1}$.

### Propriété des fonctions de bases

Si $\phi_{n}(x)$ est orthogonale et $\upsilon$ la constante de normalisation, alors
$$
(\phi_{m},\phi_{n}) = \delta_{mn}\upsilon_{n}^{2}
$$

Ainsi, si
$$
f(x) = \sum_{n=0}^{N}a_{n}\phi_{n}(x)
$$
On a par orthogonalité
$$
\begin{align}
(f(x),\phi_{m}(x))  & = \sum_{n=0}^{N}a_{n}(\phi_{n},\phi_{m}) \\
 & =a_{m}\upsilon^{2}_{m}
\end{align}
	

$$
Ainsi,
$$
a_{n} = \frac{(\phi_{n},f)}{(\phi_{n},\phi_{n})}
$$
Si en plus la base est orthonormale, $a_{n}=(\phi_{n},f)$

### Méthode de Galerkin 
Soit $R$ la fonction résiduelle, on peut aussi l'écrire comme une sommation des fonctions de bases 
$$
R(x;a_{0},a_{1},\dots,a_{n})=\sum_{n=0}^{N}r_{n}\phi_{n}(x)
$$

Les coefficients spectraux ont tendances à décroître  et a être donc très petit pour des n grands. L'idée est de forcer pour les petite puissance à ce que $r_{n} = 0$. Donc, on impose
$$
r_{n} = (R,\phi_{n}) = 0
$$
Autrement dit, on filtre les basses fréquences et on laisse les très petit coefficients (après N) déterminer la fonction résiduelle qui ( on espère) va être petite aussi.

En résumé, il faut que (en assumant que L est linéaire)
$$
\begin{align}
(R,\phi_m) & =0 \\
(Lu_{N}-f,\phi_{m})  & = 0 \\
\left( \sum_{n=0}^{N}\left(a_{n}L\phi_{n}(x)-f(x)\right),\phi_{m} \right) & =0 \\
\sum_{n=0}^{N}a_{n}(L\phi_{n},\phi_{m}) = (f,\phi_{m})
\end{align}


$$
On peut construire les matrices
$$
A_{ij} = (L\phi_{j},\phi_{i}), \quad B_{i} = (f,\phi_{i})
$$
Et on Résout
$$
Aa^{T} =B
$$
pour calculer les coefficients et reconstituer la fonction $u_{N}$
09