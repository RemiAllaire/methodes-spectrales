## 2.1 Séries de Fourier et Tchebychev

Voici la série de Fourier
$$
f(x) = a_{0} + \sum_{n=1}^{\infty}a_{n}\cos(nx)+\sum_{n=1}^{\infty}b_{n}\sin(nx)
$$
avec
$$
\begin{align}
a_{0} &= \frac{\pi}{2}\int_{-\pi}^{\pi}f(x) \\ \\
a_{n }&= \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\cos(nx) \, dx \\ \\
b_{n} &= \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\sin(nx) \, dx
\end{align}

$$
Si $f(x)$ est paire, alors $b_{n} =0$ et si elle est impaire, $a_{n}=0$.

#example2  La série de Fourier de $f(x) = x$ de $[-\pi,\pi]$.

On sait que la fonction est impaire, donc $a_{n} = 0$.
$$
\begin{align}
b_{n} &= \frac{1}{\pi}\int_{-\pi}^{\pi}x\sin(nx) \, dx  \\
&=\frac{1}{\pi} \left[ -\frac{x\cos(nx)}{n} \right]_{-\pi}^{\pi} \\
&= \frac{2(-1)^{n+1}}{n}
\end{align}


$$
Ainsi
$$
f(x) \approx \sum_{n=1}^{\infty}(-1)^{n+1} \frac{2}{n}\sin(nx)
$$
Graphiquement, (voir le script serie de fourier)
![[FourierX.png]]
## 2.3 Ordre de convergence

### Ordre algébrique

Soit $a_{n}$ les coefficients de Fourier, k est ordre de convergence algébrique s'il est le plus grand nombre tel que
$$
\lim_{ n \to \infty } |a_{n}|n^{k} < \infty\quad, n\gg 1
$$
$$
a_{n}\sim O\left( \frac{1}{n^{k}} \right)
$$
Si la limite est $<\infty$ pour tout k, c'est a dire que les coefficients $a_{n}$ decroit plus vite que $\frac{1}{n^{k}},\quad\forall k$. On peut alors parler de convergence 'exponentielle' ou 'spectrale'. Une definition alternative est
$$
a_{n}\sim O(e^{-qn^{r}})
$$
ce qui équivaut a dire
$$
\begin{align}
a_{n}  & \leq ce^{-qn^{r}} \\
a_{n}e^{qn^{r}}  & \leq c 
\end{align}
$$
Donc, les coefficients décroisent plus rapidement que l'exponentiel.

### Ordre exponentiel
Soit $r$ l'ordre de convergence exponentiel. On le calcul:
$$
r = \lim_{ n \to \infty } \frac{\log|\log|a_{n}||}{\log n}
$$
C'est aussi le plus grand exposant tel que
$$
a_{n}\sim O(se^{-qn^{r}})
$$

Le taux de convergence exponentiel est
$$
\lim_{ n \to \infty } \frac{\log|a_{n}|}{n} = 
\begin{cases}
\infty \quad \text{supergeometrique} \\
k \quad \text{geometrique} \\
0              \quad \text{subgeometrique} \\
\end{cases}
$$
En general, les fonctions entieres ont une convergence supergeometrique. Les fonctions ayant des singlularites ou des poles sont geometriques (r=1).

#### Taux asymptotique 
Si une fonction a une convergence geometrique, son taux asymptotique $\mu$ est
$$
a_{n}\sim []e^{-n\mu}
$$
ou
$$
\mu = \lim_{ n \to \infty } \left\{  -\frac{\log|a_{n}|}{n}  \right\}
$$
Pour ressumer, sur un graphique des coefficients de Fourier, on a:![[ordreConvergence.png]]
Si les coefficients oscillent, on peut definir l'enveloppe des coefficients comme etant la courbe qui borne le plus pres les termes des coefficients non nuls.

## Erreur numeriques

### Erreur de troncature
L'erreur lie au fait qu'on ne conserve que les N premiers termes de la serie. Plus theorique.
$$
E_{T}(N)(X)= f(x)-f_{N}(x)=\sum_{n=N+1}^{\infty}a_{n}\phi_{n}(x)
$$
### Erreur de discrétisation
L'erreur lie a l'approximation des coefficients $a_{n}$  (par quadrature) par rapport aux vrais coefficients $\tilde{a}_{n}$. C'est l'erreur numerique.
$$
E_{D}(x) = \sum_{n=0}^{N}(a_{n}-\tilde{a}_{n})\phi_n{(x)}
$$

### Erreur d'interpolation
L'erreur lie au fait qu'on force la somme a etre egale a la fonction (Residu = 0) aux points de collocations. C'est l'erreur pratique


En general, on peut approximer l'erreur de troncature en comparant avec un fonction modele ayant un comportement similaire de la solution cible pour l'equation a resoudre. On mesure l'erreur de troncature apres $N$ termes de cette fonction modele.


#### Règle du pouce 1:
En general, l'ordre de magnitude de l'erreur d'interpolation  et de discrétisation est la meme que celle de troncature. Ainsi, on peut généralement estimer ces deux premieres a l'aide de la fonction modèle. Il faut la considérer en negative. Si l'erreur de troncature d'une méthode est élevée, alors ce n'est pas une bonne technique pour l'equation étudiée.


### Principe de Darboux
Le domaine de convergence (sur le plan complexe) et le taux de convergence du développement en série sont contrôlés par la position et la force de la pire singularité (pôle, point de discontinuité, ... ).

Ainsi plus $f(x)$ est lisse, plus les coefficients spectraux ont tendances a converger rapidement.

#### Corollaire
Si $f(z)$ et $g(z)$ ont la même singularité de même force qui limite le taux de convergence des coefficients spectraux, alors les deux sont asymptotiquement égaux.
De plus, si $f(z)-g(z)$ possède une singularité, alors la différence décroit algébriquement.
Si, $f(z)-g(z)$ n'a pas de singularité, alors différence décroit exponentiellement.

Ainsi, la fonction modèle à choisir pour l'erreur de troncature se doit de posséder les mêmes singularités que la solution recherchée.
Aussi, si la différence entre les deux possède un plus grand domaine de convergence (même si il reste des singularité?), alors la différence décroit aussi exponentiellement.

Il est donc important de comprendre le comportement de quelques fonctions représentatives.


### Domaine de Convergence
Une série spectrales converge sur le plus grand domaine qui ne contient pas de singularité ayant une forme dépendant des fonctions de bases (cercle pour entière, elipse pour tchebyshev, bande infini horizontale pour Fourier).

Même si une fonction est lisse sur $[-1,1] \subset \mathbb{R}$, ce sont les singularités sur le plan complexe qui déterminent le domaine et la vitesse de convergence.

C'est pourquoi le développement en série entière ou de Taylor échouent la plupart du temps. Imaginons, qu'il y a une singularité dans les complexe à une distance de 0.5. Même si la fonction est lisse sur $[-\pi,\pi]$, on ne pourra pas résoudre le problème au frontière. Cependant, les séries de Fourier englobent tous l'axe réel, et Tchebychev possède un domaine de convergence d'une ellipse ayant comme foyer $x \pm 1$ qui inclut toujours l'axe réel $[-1,1


### Singularités pour EDO linéaire
La fonction solution d'une EDO linéaire ne possèdent des singularités seulement là où les coefficients en ont et là où la fonction inhomogène en a. Par exemple pour

$$
u_{xx} + \frac{1}{1-x}u =\frac{1}{1+x}
$$
u ne possède des singularités en $x=1,-1$.


### Vitesse de convergence des coefficients de Fourier selon régularité de f(x) sur le cercle

Si $f^{(k)} \text{ existe et } f^{(i)}(-\pi) = f^{(i)}(\pi)\, i=1,\dots,n$, on peut facilement approximer les coefficients de Fourier par intégration par partie. Par exemple,
$$
\begin{align}
a_n  & = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\cos(nx)\,dx \\
 & =0 - \frac{1}{\pi}\int_{-\pi}^{\pi}-\frac{1}{n}f'(x)\sin(nx)\,dx \\
 & =\dots \\
 & =\frac{(-1)^{[]}}{\pi} \frac{1}{n^{k}}\int_{-\pi}^{\pi}f^{(k)}(\sin/\cos)(nx)\,dx
\end{align}
$$
d'où $a_{n},b_{n}\sim O\left( \frac{1}{n^{k}} \right)$
Si la fonction est régulière (périodique) pour tout k,  on obtient la convergence exponentielle ou spectrale. Ainsi, lorsque que l'on fait le changement de variable $x = \cos(y)$ pour passer de Fourier vers Tchebychev, ça devient automatiquement périodique, (même ce ne l'était  à la base). C'est pourquoi d'ailleurs qu'on obtient la convergence exponentielle pour les séries spectrales de Tchebychev.

#### C'est pourquoi on utilise les polynômes de Tchebychev sur les problèmes non-périodique, et Fourier sur périodique.

Par exemple, étudions la solution de 
$$
u_{x x}+Q(x)u = f(x) \quad u(0)=u(\pi)=0
$$
Les conditions aux frontières n'imposent pas de solutions périodiques. Il serait judicieux de travailler avec les polynômes de Tchebychev, mais continuons avec Fourier pour illustrer ce que produit un mauvais choix de base.

Vu que $u(0) = 0$, il se doit que les coefficients $a_{n}$ qui dépendent de $\cos(nx)$ soient tous nuls. Ainsi, on cherche une solution de la forme
$$
u(x) = \sum_{k=1}^{\infty}b_{n}\sin(nx)
$$
$$
b_{n}=\frac{2}{\pi}\int_{0}^{\pi}u(x)\sin(nx) \, dx
$$
par partie:
$$
\begin{align}
b_{n} & = \left[ -\frac{2}{n\pi}u(x)\cos(nx) \right]_{0}^{\pi}+\frac{1}{n}\frac{2}{\pi}\int_{0}^{\pi}u'(x)\cos(nx)\,dx \\
 & =\frac{1}{n} \frac{2}{\pi}\int_{0}^{\pi}u'(x)\cos(nx) \,dx \\
 & =\left[ \frac{1}{n^{2}} \frac{2}{\pi}u'(x)\sin(nx) \right]_{0}^{\pi}-\frac{1}{n^{2}} \frac{2}{\pi}\int_{0}^{\pi}u''(x)\sin(nx) \,dx \\
 & = -\frac{1}{n^{2}} \frac{2}{\pi}\int_{0}^{\pi}u''(x)\sin(nx) \, dx  \\
 & =\frac{1}{n^{3}} \frac{2}{\pi}[u''(x)\cos(nx)]_{0}^{\pi}-\frac{1}{n^{3}} \frac{2}{\pi}\int_{0}^{\pi}u^{(3)}(x)\cos(nx) \, dx \\
 & =O\left( \frac{1}{n^{3}} \right)
\end{align}

$$
On ne peut pas garantir que $u''(0)=u''(\pi). Ainsi on garantit au moins une convergence d'ordre 3. On remarque que $f(0)=u''(0)$ et $f(\pi) = u''(\pi)$. Ainsi, si $f(0)=f(\pi)$, on arrive a une convergence d'ordre 5.

Ce genre de technique d'intégration par partie peut être aussi effectué pour d'autres bases spectrales.

### Convergence asymptotique: Séries de Fourier
Soit $z_{i} = x +iy$, une  des singularité de $f$ (qui inclut aussi les discontinuité périodique ici). On note
$$
\rho = min|\mathrm{Im}(z_{i})|
$$
Ça correspond à la plus petite distance verticale à l'axe des réels de la singularité sur le plan complexe.
La forme complexe des Fourier (sur plan complexe) s'écrit:
$$
\begin{align}
f(z)  & = \sum_{n=-\infty}^{\infty}c_{n}e^{-inz} \\
 & = \sum_{n=-\infty}^{\infty}c_{n}e^{-inx}e^{ny}
\end{align}

$$
Clairement pour les $n$ négatifs, les y négatifs font exploser la série, et $n$ positifs, y positif fait exploser. Ainsi, faut que $c_{n}$ converge plus rapidement que $e^{ny}$ explose.
[Je ne comprend pas vraiment la justification ici]:
Ainsi, si il y a un pole à $y = \rho$, les termes $c_{n}$ ne pourront pas converger plus rapidement que $e^{n\rho}$. Ainsi, on obtient la convergence exponentielle (de taux $\rho$?) de la série spectrale sur une bande le long de l'axe réel d'une épaisseur de $2\rho$.
*Si la série possède une convergence algébrique, cela implique $\rho =0$, la série de Fourier ne converge que sur les réels* 

## Convergence asymptotique: Tchebychev

Les polynômes de Tchebychev sont défini comme:
$$
T_{n}(\cos \theta)= \cos(n\theta)
$$
Ainsi son développement spectral équivaut au développement de Fourier avec un changement de variable
$$
f(z) = \sum_{n=0}^{\infty}a_{n}T_{n}(z)
$$
$$
f(\cos(\theta)) = \sum_{n=0}^{\infty}a_{n}\cos(n\theta)
$$
On remarque que $f(\cos \theta)$ est périodique de $[-\pi,\pi]$. Par le théorème sur la régularité et la convergence des coefficients de Fourier, on obtient une convergence exponentielle (pourvu qu'il n'il y a pas de singularité entre z=-1 et z =1, c'est pas grave s'il y en a à l'extérieur).

### Erreur de troncature

$$
E_{T}(N)(x) = \sum_{n=N+1}^{\infty}|a_{n}T_{n}(x)|
$$
Mais vu que $T_{n}(x) \in [-1,1]$,
$$
E_{T}(N)(x) \leq \sum_{n=N+1}^{\infty}|a_{n}|
$$
#### Coordonnées elliptique
$$
\begin{align}
x & = \cosh \mu \cos \eta   \\
y & = \sinh \mu \sin \eta
\end{align}
$$
$\mu \in  [0,\infty]$, $\eta =[0,2\pi]$. La trajectoire pour $\mu$ constant est une ellipse avec foyer $z= \pm 1$. La série spectrales converge pour la plus grand ellipse de paramètre $\mu$ ne contenant pas de singularité. La convergence est exponentielle. Cependant, si $\mu=0$, la convergence est seulement sur $[-1,1]$ et la convergence est subgéométrique ou algébrique

À cause de l'effet où l'ellipse stretch, un singularité très près de x = 1, peut définir la même ellipse qu'une singularité loin sur l'axe imaginaire.

Le taux de convergence asymptotique (géométrique) est $\mu$. Si le domaine de convergence est limité par la singularité $z_{0}=x_{0}+iy_{0}$ , alors
$$
\begin{align}
\mu  & = \mathrm{Im}\arccos(x_{0}+iy_{0})  \\
 & =
\end{align}

$$

### Troncation pour séries de Fourier
C'est similaire à Tchebychev, vu que $\cos nx,\sin nx$ sont bornés par 1. On a
$$
\begin{align}
E_{T}(N)(x) \leq \sum_{n=N_{6}6+1}^{\infty}|a_{n}|+|b_{n}
\end{align}


$$
#### Règle pouce 2:
On estime l'erreur de troncature à partir de l'ordre du dernier coefficient estimé.
Ainsi,
$$
E_{T}(N)(x) \sim O(|a_{N}|), O(N|a_{N}|) \, \text{ si algébrique}
$$

#### Règle pouce 3:

Si la solution oscille, soit M sa longueur d'onde, il faut environ 3.5 N (ou polynome) pour bien capter les fluctuations et arriver à une convergence spectrale avec 1% d'erreur.