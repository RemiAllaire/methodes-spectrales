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

