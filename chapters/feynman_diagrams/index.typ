#import "../macros.typ":*

== Feynman Diagrams and the Path Integral (TODO)

=== Feynman Propagators

- We can define the feynman propagator $G_F (x,y)$ to be implicitly defined by $ (square_x +m^2) G_F (x,y) = - i delta^(4)(x-y) $ 
- This provides us, in posistion space, with $ G_F (x,y) = integral diff(4,p) i/(p^2 - m^2 + i epsilon) e^(i p dot (x-y)) \ equiv integral diff(4,p) G_F (p) e^(-i p dot(x-y)) $ 
  - The momentum space Feynman Propagator $G_F (p)$ is defined as $ G_F (p) equiv i/(p^2 -m^2 + i epsilon) $
- The Feynman propagator, which we will elaborate upon, is a very fundamental quantity that is useful in evaluating Feynman diagrams (to be more explicit, it could be one of the only ways to evaluate them).
  - In conclusion, Richard Feynman is the GOAT


#definition("Feynman Propagator")[
 - The Feynman propagator $G_F (x,y)$ or $D_F (x,y)$ or $G_F (x-y)$ or $D_(x y)$ depending on the situation is defined as the time ordered product of free fields. 
  - That is, $ G_F (x,y) equiv bra(0) T pphi(x_1) pphi(x_2) ket(0) \ = lim_(epsilon -> 0) integral diff(4,p) 1/(k^2 -m^2 + i epsilon) e^(i k (x-y)) $
]



#definition("Feynman Diagram")[
  A Feynman diagram is something that is used to represent particle interactions, or simplifications of them which are summed. generally to calculate the LSZ reduction for matrix elements. These matrix elements are ultimately used to calculate cross sections as seen in _Cross Sections_.
]


#definition("Feynman Rules")[
  Feynman rules are a set of rules for a theory which is used to evaluate Feynman diagrams.
]
- A standard set of Feynman rules that can generally apply everywhere are the following

#rules("General Position Space Feynman Rules")[- At each vertex, a factor of the interaction coupling is given 
- All lines are integrated over $d^3 x$ after applying the Feynman propagator
- The LSZ reduction formula is applied to convert this to an S-matrix element
- Additional factors may be added if they are incoming/outgoing electrons/photons due to polarization and spin
]

#rules("General Momentum Space Feynman Rules (Arguably much more useful)")[- Each vertex of a Feynman Diagram gets a factor of whatever the interaction coupling is.
- Vertices can only occur at points that satisfy interactions in the Lagrangian #footnote[For instance, if $lag_("int") = g/3! pphi^3$, only interactions which involve fields intersecting at three points are included in the set of tree-level diagram]
- For each edge whose momentum is known (that does not connect to an external vertex), a factor of the propagator for the theory $Pi$ is gained
- For each edge whose momentum $k$ is unknown (i.e., a loop),  a factor of $Pi$ is gained and must be integrated over $ diff(4,k). $
- The final product gives $ i cal(M)$ for the diagram
- Additional factors may be added if they are incoming/outgoing electrons/photons due to polarization and spin

]



=== Wick's Theorem and Feynman Diagram Derivation

- Before diagrams, it is useful to do some calculations

  - There are two different ways to derive Feynman rules for a theory, but the most common two are through the use of lagrangians and through the use of 2nd quantization


==== Lagrangian Method

- Consider Free Fields with $ [pphi(bold(x),t), pphi(bold(x)',t))] = 0  \ [pphi(bold(x),t), partial_t pphi(bold(x)',t)] = i planck delta^3(bold(x)-bold(x)') \ (square +m^2)pphi = 0 $


- We only know how to evaluate the free theory correlation functions at this point $ bra(0) T pphi(x) pphi(x') ket(0) $

#theorem("Schwinger-Dyson Equations")[
- An equation that will appear later via the use of Feynman path integrals

- The Schwinger Dyson Equations state that $ (square +m^2) chevron.l pphi_x pphi_1 pphi_2 dots pphi_n chevron.r = chevron.l lag'_"int" [pphi_x] pphi_1 dots pphi_n chevron.r \ - i planck sum_j delta^4 (x-x_j) chevron.l pphi_1 dots pphi_(j-1) pphi_(j+1) dots pphi_n chevron.r $
  - This holds if $ lag = -1/2 (square +m^2) pphi + lag_"int" [pphi] $
- They differentiate classical mechanics and quantum mechanics via the $planck$ term.



]

#proof("Schwinger-Dyson Equation")[
- This should barely constitute a proof but nevertheless I have to call it something.


- Consider $ partial_t bra(Omega) T pphi(x) pphi(x') ket(Omega) $
  - This is equal to $ partial_t [bra(Omega) pphi(x)pphi(x') ket(Omega) Theta(t-t') + bra(Omega) pphi(x') pphi(x) ket(Omega) Theta(t'-t)] \ = bra(Omega) T partial_t pphi(x) pphi(x') ket(Omega) + bra(Omega) pphi(x) pphi(x') ket(Omega) partial_t Theta(t-t') \ + bra(Omega) pphi(x') pphi(x) ket(Omega) partial_t Theta(t'-t) $
  - Using the fact that $partial_T Theta(t) = delta(t)$, we obtain that the above expression is equal to $ bra(Omega) T partial_t pphi(x) pphi(x') ket(Omega) + delta(t-t') bra(Omega) [pphi(x), pphi(x')] ket(Omega) $

- Taking the second derivative, we obtain $ partial^2_t bra(Omega) T pphi(x) pphi(x') ket(Omega) = bra(Omega) T partial^2_t pphi(x) pphi(x') ket(Omega)\ + delta(t-t') bra(Omega) [partial_t pphi(x), pphi(x')] ket(Omega) $
  - Since the delta function forces time equivalence ($t=t'$) in the second term, we have that $ [partial_t pphi(x),pphi(x')] = - i planck delta^3 (bold(x) -bold(x)') $ and therefore additionally have that $ partial^2_t bra(Omega) T pphi(x) pphi(x') ket(Omega) = bra(Omega) T partial^2_t pphi(x) pphi(x') ket(Omega) - i planck delta^4 (x-x') $

#note("Chevron Notation")[
  - As you may have seen earlier, we have introduced notation $chevron.l pphi chevron.r$ in order to make notation more condensed. As you may be able to guess, $chevron.l pphi chevron.r equiv bra(Omega) pphi ket(Omega)$

]
- Therefore, the equation with $square +m^2$ follows and implies our Feynman propagator, $ (square_x +m^2) G_F (x,y) = -i planck delta^4 (x-y) $


- That is, $ (square +m^2) chevron.l pphi(x) pphi(x') chevron.r = chevron.l (square +m^2) pphi(x) pphi(x') chevron.r - i planck delta^4(x-x') $
  - Applying Euler-Lagrange equations gives $ chevron.l lag'_"int"[pphi] pphi(x) pphi(x') chevron.r - i planck delta^4 (x-x') $
- Generalization provides the final equation, $ (square_x +m^2) pphi = chevron.l lag'_"int" pphi_x pphi_1 dots pphi_n chevron.r - i planck sum_j chevron.l pphi_1 dots pphi_j pphi_(j+1) dots pphi_n chevron.r $
]

- Now we can simply evaluate the two point functions 
- For instance, $ chevron.l pphi_1 pphi_2 chevron.r = integral dif^4 delta_(x 1) chevron.l pphi_x pphi_2 chevron.r $ (this is simply using the identity that $integral dif^4 x delta(x) f(x) = f(0)$.
  - The above expression is then equivalent to $ i integral dif^4 x (square_x D_(x 1)) chevron.l pphi_x pphi_2 chevron.r = i integral dif^4 x D_(x 1) square_x chevron.l pphi_x pphi_2 chevron.r $

- Some condensed notation was used where  $D_(a b) = G_F (x_a, x_b)$ and $delta_(x b) = delta(x - x_b)$

- In a free theory $square_x chevron.l pphi_x pphi_Y chevron.r = - i delta_(x y)$, and so $ chevron.l pphi_1 pphi_2 chevron.r = integral dif^4 x D_(x 1) delta_(x 2) = D_(1 2) $ which is not very interesting (it is literally a particle going from point $x$ to point $y$ without anything happening)



==== Wick's Theorem/Contractions/QM Derivation
- Let us move to an interacting theory ($lag_("int") != 0$)

===== Consider the Heisenberg picture

- We have the Heisenberg equations of motion $i partial_t pphi(x) = [pphi,H]$
  - These necessarily imply that $pphi(bold(x),t)$ evolves via an operator $S$. i.e. $ pphi(bold(x),t) = S(t,t_0)^dagger pphi(bold(x)) S(t,t_0) $, noting that $S$ is the S-matrix. 
  - $S$ satisfies $i partial_t S(t,t_0) = H(t) S(t,t_0)$ (the schrodinger equation)
- In the Heisenberg picture, we do not need the explicit hamiltonian, just the time dependent part
  - This is because the states are time independent and the Hamiltonian is not
- $H(t) = H_0 + V(t)$

===== Interaction Picture
- In the interaction picture, fields only evolve via $H_0$

- Free fields: $ pphi_0 (bold(x), t) = e^(i H_0 (t-t_0)) pphi(bold(x)) e^(-i H_0 (t-t_0)) $

#note[
  - This is equivalent to the plane wave solution for scalar fields. That is, $ pphi_0 (bold(x),t) = fquant(3,p,x) $
]

- In order to get the real field for this, we have that $ pphi(bold(x),t) = S^dagger (t,t_0) e^(- i H (t-t_0)) pphi_0 (bold(x),t ) e^(i H_0 (t-t_0)) S(t, t_0) \ equiv U^dagger (t,t_0) pphi_0 (bold("x"), t) U(t,t_0) $
- This $U(t,t_0) equiv e^(i H_0 (t-t_0)) S(t,t_0)$ is unitary time evolution operator that we can utilize
  - It relates the Heisenberg picture to free fields at some time $t$

- Notice that it satisfies (a form of) the Schrodinger equation. Namely, $ i partial_t U(t,t_0) = -e^(i H_0 (t-t_0)) H_0 S(t,t_0) + e^(i H_0 (t-t_0)) H(t) S(t,t_0) \ = e^(i H_0 (t-t_0)) [-H_0 + H(t)] e^(- i H_0 (t-t_0)) e^(i H_0 (t-t_0)) S(t,t_0) \ = H_I (t) U (t,t_0) $ with $H_I (t) equiv e^(i H_0 (t-t_0)) V(t) e^(-i H_0 (t-t_0))$
  - This $H_I (t)$ is the Heisenberg interaction/potential in the interacting picture

- The solution to this is $ U(t,t_0) = T exp ( - i integral_(t_0)^t H_(I) (t') dif t' ) $ which is known as the *Dyson Equation*

==== More Feynman rules derivation


- Consider the operator $ U_(1 2) equiv U(t_1, t_2) = T exp(-i integral_(t_1)^(t_2) dif t' H_I (t)) $
  - In this notation, the later time is on the left

- We have the following identities: 
  - $U_(2 1) U_(1 2) = 1$
  - $U^-1_(2 1) = U^dagger_(2 1) = U_(1 2)$
  - For $t_1 < t_2 < t_3$, $U_(3 2) U_(2 1) = U_(3 1)$
  - $U_(3 2) U_(1 2) = U_(3 2)$


- Since $pphi(x_1) = pphi(bold(x)_1,t) = U^dagger_(1 0) pphi_0 (bold(x)_1,t) U_(1 0) = U_(0 1) pphi_0 (bold(x)_1,t) U_(1 0) $

=== Vacuum Matrix Elements

- We want to evolve the ground state $ket(Omega)$ to a time $t_0$ such that the interacting picture and the free picture are equivalent

- In the interacting picture, states $ket(Omega)$ evolve via $S(t,t_0)$ and are annihilated by $a_p (t)$ at $t = -oo$

- In the heisenberg picture, $a_p (t)$ evolves as $S(t,t_0)^dagger a_p (t_0) S(t,t_0)$ and annihilates $ket(Omega)$ at $t=-oo$

- In the free theory, $ket(0)$ is annihilated by $a_p$
  - $a_p$ evolves only via phase rotation
  - $a_p (t_0) e^(i H_0 (t-t_0)) ket(0) = 0$ at $t = -oo$ (annihilation)
- We must have that $e^(i H_0 (t-t_0)) ket(0)$ and $S(t,t_0) ket(Omega)$ must be proportional
  - Then, $ ket(Omega) = cal(N)_i lim_(t-> -oo) S^dagger (t,t_0) e^(i H_0 (t-t_0)) ket(0) = cal(N)_i U_(0, -oo) ket(0) $
    -$cal(N)_i$ is just a number
  - Similarly, for the final time, $ bra(Omega) = cal(N)_F bra(0) U_(oo,0) $ for some $cal(N)_f$

- Then, for our time ordered product, assuming that $t_1 > t_2 > dots t_n$ (WLOG), we have that $ bra(Omega) T pphi(x_1) dots pphi(x_n) ket(Omega) = bra(Omega) pphi(x_1) dots pphi(x_n) ket(Omega) \ = cal(N)_i cal(N)_f bra(0) U_(oo 0) U_(0 1) pphi_0 (x_1) U_(1 0) U_(0 2) pphi_0 (x_2) U_(2 0) dots U_(0 n) pphi_0 (x_n) U_(n 0) U_(0 -oo) ket(0) \ = cal(N)_i cal(N)_f bra(0) U_(oo  1) pphi(x_1) U_(1 2) pphi(x_2) U_(2 3) dots U_((n-1) n) pphi_0 (x_n) U_(n -oo) ket(0) $

- Now we can simply apply the time ordering, giving $ bra(Omega) T pphi(x_1) dots pphi(x_n) ket(Omega) \ = cal(N)_i cal(N)_f bra(0) T U_(oo 1) pphi_0 (x_1) U_(12) pphi_0 (x_2) U_(2 3) dots pphi_0 (x_n) U_(n -oo) ket(0) \ = cal(N)_i cal(N)_f bra(0) T pphi_0 (x_1) dots pphi_0 (x_n) U_(oo, -oo) ket(0) $

- Additionally, $braket(Omega) = 1$ which implies that, by normalization, $cal(N)_i cal(N)_f = bra(0) U_(oo,-oo) ket(0)^(-1)$



#note("Oscillations")[ We have been taking $t->oo$ this whole time, which is incorrect. Utilizing $t-> oo$ without any damping will result in oscillations. That is, if we insert the energies $ e^(- i H t) ket(0) sum_n e^(i E_n t) ket(n) braket(n,0) $, taking $t->oo$ yields $e^(-i t E)$ for an energy $E$ which at large times causes unpredictable phase oscillations. Thus, we must use an analytic continuation by taking $t->oo-i epsilon$ (which would provide a dampening $e^(- epsilon E)$ )]

- We can finally have the time ordered product $ bra(Omega) T pphi(x_1) dots pphi(x_n) ket(Omega) \ = lim_(T -> oo - i epsilon) (bra(0) T pphi_0 (x_1) dots pphi_0 (x_n) exp[-i integral_(-T)^T dif t H_I (t)] ket(0))/(bra(0) T exp[-i integral_(-T)^T dif t H_I (t)] ket(0)) $

=== Wick's Theorem and Contractions (real)

- A contraction in a Feynman diagram is when 
$ #qft(```latex
= 9 D_{12} D_{xx} D_{xy} P_{yy} + 6 D_{12} D_{xy}^3
```)
\
#qft(```latex
+ 18 D_{1x} D_{2x} D_{xz} P_{yy} + 9 D_{12} D_{xy} D_{xx} P_{yy} +
```)
\
#qft(```latex
18 D_{12} D_{xy} D_{xy}^2 + 18 D_{12} D_{xy} P_{yy} D_{xy} D_{xx}
```)
\
#qft(```latex
+ 9 D_{1y} D_{xx} D_{xx} D_{yy} + 18 D_{1y} D_{2x} D_{xy}^2
```)

$

