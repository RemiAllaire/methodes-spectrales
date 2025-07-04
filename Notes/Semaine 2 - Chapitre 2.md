# Séries de Fourier et Tchebychev

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
$$
\sum_{n=1}^{\infty}\int  \, dx
$$
$$
g(\xi + \pi) = g(\xi) + g'(\xi)h + g''(\xi) \frac{h^{2}}{2!} + \dots
$$