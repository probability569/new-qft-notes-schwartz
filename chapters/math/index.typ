#import "../macros.typ":*


= Math



== Notation (Read everything or you won't be able to understand later, or come back to it later)
- (Loose) Einstein Summation notation is used in which if an index appears twice in both top and bottom, such as $partial_mu partial^mu$, it is equivalent to summing over said indices such as $sum_(mu in {0,1,2,3}) partial_mu partial^mu$
  - The reason that this is loose is due to the fact that if two indices appear twice in an expression but they are both on the bottom, it is implied that the reader should raise the second appearance of the index. The following is an example so the reader doesn't get confused: $partial_mu partial_mu = partial_mu partial^mu = sum_(mu in {0,1,2,3}) partial_mu partial^mu$
- The _Dirac Delta Function_ is defined as $ delta(x) = cases(0 & "if "x eq.not 0, oo & "if" x =0) $ with $ integral d x space delta(x) = 1 $
This is not, in fact, a function, due to its unorthodox definition. Instead, it is a distribution (it can be defined as the limit of several different distributions, such as the _normal distribution_, a _uniform distribution_, etc.).
- $arrow(x) = x^i$, $i in {1,2,3}$ (spatial components of $x$)
- The _d'Alembertian_ operator $square equiv partial_mu partial^mu$
This operator is useful in _Lagrangians_ and the _Klein-Gordon equation_.
- The _Laplacian_ operator $triangle equiv partial_i partial^i$ where $i in {1,2,3}$

- Natural Units are used in which $planck = c space= 1 $
- Both Sided Derivative:  $pphi^* arrow.l.r(partial_mu) pphi equiv (pphi^*partial_mu pphi - pphi partial_mu pphi^*) $
- Feynman Slash: $feynman(p) equiv p_mu gamma^mu$
- Pauli matrices 
$ sigma^0  = mat(1,;,1), sigma^1 = mat(,1;1,), sigma^2 = mat(,-i;i,), sigma^3 = mat(1,;,-1) $
and $sigma^mu equiv (sigma^0,arrow(sigma))$, $macron(sigma)^mu equiv (sigma^0, -arrow(sigma))$
- $ gamma^mu = mat(, sigma^mu; macron(sigma)^mu,) $ in the Weyl representation


- $macron(psi) equiv  psi^dagger gamma^0$ where $psi$
 is a Dirac spinor



- Left Handed Derivative $ macron(psi) (-i arrow.l(feynman(partial))-m) \ = -i partial_mu macron(psi) gamma^mu - m macron(psi) $ (Derivative acts on the left)
- $k_mu^2 equiv k_mu k^mu$
- $psi^alpha  $ left handed Weyl spinor
- $tilde(psi)_(dot(alpha))$ right handed Weyl spinor
- $psi = mat(psi^alpha;tilde(chi)_(dot(beta)))$ Dirac spinor (Representation of $(1/2,0) plus.o (0,1/2)$)

All of these expressions regarding spinors will be explained or will quickly become evident in Section 2, due to the complexity of their structure.
== Integrals that are useful  

- $  integral dif x space f(x) delta (x^2 -a^2 ) = 1/(2|a|) (f(a)+f(-a)) $
- $ integral dif^3 k space theta(k^0) delta(k_mu^2  - m^2 )  = 1/(2 omega_k)[theta(omega_k) + theta(-omega_k)] = 1/(2 omega_k) $ where $omega_k = sqrt(arrow(k)^2 - m^2) $
- $ integral diff(4,k) exp(i k(x-y)) = delta^4(x-y) $
- $ integral diff(N,k) exp(i k(x-y)) = delta^N (x-y) $

- $ integral dif x exp(-1/2 a x^2 + J x) = ((2 pi)/a)^(1/2) exp(J^2/(2a)) $

== Group Theory
#definition[
  A Group $G$ is a set of elements ${g_i} in G$ and a rule $g_i times g_j = g_k$ giving how they "multiply."
]

#rules("Group Theory Axioms")[
- For each element $g_i in G$ and $g_j in G$, their product $g_i times g_j = g_k in G$ is an element of $G$
- Products must be Associative: $ (g_i times g_j) times g_k = g_i times (g_j times g_k) $
- There must be an Identity: $ bb(1) times g_i = g_i times bb(1) = g_i $
- Elements have an Inverse: $ g^(-1)_i times g_i  = bb(1) $
]
#definition("Representation")[
  An embedding of $g_i$ as operators in a vector space
]
- Matrices are finite-dimensional representations of a group

#definition("Faithful Representation")[
  Each element in a group gets its own matrix
]

=== Lie Groups 
- A Group $G$ whose elements can be written as $ g_i = exp(i c^g_i lambda_i)$ for some number $c^g_i$ and some matrix $lambda_i$ (known as a _generator_)

- In an algebra, you can add and multiply
- In a Group, you have to follow the previously mentioned rules (just multiplication is allowed)

#definition("Lie Group")[
  A _Lie Group_ is a type of group with an infinite number of elements and a finite number of generators.
]
#definition("Lie Algebra")[
  The Generators of a _Lie group_ form a _Lie Algebra_.
]


#example("Lie Algebras")[
  - QED : $"U"(1)$ (unitarity)
  - Weak: $"SU"(2)$ (special unitarity)
  - Strong: $"SU"(3)$ 
  - Lorent Group: $"O"(1,3)$ (orthogonal and preserving (1,3) metric) (see $section 2.2$)
]
