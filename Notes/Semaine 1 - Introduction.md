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


Pour ce faire, on procède par collocation. On choisit 3 points $\{ x_{1},x_{2},x_{3} \}$ (même nombre que de paramètre/degré liberté) où l'on suppose que $u_{2}$ est exacte, c'est à dire que $R(x_{1})=R(x_{2})=R(x_{3}) =0$. Le choix de ces points constitue un problème crucial afin de minimiser l'erreur. Prenons les 3 points de Chebyshev $\{ -1,0,1 \}$. On obtiens les 3 équations: