#import "../macros.typ":*

= QCD


== Non Abelian Gauge Theories

- Non Abelian gauge theories are the fundamentals of QCD (in fact, they ARE Quantum Chromodynamics).
  - We need to establish quite a bit more formal background in order to do actual physics, otherwise nothing would make sense 

=== Lie Groups and Lie Algebras
#definition("Non Abelian Gauge Group")[
  - Suppose that you have a representation of a Lie Group, written as $ R(G) = #qft(```latex
U = \exp(i \theta^a T^a)
```) $
  - $theta^a$ is a number
  - $T^a$ are the group generators for the _Lie Algebra_ that generates the _Lie Group_ $G$. 

  - The generators $T^a$ satisfy the commutation #qft(```latex
[T^a, T^b] = i f^{abc} T^c
```)
  - If $f^(a b c) = 0$, the gauge group $G$ is abelian
  - If $f^(a b c) != 0$, the gauge group $G$ is _non abelian_
]

- The commutation relations $[dots]$ are a mapping $cal(G) times cal(G) -> cal(G)$, without having to have a well-defined product
  - In the special case that a product is well defined, $[A,B] = A B - B A$

- Note: The *Jacobi Identity* must be satisfied regardless of the product being well defined
  - $ #qft(```latex
[A, [B, C]] + [B, [C, A]] + [C, [A, B]] = 0
```) $ 

  - By the Jacobi Identity, #qft(```latex
f^{abd} f^{dce} + f^{bcd} f^{dae} + f^{cad} f^{dbe} = 0
```)

#definition("Ideal")[
  - An _ideal_ subalgebra $frak(I) subset frak(g)$ is one that satisfies $[s,i] in frak(I) forall g in frak(g), i in frak(I)$
]
#definition("Simple")[
  - A simple Lie Algebra $frak(g)$ is one that has no trivial _ideal_ subalgebras
]
#example("Simple Lie Algebras")[
  - Very common Simple Lie Groups/Algebras are $frak(s o)(N)$ and $frak(s u)(N)$
  - There is also the simplectic group $frak(s p)(N)$
  - All of these you will soon see
]

#definition("Semisimple")[
  - A semisimple Lie algebra $frak(g)$ is one that can be expressed as the direct sum of simple Lie Algebras $frak(g_1), frak(g_2), dots, frak(g_n)$
    - That is, $ frak(g) = frak(g_1) plus.o frak(g_2) plus.o frak(g_3) plus.o dots plus.o frak(g_n) $

]

- The standard model is a very common example of a Semisimple Lie Group
  - The Lie group for the Standard model is $ G_"SM" ="SU"(3) times.o "SU"(2) times.o U(1) $
  - The Lie algebra for the Standard model is $ frak(g)_"SM" = frak(s u)(3) plus.o frak(s u)(2) plus.o frak(u)(1) $

#theorem("Hermicity")[
  - _All finite dimensional representations of semisimple Lie algebras are hermitian_
]

#proof("Hermicity")[
  - Unfortunately I have tried and failed to prove it, so at this point i cannot provide a proof
]

#definition("Unitary Groups")[
 - A unitary group is a group who's representation satisfies $ braket(arrow(psi),arrow(chi)) = mel(arrow(psi), U^dagger U, arrow(chi)) $
  - i.e. the inner product is conserved
 - This directly implies that $U^dagger U = bb(1)$
]

- Elements of $"SU"(N)$ have determinant 1
  - In general, matrix representations of unitary groups always have determinant $1$ due to their being unitary
- The group $"SU"(N)$ is defined by its action upon $N$ dimensional vector spaces
  - $ U = exp(i theta^a T^a) $
      - In $"SU"(N)$, $T^a$ are always hermitian
  - There are $N^2 -1$ generators for $"SU"(N)$
    - This implies that the dimension $d(G)$ is equal to $d(G) = N^2 -1$
#definition("Orthogonal Group")[
  - Orthogonal groups preserve a strictly real inner product

  - $V dot W = V dot O^T dot O dot W$
  - This directly implies that $O^T O = bb(1)$

]
- The dimension of an orthogonal group $"SO"(N)$ is $d("SO"(N)) = 1/2 d("SU"(N)) = 1/2 N(N-1)$
  - This is due to the fact that there are half as many generators for orthogonal groups due to their strict realness

- All elements of an orthogonal group (not special orthog.) have determinant $det(O) = plus.minus 1$
  - In $"SO"(N)$, the matrices are the ones with $det(O) = plus 1$
  - This has no impact on the dimension of the group

#definition("Simplectic Group")[
  - Symplectic groups $"Sp"(N)$ are defined via preserving a quaternionic inner product
  - They satisfy $ Omega S = - S^T Omega $ where $S in "Sp"(N)$ and $
#qft(```latex
\Omega = \begin{pmatrix} 0 & \mathbb{I} \\ -\mathbb{I} & 0 \end{pmatrix}
```) $

]
- There are, finally, the _exceptional_ simple groups $G_2, F_4, E_6, E_7, E_8$ which are of no use to standard model particle physics

- The _Only_ finite dimensional simple Lie Algebras are the algebras for the exceptional simple groups and $frak(s o)(N), frak(s u)(N), frak(s p)(N)$

=== Representations

- Consider representations of $"SU"(N)$ groups 
- Free theories of $N$ fields are invariant under $"U"(1) times "SU"(N)$
  - Since $"SU"(N)$ is simply connected, any representation of $"SU"(N)$ is one to one representation of $exp(frak(s u)(N))$

#example("Two Fields")[
  - Consider 2 fields $pphi_1, pphi_2$ with a kinetic lagrangian 
  $ #qft(```latex
\mathcal{L}_{kin} = (\partial_\mu \phi_1^*)(\partial_\mu \phi_1) + (\partial_\mu \phi_2^*)(\partial_\mu \phi_2) = (\partial_\mu \vec{\phi})^\dagger (\partial_\mu \vec{\phi})
```) $
  - We can write #qft(```latex
\vec{\phi} = \begin{pmatrix} \phi_1 \\ \phi_2 \end{pmatrix}
```)
    - This is invariant under a global $"SU"(2)$ symmetry $arrow(pphi) -> U arrow(pphi)$
  - Generally, as we have seen, we can write #qft(```latex
U = \exp \left[ i (\alpha_1 \tau_1 + \alpha_2 \tau_2 + \alpha_3 \tau_3) \right] = \exp(i a^a \tau^a) \\
w/ \tau^a = 1/2 \sigma^a
```)
  - Such $tau^a$ satisfy #qft(```latex
\tau^a : [\tau^a, \tau^b] = i \epsilon^{abc} \tau^c
```) 
  - This provides $f^(a b c) = epsilon^(a b c)$
]

#definition("Fundamental")[
  - A fundamental representation is the smallest non trivial representation of a Lie Algebra
]

- For $"SU"(N)$, the fundamental representation is the set of $N times N$ hermitian matricians with determinant $1$

- Under the fundamental representation, a set of $N$ fields transform (infinitesimally) as #qft(```latex
\phi_i \to \phi_i + i \alpha^a (T^a_{\text{fund}})_{ij} \phi_j
```) for some $alpha^a in RR$

#definition("Anti-fundamental Representation")[
  - #qft(```latex
T^{a}_{\text{anti-fund}} = -\left(T^{a}_{\text{fund}}\right)^{*}
```)
  - The anti-fund representation of a group is the conjugate of the fundamental representation
  - Notice that there is a minus sign in order to preserve the law $[T^a,T^b] = i f^(a b c) T^c$
]
- Therefore, the infinitesimal transformation law for anti-fundamental is #qft(```latex
\phi_i^* \to \phi_i^* + i \alpha^a (T_{\text{anti-fund}}^a)_{ij} \phi_j^* = \phi_i^* - i \alpha^a \phi_j^* (T_{\text{fund}}^a)_{ji}
```)

#note("Indices")[
- Mid latin alphabet $i,j$ are used to index color
]

- In order to determine the generators for a theory, we expand around $bb(1)$
  - In $"SU"(2)$, the generators are $sigma^mu$
  $  T^a = tau^a equiv sigma^a /2 $
  - In $"SU"(3)$, the generators are _eight_ (not $3 times.o overline(3) = 9$) *gellmann matrices* (such that $T^a = lambda^a /2$) which are as follows:
#align(center)[
  $
  lambda_1 &= mat(0, 1, 0; 1, 0, 0; 0, 0, 0)
  & quad
  lambda_2 &= mat(0, -i, 0; i, 0, 0; 0, 0, 0) \
  \
  lambda_3 &= mat(1, 0, 0; 0, -1, 0; 0, 0, 0)
  & quad
  lambda_4 &= mat(0, 0, 1; 0, 0, 0; 1, 0, 0) \
  \
  lambda_5 &= mat(0, 0, -i; 0, 0, 0; i, 0, 0)
  & quad
  lambda_6 &= mat(0, 0, 0; 0, 0, 1; 0, 1, 0) \
  \
  lambda_7 &= mat(0, 0, 0; 0, 0, -i; 0, i, 0)
  & quad
  lambda_8 &= 1/sqrt(3) mat(1, 0, 0; 0, 1, 0; 0, 0, -2)
  $
]
- Normalization of $f^(a b c)$ is arbitrary in QCD/non abelian gauge theory.
- A commonly used convention for normalization (in physics) is #qft(```latex
\sum_{c,d} f^{acd} f^{bcd} = N \delta^{ab}
```)
  - In math, the convention is #qft(```latex
\sum_{c,d} f^{acd} f^{bcd} = \delta^{ab}
```)
- The fixing the normalization of structure constants implies that the normalization of generators is fixed _in all representations_
- For representations, #qft(```latex
[T^a, T^b] = i f^{abc} T^c
```) must hold when $f^(a b c)$ is the same
  - Notice that this equation is not invariant under a rescaling of $T^c_R$

- Normalization of $"SU"(N)$:
  - It is normalized s.t. #qft(```latex \text{tr}(T^a T^b) = \frac{1}{2} \delta^{ab}
```)
- In a general lie algebra, $[T^a,T^b]$ is well defined and $T^a T^B$ is not (as seen before)
  - In the fundamental representation of $"SU"(N)$, such generators, in fact, can be multiplied
  - #qft(```latex
T^a T^b = \frac{1}{2N} \delta^{ab} + \frac{1}{2} d^{abc} T^c + \frac{1}{2} i f^{abc} T^c
```)
  - #qft(```latex
d^{abc} = 2 \operatorname{tr} \left[ T^a \{ T^b, T^c \} \right]
```)
- In $"SU"(N)$, there is a unique $d^(a b c)$ up to a constant
  - In $"SU"(2)$, $d^(a b c) = 0$

- Some useful trace identities for generators are the following: #qft(```latex
\text{tr}\left[T^a T^b T^c\right] = \frac{1}{4}\left(d^{abc} + if^{abc}\right) \\
\text{tr}\left[T^a T^b T^c T^d\right] = \frac{1}{4N}\delta^{ab} + \frac{1}{8}\left(d^{abe} + if^{abe}\right) \times \left(d^{cde} + if^{cde}\right)
```)

#definition("Adjoint Representation")[
  - The adjoint representation is the group acting upon its own elements
  - Extremely formally $ "Ad" : G -> "GL"(frak(g)) $ with $G$ an element of a Lie group, $frak(g)$ an element of a Lie algebra, and $"GL"$ being the group of invertible matrices
  - If the lie group generated by a lie algebra is $e^X$, then $"Ad"_A (X) = A X A^(-1)$ with $A in G$.
]
- The adjoint representation amounts to acting upon the space that is spanned by the generators, as you have seen
- In $"SU"(N)$, there are $N^2 -1$ generators and hence there are $N^2 -1$ dimensions for the adjoint representation
- Matrices in the adjoint representation are given by $(T^a_("adj"))^(b c) = -i f^(a b c)$
  - For $"SU"(2)$, the matrices are #qft(```latex
T^1_{adj} = \begin{pmatrix} 0 & 0 & 0 \\ 0 & 0 & -i \\ 0 & i & 0 \end{pmatrix}, T^2_{adj} = \begin{pmatrix} 0 & 0 & i \\ 0 & 0 & 0 \\ -i & 0 & 0 \end{pmatrix}, T^3_{adj} = \begin{pmatrix} 0 & -i & 0 \\ i & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}
```)
- In $"SU"(3)$, they are $8 times 8$ matrices as you may be able to guess
- _Gauge fields transform in the adjoint representation_

#definition("Casimirs")[
  - Casimirs are used to "characterize representations" @schwartz2014quantum
]
#definition("Quadratic Casimir")[
- The Quadratic Casimir is defined via $ (sum_a) T^a_R T^a_R = C_2 (R) bb(1) $
]

#theorem("Schur's Lemma")[
  - Group elements that commute with all other elements are proportional to $bb(1)$
]
- This theorem is extremely nontrivial. You can see a proof in @hall2015lie

- I am, however, able to provide a proof on why the $T^a T^a$ commutes with everything $ #qft(```latex
\left[ T^a_R T^a_R, T^b_R \right] = \left( i f^{abc} T^c_R \right) T^a_R + T^a_R \left( i f^{abc} T^c_R \right)
```) = #qft(```latex
-if^{abc} \{T^c_R, T^a_R\} = 0
```) $

- Evaluating quadratic Casimirs involve choosing generators such that #qft(```latex
f_r \left[ T^a_p, T^b_p \right] = T(R)^ab
```)
  - $T(R)$ is known as the _index_

- In the fundamental representation, the convention implies that
  - $T("fund") equiv T_F = 1/2$ since (T^a_(i j) T^b_(i j) = 1.2 delta^(a b))
- In the adjoint representation, $T("adj") equiv T_A = N$
  - This is due to the fact that $f^(a c d) f^(b c d) = N delta^(a b)$

- Setting $a=b$ and summing over $a$ for the definition of $T(R)$ yields
  - $ d(R) C_2 (R) = T(R) d(G) $
    - $d(R)$ is the dimension of the representation
    - $d(G)$ is the dimension of the group

- Fundamental Casimir:

  - #qft(```latex
C_F = C_2(fund) = \frac{N^2 - 1}{2N}
```)
  - In $"SU"(2)$, $C_F = 3/4$
  - In $"SU"(3)$, $C_F = 4/3$
- Adjoint Casimir:
  - $C_A equiv C_2 ("adj") = N$
  - Generally, terms in YM theories will contain at least some factors of $C_F$ and $C_A$

- For any representation, #qft(```latex
\text{tr}([T^a_R, T^b_R] T^c_R) = i f^{abc} \text{tr}(T^d_R T^d_R) = i f^{abc} T(R)
```)
  - This implies that #qft(```latex
f^{abc} = -\frac{i}{T_F} \text{tr} \left( [t^a, t^b] t^c \right)
```)

- In $"SU"(N)$, the _Fierz Identity_ is satisfied:
  - #qft(```latex
\sum_{a} T_{ij}^{a} T_{kl}^{a} = \frac{1}{2} \left( \delta_{il} \delta_{jk} - \frac{1}{N} \delta_{ij} \delta_{kl} \right)
```)
  - Since generators in $"SU"(N)$ are traceless, the sum over $delta^(i j)$ and $delta^(k l)$ yields zero
  - Hence, #qft(```latex
\text{tr}[T^a A] \text{tr}[T^a B] = \frac{1}{2} [\text{tr}(AB) - \frac{1}{N} \text{tr}(A) \text{tr}(B)]
```)

#definition("Anomaly Coefficient")[
- An anomaly coefficient $A(R)$ is defined by the equation #qft(```latex
\text{tr}\left[T^a\{T^b, T^c\}\right] = \frac{1}{2}A(R)d^{abc} = A(R)\text{tr}\left[T^a\{T^b, T^c\}\right]
```)

]

== Wilson Lines

=== Abelian Wilson Lines

- The motivation between wilson lines is a want for telling if $pphi(x) = pphi(y)$ (some how)

- Notice that one cannot simply take the difference since #qft(```latex
\phi(x) - \phi(y) \to e^{i\alpha(x)} \phi(x) - e^{i\alpha(y)} \phi(y)
```)

  - It is additionally impossible to take any notion of $partial_mu pphi$ due to derivative definition based on differences

#definition("Wilson Line")[
  - A wilson line $W(x,y)$ is something that transforms as $ W(x,y) -> e^(i alpha(x)) W(x,y) e^(- i alpha(y) )$
    - This is a "bi-local transformation" @schwartz2014quantum
]

- A key feature of Wilson lines is that they satisfy the property #qft(```latex
W(x,y) \phi(y) - \phi(x) \to e^{i\alpha(x)} W(x,y) e^{-i\alpha(y)} e^{i\alpha(y)} \phi(y) - e^{i\alpha(x)} \phi(x) \\
= e^{i\alpha(x)} (W(x,y) \phi(y) - \phi(x))
```)

- Taking $y^mu = x^mu + delta x^mu$, we can obtain the derivative via  #qft(```latex
D_\mu \phi(x) \equiv \lim_{\delta x^\mu \to 0} \frac{W(x, x+\delta x) \phi(x+\delta x) - \phi(x)}{\delta x}
```)
  - This gives a transformation law that we expect #qft(```latex
D_\mu \phi(x) \longrightarrow e^{i\alpha(x)} D_\mu \phi(x)
```)

- Writing the wilson line in terms of a perturbation, $ W(x,x + delta x) = 1 - e delta x^mu A_mu (x) + cal(O)(delta x^2) $
  - This gives, as we expect, the abelian gauge transformation #qft(```latex
A_{\mu}(x) \to A_{\mu}(x) + \frac{1}{e} \partial_{\mu} \alpha(x)
```)
  - The Guage field is a connection

- This provides the abelian covariant derivative #qft(```latex
D_{\mu} \phi(x) = \partial_{\mu} \phi(x) - i e A_{\mu} \phi
```)
- The _closed-form_ for the wilson line is written as #qft(```latex
W_P(x, y) = \exp\left(ie \int_y^x A_\mu(z) dz^\mu\right)
```)
  - Notice that this is a line integral
  - This is the true Wilson Line
- Parametrizing the wilson line with $z^mu (lambda)$ such that $0<= lambda <= 1$ and $z^mu (0) = y^mu, z^mu (1) = x^mu$, we obtain that #qft(```latex
W_P(x,y) = \exp\left(ie \int_0^1 \frac{dz^\mu(\lambda)}{d\lambda} A_\mu(z(\lambda)) d\lambda\right)
```)
- We can test how this behaves under a gauge transformation
  - #qft(```latex
W_P(x,y) \to \exp\left[ie\int_y^x A_\mu(z)dz^\mu + i\int_y^x \partial_\mu \alpha(z)dz^\mu\right] \\ = e^{i\alpha(x)} W_P(x,y) e^{-i\alpha(y)}
```)
  - This behaves correctly from our definition of a Wilson line

- Wilson Loops:
  - Setting $x=y$, we obtain that #qft(```latex
W_P^{\text{loop}} = \exp\left(ie \oint_P A_\mu dx^\mu\right)
```)
- Via stokes' theorem, #qft(```latex
W_{p}^{loop} = \exp\left(i \frac{e}{2} \int_{\Sigma} F_{\mu\nu} d\sigma^{\mu\nu}\right) = 1 + i \frac{e}{2} \int_{\Sigma} F_{\mu\nu} d\sigma^{\mu\nu} + \mathcal{O}(e^2)
```) where $sigma^munu$ is a surface element

- Notice that now the wilson line only depends on the field tensor $F^munu$ (this should not be surprising since it depends on the gauge field)
- Checking the transformation for the commutator $[D_mu,D_nu]$, we obtain #qft(```latex
[D_\mu, D_\nu] \phi(x) \to e^{i\alpha(x)} [D_\mu, D_\nu] \phi(x)
```)
  - therefore, we obtain #qft(```latex
[D_\mu, D_\nu] \phi(x) = ([\partial_\mu, \partial_\nu] - ie[\partial_\mu, A_\nu] + ie[\partial_\nu, A_\mu]) \phi(x) = -ie F_{\mu\nu}(x)
```)
  - Hence, we can define the EM field tensor as #qft(```latex
F_{\mu\nu}(x) = \frac{i}{e} [D_\mu, D_\nu]
```)

=== Non Abelian Wilson Lines

- We would like to repeat the same process as we did with abelian wilson lines
  - Lagrangians have more symmetry than just phase rotation in non abelian theories (by definition)

- Consider the kinetic lagrangian with $N$ particles #qft(```latex
\mathcal{L}_{kin} = \sum_{j=1}^{n} \bar{\psi}_j (i\not\partial - m) \psi_j
```)
  - This has a global $"SU"(N)$ symmetry
- Such particles transform as #qft(```latex
\psi_i \to (e^{i\alpha^a T^a})_{ij} \psi_j
```)
  - $alpha^a$ is not a function of $x$ for global symmetries

#definition("Non Abelian Wilson Line")[
  - We are now motivated to write #qft(```latex
W_P(x, y) = P \left\{ \exp \left( ig \int_y^x A_\mu^a(z) T^a dz^\mu \right) \right\}
```) where $P$ is path ordering
    
]

- The Taylor expansion of the wilson line is #qft(```latex
W_P(z, y) = 1 + ig \int_0^1 \frac{dz^\mu(\lambda)}{d\lambda} A_\mu^a(z(\lambda)) T^a d\lambda \\ - \frac{1}{2} g^2 \int_0^1 d\lambda \int_0^1 d\tau \frac{dz^\mu(\lambda)}{d\lambda} \frac{dz^\nu(\tau)}{d\tau} A_\mu^a(z(\lambda)) A_\nu^b(z(\tau)) (T^a T^b \theta(\lambda - \tau) + T^b T^a \theta(\tau - \lambda)) + \dots
```)
- Under a gauge transformation #qft(```latex
W_P(x,y) = e^{i \alpha^a(x) T^a} W_P(x,y) e^{-i\alpha^a(y) T^a}
```) which definitely looks correct
- We are motivated to define a variable $underline(A_mu) equiv A_mu^a T^a$
  - This gives #qft(```latex
W_P(x,y) = P \left\{ \exp \left( ig \int_{y-x}^{x} \underline{ A_\mu(z)} dz^\mu \right) \right\}
```)

- An infinitesimal transformation for $W$ is #qft(```latex
W(x^\mu, x^\mu + \delta x^\mu) = 1 + i \epsilon \underline{A_\mu} \delta x^\mu
```)

- Local transformations can be expressed in terms of #qft(```latex
U(x) = e^{i \alpha^a(x) T^a}
```)
  - In $"SU"(N)$, $U^dagger (y) = U(y)$
- Then, $ #qft(```latex
\vec{\psi} = U(x) \cdot \vec{\psi}(x)
```) \ #qft(```latex
W(x, y) \to U(x) W(x, y) U^\dagger(y)
```) $

- We would like to analyze what happens to the gauge field under such a transformation

  - Consider how the covariant derivative transforms: #qft(```latex
D_\mu \vec{A} \to U \cdot D_\mu \vec{A}
```)

- Therefore, we have that #qft(```latex
(\partial_\mu - ig \underline{ A'_\mu}) U \psi = U (\partial_\mu - ig  \underline{A_\mu}) \psi
```) where $underline(A_mu)$ is the transformed $A_mu$

- Therefore, the transformation for $A_mu^a$ is #qft(```latex
A_{\mu}^{a}(x) \to A_{\mu}^{a}(x) + \frac{1}{g} \partial_{\mu} \alpha^{a}(x) - f^{abc} \alpha^{b}(x) A_{\mu}^{c} + O(\alpha^2)
```)

- The covariant derivative commutator transforms as #qft(```latex
[D_\mu, D_\nu] \psi(x) = (-ig(\partial_\mu \underline{ A_\nu} - \partial_\nu \underline{ A_\mu}) - g^2 [\underline{A_\mu}, \underline{A_\nu]}) \psi(x)
```)
  - This allwos for a definition of the _gluon field tensor_: #qft(```latex
\underline{F_{\mu\nu}} \equiv \frac{i}{g} [D_\mu, D_\nu] = (\partial_\mu \underline{A_\nu} - \partial_\nu \underline{A_\mu}) - ig [\underline{A_\mu}, \underline{A_\nu}] \\
\underline{F_{\mu\nu}} = F_{\mu\nu}^a T^a
```)
  -$ #qft(```latex
F_{\mu\nu}^a = \partial_\mu A_\nu^a - \partial_\nu A_\mu^a + g f^{abc} A_\mu^b A_\nu^c
```) $
- The transformation law for the field tensor is #qft(```latex
F_{\mu\nu}^a \to F_{\mu\nu}^a - f^{abc} \alpha^b F_{\mu\nu}^c
```) which is the same whether or not $alpha$ is global or local
  - This is because #qft(```latex
F^{\alpha}_{\mu\nu} = -F^{\alpha}_{\nu\mu}
```)

- Kinetic terms in the lagrangian only depend on $F^a_munu$

  - The $"SU"(N)$ lagrangian is #qft(```latex
\mathcal{L} = -\frac{1}{4} (F_{\mu\nu}^a)^2 + \sum_{i,j=1}^N \bar{\psi}_i (i \delta_{ij} \not\partial + g A_\mu^a T_{ij}^a - m \delta_{ij}) \psi_j
```)
  - In this lagrangian, $g$ acts as $-e$

- There is an extra term that is consistent with gauge invariance that can be added to this lagrangian:
#qft(```latex
\mathcal{L}_{\theta} = \theta \varepsilon^{\mu\nu\alpha\beta} F_{\mu\nu}^{\alpha} F_{\alpha\beta}^{\alpha} = 2\theta \partial_{\mu} (\varepsilon^{\mu\nu\alpha\beta} A_{\nu}^{\alpha} F_{\alpha\beta}^{\alpha})
```)
  - Notice that this is a total derivative, hence it does not contribute perturbatively

  - There should be non perturbative effects that this term adds (the lack of them is known as the _strong CP problem_)

- I claim that there is no conserved current for this lagrangian

- Consider the expansion of the lagrangian #qft(```latex
\mathcal{L} = -\frac{1}{4} (\partial_\mu A_\nu^a - \partial_\nu A_\mu^a + g f^{abc} A_\mu^b A_\nu^c)^2 + \bar{\psi}_i (i \delta_{ij} \gamma^\mu \partial_\mu + g \gamma^\mu A_\mu^a T_{ij}^a - m \delta_{ij}) \psi_j
```)
  - The EoM for this lagrangian are #qft(```latex
\partial_\mu F_{\mu\nu}^a + g f^{abc} A_\mu^b F_{\mu\nu}^c = -g \bar{\psi}_i \gamma_\nu T_{ij}^a \psi_j \quad (\text{Gauge})
```) and #qft(```latex
-(i\not{\partial}-m)\psi_i = -g \not{A^a} T^a_{ij} \psi_j \quad \quad (\text{Ferm.})
```)

- The global symmetries for this are #qft(```latex
\psi_i \to \psi_i + i \alpha^a T^a_{ij} \psi_j \\
A_\mu^a \to A_\mu^a - f^{abc} \alpha^b A_\mu^c
```)

  - By Noether's theorem, #qft(```latex
J_\mu = \sum_n \frac{\partial L}{\partial (\partial_\mu \phi_n)} \frac{\delta \phi_n}{\delta \alpha}
```)

- In a non abelian theory, there are $N^2 -1$ currents
  - Summing ovr $psi_i$ and $A^a_mu$ provides #qft(```latex
J^\mu_m = -\bar{\psi}_i \gamma^\mu T^a_{ij} \psi_j + f^{abc} A^b_\nu F^{\mu\nu}_c
```)

- Notice, however, that this current is gauge invariant. 
  - Hence, it is not physical

- We can try and create a matter current #qft(```latex
j^a_\mu = - \bar{\psi_i} \gamma^\mu T^a_{ij} \psi_j
```)
  - This satisfies #qft(```latex
D_\mu j^a_\mu = 0
```)
  - It Still doesnt satisfy $partial_mu j_mu^a = 0$

#theorem("Weinberg Witten theorem")[
  - A non abelian symmetry for massless spin 1 implies that there is no gauge invariant conserved charge
]


=== The Gluon Propagator

==== F-P ghosts
#rules("Summary")[
  - There is a lot of math and a lot of unseen math in this section so it may be impossible to read
  - The summary for this section is tha the Lagrangian for QCD involves ghosts which are unphysical and not gauge invariant 
  - The QCD lagrangian that we derive is 
]

- To Start, let us consider the equations of motion for a photon with an external current#qft(```latex
(g_{\mu\nu} \Box - \partial_\mu \partial_\nu) A_m = J_\nu
```)
  - This is not invertible, similar to the gluon equation of motion
#trick[
  We can introduce (and have introduced) a term into the lagrangian of the form #qft(```latex
\frac{1}{2 \xi} (\partial_\mu A_\mu)^2
```)
]
- This gives us, in the path integral approach of QFT, #qft(```latex
f(\xi) = \int \mathcal{D}\pi \, e^{-i \int d^4x \, \frac{1}{2\xi} (D\pi)^2} = \int \mathcal{D}\pi \, e^{-i \int d^4x \, \frac{1}{2\xi} (D\pi - \partial_\mu A_\mu)^2}
```)
  - This is independed of $A_mu$ since we can take $pi -> pi - 1/square partial_mu A_mu$

- Therefore, we obtained #qft(```latex
\int \mathcal{D}A_\mu \mathcal{D}\phi_i e^{i \int d^4x L[A, \phi_i]} = \frac{1}{f(\xi)} \int \mathcal{D}\pi \mathcal{D}A_\mu \mathcal{D}\phi_i e^{i \int d^4x (L(A, \phi_i)  - \frac{1}{2\xi}(\partial_\mu A^\mu)^2)} \\ = \left[ \frac{1}{f(\xi)} \int \mathcal{D}\pi \right]  \int \mathcal{D}A_\mu \mathcal{D}\phi_i e^{i \int d^4x (L[A, \phi_i] - \frac{1}{2\xi}(\partial_\mu A^\mu)^2)}
```) in QED

- We want to do a similar thing for $bb("QCD") $ 
  - The gauge transformation is #qft(```latex
A_{\mu}^{a} \to A_{\mu}^{a} + \frac{1}{g} \partial_{\mu} \alpha^{a} + f^{abc} A_{\mu}^{b} \pi^{c}
```)
- Notice that there are $N^2 -1$ $pi^a$ fields due to them transforming in the adjoint represention

- Since $pi^a$ transforms in the adjoint rep we can write #qft(```latex
A_{\mu}^{a} \to A_{\mu}^{a} + \frac{1}{g} D_{\mu} \pi^{a}
```) where the adjoint covar. derivative is #qft(```latex
D_\mu \pi^a = \partial_\mu \pi^a + g f^{abc} A_\mu^b \pi^c
```)

- We now have the machinery to write a functional #qft(```latex
f[A] = \int D\pi \exp \left[ -i \int d^4x \frac{1}{2\xi} (\partial_\mu D_\mu \pi^a)^2 \right]
```)

"Tickle Tip"
- Define $alpha^a [A]$ s.t. #qft(```latex
\partial_\mu A_\mu^a = \frac{1}{g} \partial_\mu D_\mu^a \alpha^a[A]
```)

- Therefore, #qft(```latex
f[A] = \int \mathcal{D}\pi \exp \left[ -i \int d^4x \frac{1}{2\xi} (\partial_\mu A^\alpha_\nu - \partial_\nu A^\alpha_\mu)^2 \right]
```)

- This allows us to obtain the full path integral #qft(```latex
\int DA D\phi_i e^{i \int d^4x L(A, \phi_i)} \\
= \int D\pi DA D\phi_i \frac{1}{f[A]} \exp\left(i \int d^4x L(A, \phi_i) - \frac{1}{2\xi} (\partial_\mu A^\mu - \partial_\mu A^\mu)^2\right) \\
= \left( \int \mathcal{D}\pi \right) \int \mathcal{D}A \mathcal{D}\phi_i \frac{1}{f[A]} \exp\left(i \int d^4x L(A, \phi_i) - \frac{1}{2\xi} (\partial_\mu A^\mu)^2\right)
```)



- We now wish to rewrite $f[A]$ (?)
  - #qft(```latex
f = \sqrt{\frac{1}{\det(\partial_\mu D_\mu)^2}} \times \text{const.}
```)

- Then, #qft(```latex
Z[0] = \text{const} \times \int \mathcal{D}A_m \mathcal{D}\phi_i \left( \det(\mathcal{M}_{mn}) \right) \\ \times \exp \left\{ i \int d^4x \left[ \mathcal{L}(A, \phi_i) - \frac{1}{2\xi} (\partial_\mu A^a_m)^2 \right] \right\}
```)
#derivation("Gaussians")[
- We can use identities for gaussians to write #qft(```latex
\det(\partial^\mu D_\mu) = \int \mathcal{D}\bar{c} \mathcal{D}c \exp\left(i \int d^4x \, \bar{c} (-\partial^\mu D_\mu) c\right)
```)
  - The identity involved in this is #qft(```latex
\det(\mathcal{O}) = \int \mathcal{D}\bar{\psi} \mathcal{D}\psi \exp\left(-i \int \bar{\psi} \mathcal{O} \psi\right)
```)
]

- Hence, we obtain the result that #qft(```latex
Z[c] = \text{const.} \times \int \mathcal{D}A_\mu \mathcal{D}\phi \mathcal{D}\bar{c} \mathcal{D}c \\ \times \exp \left\{ i \int d^4x \left[ L(A, \phi) - \frac{1}{2\xi} (\partial_\mu A^\mu)^2 - \bar{c}^a \partial^\mu D_\mu c^a \right] \right\}
```)

- We have obtained a very bad result:

#result[
  - In QCD, as a result of trying to find a gluon propagator, we find these annoying things called Fadeev-Popov ghosts and antighosts
  - They pop up out of nowhere and are not gauge invariant
    - They are aphysical clearly
]

- The Lagrangian must (and I mean must unless you are willing to work in a obnoxious gauge) be written with these in mind

#qft(```latex
\mathcal{L}_{R_\xi} = -\frac{1}{4}(F_{\mu\nu}^a)^2 - \frac{1}{2\xi}(\partial_\mu A^{\mu a})^2 + (\partial_\mu \bar{c}^a)(\delta^{ac}\partial^\mu + g f^{abc} A^{\mu b})c^c
```)
  - This is called the Fadeev-Popov lagrangian

- Luckily, we also have the gluon propagator

$ #feyndrawgram(json("gluon.json")) = #qft(```latex
i \frac{-g^{\mu\nu} + (1-\xi)\frac{p^\mu p^\nu}{p^2}}{p^2 + i\varepsilon} \delta^{ab}
```) $


#derivation("Generic gauge")[
  - Observe that $ #qft(```latex
1 = \int \mathcal{D}\pi \, \delta(G(A_\mu^a - D_\mu \pi^a)) \, \det \left( \frac{\delta G[A_\mu^a - D_\mu \pi^a]}{\delta \pi^a} \right)
```)  $
  - $G[A]$ is a functional which represents our choice of gauge
  - Then, #qft(```latex
\det \left[ \frac{\delta G \{ A_m^a - D_m \sigma^a \}}{\delta \sigma^b} \right] = \det (\partial^m D_m) = \frac{1}{f[A]} = \int \mathcal{D}\bar{c} \mathcal{D}c \exp \left( i \int d^4x \, \bar{c}^a (-\partial^m D_m) c^a \right)
```)

  - Multiplying $Z[0]$ by 1 yields #qft(```latex
Z[0] = \text{const} \times \int \mathcal{D}\pi \int \mathcal{D}A_m \mathcal{D}\phi_i \delta\left(G\left[A_m^a - D_m\pi^a\right]\right) \\ \times \det\left(\frac{\delta G\left[A_m^a - D_m\pi^a\right]}{\delta\pi^b}\right) \exp\left(i \int d^4x \mathcal{L}[A, \phi]\right)
```)

- We use the trick of shifting #qft(```latex
A_{\mu}^{a} \rightarrow A_{\mu}^{a} + D_{\mu} \pi^{a}
```) due to gauge invariance

- Our result is that #qft(```latex
\Rightarrow Z[0] = \text{const.} \left( \int D\pi \right) \int DA_\mu D\phi_i \delta(G[A_\mu^a]) \\ \times \det\left( \frac{\delta G[A_\mu^a - D_\mu \pi^a]}{\delta \alpha^b} \right)_{\pi \to 0} \times \exp\left( i \int d^4x \, L[A, \phi_i] \right)
```)
- Shifting $G$ by a constant keeps the determinant the same. Therefore, we can average over a gaussian which yields

#qft(```latex
\int \mathcal{D} \chi \exp\left(-i \int d^4x \frac{X^2}{2\xi}\right) \delta(G[A_m^a] - \chi) = \exp\left(-i \int d^4x \frac{1}{2\xi} G[A_m^a]^2\right)
```)

- This yields our final form of $Z[0]$

#qft(```latex
Z[0] = \text{const} \times \int \mathcal{D}A_\mu \mathcal{D}\phi_i \det\left(\frac{\delta G[A_\mu, \phi_i]}{\delta \phi_j}\right) \times \exp\left[i \int d^4x \left( L[A, \phi_i] - \frac{1}{2g} G[A_\mu]^2 \right)\right]
```)
]

==== BRST Invariance

- There is another symmetry that the lagrangian is invariant under. 
  - This symmetry involves grassmann numbers and qcd ghosts

- Consider the lagrangian #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2 + (D_\mu \phi_i^*)(D^\mu \phi_i) - m^2 \phi_i^* \phi_i - \frac{1}{2\xi} (\partial_\mu A^\mu)^2 - \bar{c} \Box c
```)


- If we define a shift #qft(```latex
\phi_i(x) \to e^{i\theta(x)} \phi_i(x) \approx \phi_i(x) + i\theta(x) \phi_i(x) \\
A_\mu(x) \to A_\mu(x) + \frac{1}{e} \partial_\mu \theta(x)
```) and either use the EOM or take $ #qft(```latex
(\partial_\mu A_\mu)^2 \to (\partial_\mu A_\mu)^2 + \frac{2}{e} (\partial_\mu A_\mu) (\theta \square c) + \frac{1}{e^2} (\theta \square c)(\theta \square c)
```) \ #qft(```latex
\bar{c}(x) \to \bar{c}(x) - \frac{1}{e} \theta \frac{1}{\xi} \partial_\mu A^\mu(x)
```) $, this lagrangian is invariant

- This gives us *BRST Invariance*

#definition("BRST Invariance")[
 - BRST Invariance is a generalization of guage invariance for the Fadeev Popov lagrangian

]

- This works in the non-abelian case similarly, where the lagrangian is #qft(```latex
\mathcal{L}_{FP} = \mathcal{L}[A_\mu^a, \phi_i]  -\frac{1}{2\xi}(\partial_\mu A_\mu^a)^2 + (\partial_\mu \bar{c}^a)(D_\mu c^a)
```)

- One can define transformations #qft(```latex
\phi_i \to \phi_i + i\theta^a T^a_{ij} \phi_j \\
A_\mu^a \to A_\mu^a + \frac{1}{g} \theta D_\mu c^a \\
\bar{c}^a \to \bar{c}^a - \frac{1}{g} \theta \frac{1}{\xi} \partial_\mu A_\mu^a

```) which leave everything but $D_mu$ invariant. Hence. we need a final transformation which, after a lot of algebra, results in 

$ #qft(```latex
D_\mu c^a \to D_\mu c^a + \theta f^{abc} (D_\mu c^b) c^c
```) \ #qft(```latex
c^a \to c^a - \frac{1}{2} \theta f^{abc} c^b c^c
```) $

- or alternatively, after more algebra, #qft(```latex
D_{\mu} c^a \to D_{\mu} c^a + g f^{abc} (D_{\mu} c^b) c^c - g f^{abc} \left[ \frac{1}{2} (\partial_{\mu} c^b) c^c + \\ \frac{1}{2} c^b (\partial_{\mu} c^c) + \frac{g}{2} A_{\mu}^b f^{cde} c^d c^e \right]
```)

==== Axial gauges

#rules[*Summary*][- Axial gauges are not very useful to work with but they remove the ghosts that are inconvenient to work with

- The gluon propagator in an axial gauge is #qft(```latex
i\Pi_{\text{lightcone}}^{\mu\nu ab} = \frac{i}{p^2 + i\epsilon} \left[ -ig^{\mu\nu} + \frac{r^\mu p^\nu + p^\mu r^\nu}{rp} \right] \delta^{ab}
```) which, as you may be able to see, is not the most fun to work with

]

#derivation("Axial Gauges")[

- The most general lagrangian that we can write to gauge fix our other one is #qft(```latex
-\frac{1}{2\lambda}(\partial^\mu A_\mu^a)^2 + \bar{c}^a \partial^\mu (\delta^{ab} \partial_\mu + g f^{abc} A_\mu^b) c^c
```) with two parameters: $lambda$, a scalar, and $r^mu$, a 4-vector.
- The general propagator in this axial gauge is #qft(```latex
\Pi_{axial}^{\mu\nu ab} = \frac{i}{p^2 + i\epsilon} \left[ -g^{\mu\nu} + \frac{r^\mu p^\nu + r^\nu p^\mu}{r \cdot p} - \frac{(r^2 + \lambda p^2) p^\mu p^\nu}{p^2} \right] \delta^{ab}
```)
  - We of course want this to satisfy the ward identity, but we do not have to change anything since it already does.
- In the _Lightcone gauge_, we force that $r^2 = 0$, $lambda =0$, which yields our propagator
]

== Lattice QCD
#rules("Summary")[
- Lattice QCD works by discretizing standard QCD into plaquettes and evaluating wilson loops on them
- Fields are at specific lattice sites
]

#definition("Discrete Wilson line")[
  - First, lets consider some notation. $hat(mu)$ and $hat(nu)$ will be unit vectors (of length $a$ since in lattice qcd, everything is scaled by such a factor) in the $mu$ and $nu$ directions. $W_mu (n)$ will denote a wilson line at some site $n$ and some other site $n + hat(mu)$
]
- These wilson lines will transform under the law #qft(```latex
W_{\mu}(n) \to U(n) W_{\mu}(n) U^{\dagger}(n + \hat{\mu})
```) because $pphi(n) -> U(n) pphi(n)$

#derivation("Verification")[
- Just testing that our wilson lines behave correctly (as they should), #qft(```latex
\vec{\phi}^\dagger(n) W_\mu(n) \vec{\phi}(n+\hat{m}) \to \vec{\phi}^\dagger(n) U^\dagger(n) U(n) W_\mu(n) \\ \times U^\dagger(n+\hat{\mu}) U(n+\hat{\mu}) \vec{\phi}(n+\hat{\mu}) = \vec{\phi}^\dagger(n) W_\mu(n) \vec{\phi}(n+\hat{\mu})
```)
]

#definition("Backwards Wilson Line")[
- $W_(-\mu) (n) = W^dagger_mu (n - hat(mu))$

]

#definition("plaquette")[
- something of the form in this picture #image("plaquette.png")

- It is evaluated as #qft(```latex
W_{\mu\nu}(N) \equiv W_{-\nu}(n+\hat{\nu}) W_{-\mu}(n+\hat{\mu}+\hat{\nu}) W_{\nu}(n+\hat{\mu}) W_{\mu}(N)
```)

]

- If we write #qft(```latex
W_\mu(n) = \exp(i a \underline{A}_\mu(n))
```), we can see how this would be related to the continuous version
#derivation("Evaluating Plaquettes")[
- How do we evaluate plaquettes?

  - Consider the _Campbell Baker Hausdorff_ formula: #qft(```latex
\exp(A) \exp(B) = \exp\left(A + B + \frac{1}{2}[A, B] + \dots\right)
```)
- Applying this to our definition of $W_munu$, #qft(```latex
\ln W_{m\nu}(N) = ia \left( \underline{A}_\mu(n) + \underline{A}_\nu(n+\hat{\mu}) - \underline{A}_\mu(n+\hat{\nu}) - \underline{A}_\nu(n) \right) \\
+ \frac{a^2}{2} \left\{ [\underline{A}_\nu(N) + \underline{A}_\mu(n+\hat{\nu}), \underline{A}_\nu(n+\hat{\mu}) - \underline{A}_\mu(n)] \right. \\
\left. - [\underline{A}_\nu(N), \underline{A}_\mu(n+\hat{\nu})] - [\underline{A}_\nu(n+\hat{\mu}), \underline{A}_\mu(n)] \right\} \\
+ \mathcal{O}(a^3)
```)

- Via a taylor expansion, #qft(```latex
\underline{A}_\nu(n+\hat{\mu}) = \underline{A}_\nu(n) + a \partial_\mu \underline{A}_\nu(n) + O(a^2)
```), #qft(```latex
W_{\mu\nu}(n) = \exp \left\{ i a^2 (\partial_\mu \underline{A}_\nu(n) - \partial_\nu \underline{A}_\mu(n)) + a^2 [\underline{A}_\mu(n), \underline{A}_\nu(n)] + O(a^3) \right\} \\ = \exp \{ i a^2 \underline{F}_{\mu\nu}(n) + O(a^3) \}
```)
]

- Consider the Yang Mills action: #qft(```latex
S_{YM}[F_{\mu\nu}] = i \int d^4x \left( -\frac{1}{4g^2} (F_{\mu\nu}^a)^2 \right)
```)
  - We would like to discretize this

- At small $a$, #qft(```latex
W_{\mu\nu}(N) = \mathbb{I} + ia^2 \underline{F}_{\mu\nu}(N) - \frac{a^4}{2} \underline{F}_{\mu\nu}^2(N) + O(a^6)
```)
- Additionally, we can discretize the YM action by writing #qft(```latex
S_{YM}[F_{\mu\nu}] = i \int d^4x \left( -\frac{1}{4g^2} (F_{\mu\nu}^a)^2 \right) = \frac{-i a^4}{4Ng^2} \sum_{n, \mu\nu} \text{tr}(F_{\mu\nu}^2)
```)

- We finally obtain the lattice action: #qft(```latex
S_{\text{lattice}}[W_{\mu\nu}] = \frac{-i}{2g^2 N} \sum_{\nu, \mu} \text{Re}(\text{tr}(\mathbb{I} - W_{\mu\nu}(N)))
```)
- For corr. functions, you would use this #blue("action") in a path integral like $ C(x) mel(Omega,cal(O)(0) cal(O)(x), Omega) = integral cal(D) A_mu cal(D) overline(u) cal(D) u space e^(blue(i S)) cal(O)(0) cal(O)(x) $ However, it would give a rapid phase shift. Instead, you must perform a #red("wick rotation")
#include("qcd_rules/index.typ")
#include("helicity.typ")
