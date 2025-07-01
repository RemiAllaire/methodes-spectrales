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
On cherche une solution de la forme polynômiale $u_{2}(x)=1+(1-x^{2})(a_{0}+a_{1}x+a_{2}x^{2})$ afin de respecter les conditions initiales avec 3 degrés de libertés $(a_{0},a_{1},a_{2})$.