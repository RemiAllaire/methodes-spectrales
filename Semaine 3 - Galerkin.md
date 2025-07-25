
## Comment résoudre problème de valeurs propres avec Galerkin.

 Soit $H$, l'opérateur Hamiltonien, on veut résoudre l'équation de Schrödinger.
$$
H\psi = E\psi
$$
Soit $\phi_{i}$, les fonctions test et de base (orthonormale, ~complete).
On cherche une solution $\psi _N$ de la forme
$$
\psi_{N} = \sum_{n=0}^{N}c_{n}\phi_{n}
$$
On souhaite minimiser l'équation résiduelle
$$
R(x) = H\psi_{N}-E\psi_{N}
$$
Le développement spectral de l'équation résiduelle
$$
R =\sum_{n=0}^{N}r_{n}\phi_{n}
$$
Par orthogonalité, on obtient
$$
r_{n} =(\phi_{n},R)
$$
En utilisant la méthode de Galerkin, on imposant $r_{n}= 0, \quad n= 0,\dots,N$, on peut simplifier
$$
(\phi_{i},H\phi_{j}-E\phi_{j})(a_{i}) = (0)
$$
Cela donne une équation homogène. On cherche les solutions non-triviales afin de calculer les niveaux d'énergie (valeurs propres). En posant,
$$
A_{ij} =(\phi_{i},H\phi_{j}-E\phi_{j}) 
$$
on cherche E tel que
$$
\det(A) = 0
$$

##  Théorie équation de Schrödinger en 1D

L'équation de Schrödinger en 1 dimension

$$
H\psi=E\psi
$$
où $H$ est le Hamiltonien défini avec un potentiel $V(x)$ comme

$$
\begin{aligned}
H = -\frac{1}{2} \frac{d^{2}}{dx^{2}} +V(x)
\end{aligned}
$$


On étudie dans notre cas, on étudie l'oscillateur harmonique quantique, ainsi

$$
H = -\frac{1}{2} \frac{d^{2}}{dx^{2}} + \frac{1}{2}x^{2}
$$

Les états propres, à paramètre près sont

$$
E_{n}=n+\frac{1}{2}
$$


### Fonctions propres

Les fonctions propres sont les fonctions d’Hermite généralisés.

$$
\psi_{n}(x)= \frac{e^{x^{2}/2}}{\sqrt{2^{n}n!\sqrt{ \pi }  }}H_{n}(x)
$$

Travaillons avec une légère modification comme fonction de base

$$
\varphi_{n}(x)= \frac{e^{-(\beta x)^{2}/2}}{\sqrt{\beta2^{n}n!\sqrt{ \pi }  }}H_{n}(\beta x)
$$

On peut exploiter la propriété des polynômes d'Hermite

$$
\begin{aligned}
\int_{-\infty}^{\infty} H_{n}H_{m} e^{-x^{2}} \, dx &= 2^{n}n!\sqrt{ \pi }\delta_{nm} \\
\int_{-\infty}^{\infty} \varphi_{n}\varphi_{m} \, dx&= \delta_{nm} 
\end{aligned}
$$


### Calcul analytique
#### Effet du hamiltonien

On veut calculer
$$
\begin{aligned}
(\varphi_{i},H\varphi_{j}-E\varphi_{j})  & =(\varphi_{i},H\varphi_{j})-(\varphi_{i},E\varphi_{j}) \\
 & =(\varphi_{i},H\varphi_{j})-E\delta _{ij}
\end{aligned}
$$

Commençons par les dérivées de $\varphi_{i}$. On pose $N_{i}=\frac{1}{\sqrt{ \beta_{2}^{i}i!\sqrt{ \pi } }}$ et $z = \beta x$

$$
\begin{aligned}
(N_{i}e^{-(z)^{2}}H_{i}(z))' & = N_{i}(-\beta ze^{-z^{2}/2}H_{i}(z)+\beta e^{-z^{2}/2}H'_{i}(z)) \\
 & =N_{i}\beta e^{-z^{2}/2}(H'_{i}(z)-zH_{i}(z)) \\
\left[N_{i}e^{-z^{2}}H_{i}(z)\right]'' & = \beta^{2}N_{i}​e^{−z^{2}/2}\left[H_{i}''​(z)−2zH_{i}'​(z)+(z^{2}−1)H_{i}​(z)\right]
\end{aligned}
$$


Avec l'identité

$$
H''_{n}(z)=2zH_{n}'(z)-2nH_{n}(z)
$$

On abouti à

$$
\varphi_{i}''=\beta^{2}N_{i}e^{-z^{2}/2}(z^{2}-2i-1)H_{i}(z)
$$

$$
\varphi_{i}''=\beta^{2}(\beta^{2}x^{2}-2i-1)\varphi_{i}
$$



On a 

$$
\begin{aligned}
H\varphi_{j} & = -\frac{1}{2} \frac{d^{2}\varphi_{j}}{dx^{2}} + \frac{1}{2}x^{2}\varphi_{j} \\
&=-\frac{1}{2}\beta^{2}((\beta^{2}-1)x^{2}-2j-1)\varphi_{j} \\
&= \frac{1}{2}((1-\beta^{4})x^{2}+\beta^{2}(1+2j))\varphi_{j}
\end{aligned}
$$

#### Calcul de l'intégrale
Le calcul analytique du Hamiltonien permet de calculer analytiquement les intégrales de la méthode de Galerkin. On exploite l'orthonormalité des fonctions de bases. Cependant, on doit travailler un peu pour le terme multiplié par $x^{2}$.

#### Identité

On a 

$$
xH_{n}(x)+ \frac{1}{2}H_{n+1}(x)+nH_{n-1}(x)
$$

On peut aussi l'appliquer aux fonctions d'Hermite  ($\beta =1$) pour aboutir à

$$
x\psi_{n}(x)= \sqrt{ \frac{n}{2} }\psi_{n-1}(x)+\sqrt{ \frac{n+1}{2} }\psi_{n+1}(x)
$$
Comme les fonctions d'Hermite généralisées peuvent s'écrire comme $\varphi_{n}^{\beta}(x) =\frac{1}{\sqrt{ \beta }}\psi(\beta x)$
On a

$$
\begin{align}
(\varphi_{i},H\varphi_{j}) & =\int_{-\infty}^{\infty} \varphi_{i}H\varphi_{j} \, dx  \\
&=\frac{1}{2} (1-\beta^{4})\int_{-\infty}^{\infty} \varphi_{i}\varphi_{j}x^{2} \, dx + \frac{1}{2}\beta^{2}(1+2j)\delta_{ij} 
\end{align}
$$

