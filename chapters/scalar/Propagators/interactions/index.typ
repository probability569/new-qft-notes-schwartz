#import "../../macros.typ":*

== More Information on the S-matrix

- The $S$-matrix describes the interaction between particles in the system, and as previously seen, it is defined as $ mel(f , S , i) = bb(1) +  ddelta(4,p_f - p_i) scr(M) $

- This S-matrix is the primary goal of most calculations in quantum field theory (as it describes the interactions of the particles)

=== LSZ Reduction
- The way to obtain the S-matrix from the _Time-Ordered Product_ involves the *LSZ Reduction Formula* which is extremely important, and allows for the derivation of the extremely simple momentum-space Feynman Rules, which you will see later.

- The LSZ reduction formula is as follows: $ mel(f,S,i) = [i integral d^4 x_1 e^(- i p_1 x_1) (square + m^2)] dots.c [i integral d^4 x_n e^( i p_n x_n) (square + m^2 )] \ times mel(Omega, T pphi(x_1) pphi(x_2) pphi(x_3) dots pphi(x_n), Omega) $

#definition("LSZ Reduction")[
  The _LSZ Reduction_ is a formula providing $S$- matrix elements from the time ordered product (in the ground state for the interacting theory $Omega$).
]
- Additionally, this formula can allow for the calculation of transfer matrix elements $scr(M)$, but it is more convenient to utilize Feynman diagrams derived from this formulation.
  - The cross sections are calculatable from this as well
- This formula effectively deletes terms in the time ordered product except for those with poles of $1/(p^2 -m^2)$

- The ground state in the interacting theory, $ ket(Omega)$ is a very inconvenient way to calculate, due to lack of knowledge about the ground state

==== Correlation Functions

- A *correlation function* $mel(Omega, T pphi(x_1) dots.c pphi(x_n), Omega)$ is the time ordered product of fields which appears in the LSZ reduction formula after the integrals

- This is specifically used in the derivation of the LSZ reduction formula

==== Derivation of LSZ Reduction

- Suppose that the initial state $ket(i)$ and the final state $ket(f)$ are of the form $ ket(i) = sqrt(2 omega_1) sqrt(2 omega_2) a^dagger_(p_1) (-oo) a^dagger_(p_2) (oo) ket(Omega) $ and $ ket(f) = sqrt(2 omega_1) dots.c sqrt(2 omega_j) a^dagger_(p_3) (oo) dots.c a^dagger_(p_j) (oo) ket(Omega) $
  - Additionally there is the constraint that $ket(i) != ket(f)$ due to scattering happening.
- The S-matrix element is then $ mel(f,S,i) = 2^(j/2)sqrt(omega_1 dots.c omega_n) times bra(Omega) a_(p_3) (oo) dots.c a_(p_j) (oo) a^dagger_(p_1) (-oo) a^dagger_(p_2) (-oo) ket(Omega) $
- Now it is desirable to convert this to scalar fields, $pphi$
- From quantization, they are defined by $ pphi = integral diff(3,p) (a_p (t) e^(-i p x) + a^dagger_p (t) e^(i p x)) $

===== Heisenberg picture to obtain operators 
- Consider the Heisenberg picture
  - $ a_p (t) = e^(i H(t-t_0)) a_p (t_0) e^(-i H(t-t_0))$ and $pphi(x) = e^(i H(t-t_0)) pphi(bold(x),t_0) e^(-i H(t-t_0))$ via unitary time evolution
  - The only useful thing to know about $pphi(x,t)$ and $a_p (t)$ is $ mel(Omega, pphi(bold(x), t= plus.minus oo), p) = C e^(- i bold(p) dot bold(x)) $
- A useful identity: $ i integral dif^4 x e^(i p x) (square +m^2) pphi(x) = sqrt(2 omega_p) [a_p (oo) - a_p (-oo)] $ 
  - Proof: $ i integral dif^4 x (square + m^2) pphi(x) = i integral dif^4 x e^(i p x) (partial_t^2 - arrow(partial)^2_x + m^2) pphi \ = i integral dif^4 x e^(i p x) (partial^2_t + arrow(p)^2 + m^2) pphi(x) \ = i integral dif^4 e^(i p x) (partial_t^2 + omega_p^2) pphi(x) $
    - Identity for proof: $ partial_t [e^(i p x) (i partial_t + omega_p) pphi(x)] \ = [i omega_p e^(i p x) (i partial_t + omega_p) + e^(i p x) (i partial_t^2  + omega_p partial_t^2)] pphi(x) \ = i e^(i p x) (partial_t^2 + omega^2) pphi(x) $
  - Putting this into the integral, $ i integral dif^4 x e^(i p x) (square +m^2) pphi(x) = integral dif^4 x partial_t [e^(i p x) (i partial_t + omega_p) pphi(x)] \ = integral dif t partial_t [e^(i omega_p t) integral dif^3 x e^(- i bold(p) dot bold(x)) (i partial_t + omega_p) pphi(x)] $
    - This is true for all $pphi(x)$ 
  - Quantum Field Case: $ integral dif^3 x e^(-i bold(p) dot bold(x)) (i partial_t + omega_p) pphi(x) \ = integral dif^3 x e^(- i bold(p) dot bold(x)) (i partial_t + omega_p) \ times integral diff(3,k) 1/(sqrt(2 omega_k)) (a_k (t) e^(- i k x) a^dagger_k (t) e^(i k x)) \ = integral diff(3,k) integral dif^3 x ( ((omega_k + omega_p)/(sqrt(2 omega_k))) a_k (t) e^(- i k x) e^(- i bold(p) dot bold(x)) \ + ((-omega_k + omega_p)/(sqrt(2 omega_k))) a^dagger_k (t) e^(i k x) e^(- i bold(p) dot bold(x))     ) $
#note("Math Note")[
  - $partial_t a_k (t) = 0$ at $t=plus.minus oo$
]
  - The $dif^3 x$ integral enforces $omega_k = omega_p$ via delta functions
  - Therefore, we get $ integral dif^3 x e^(-i bold(p) dot bold(x)) (i partial_t + omega_p) pphi(x) = sqrt(2 omega_p) a_p (t) e^(-i omega_p t) $
  - This implies $ i integral dif^4 x e^(i p x) (square + m^2) pphi(x) = integral dif t partial_t ( (e^(i omega_p t)) (sqrt(2 omega_p) a_p (t) e^(- i omega_p t))  ) \  = sqrt(2 omega_p) [a_p (oo) - a_p (-oo)] $ as desired

===== S matrix element computing

- Now we can compute $ mel(f,S,i) = 2^(j/2) sqrt(omega_1 omega_2 dots omega_j) \ times bra(Omega) a_(p_3) (oo) dots a_(p_j) (oo) a^dagger_(p_1) (-oo) a^dagger_(p_2) (-oo) ket(Omega) $


#definition("Time Ordered Product")[
  - The time ordered product $ T scr(O)(x_1) scr(O)(x_2) dots scr(O)(x_n)$ picks up the operators $scr(O)$ and literally places them so that they are correctly ordered in time. This is the only thing that the operator does, as it keeps the products there.
]

- Notice that $ mel(f,S,i) = sqrt(2^j omega_1 dots omega_j) bra(Omega) T [a_(p_3) (oo) - a_(p_3) (-oo)] dots.c [a_(p_j) (oo) - a_(p_j) (-oo)] \ times [a_(p_1)^dagger (-oo) - a_(p_1)^dagger (oo)] [a_(p_2)^dagger (-oo) - a_(p_2)^dagger (oo)] ket(Omega) $

- Therefore, we have the LSZ Reduction Formula $ mel(p_3 dots.c p_j, S, p_1 p_2) = [i integral dif^4 x_1 e^(- i p_1 x_1) (square_1 + m^2)] \ times dots.c times [i integral dif^4 x_j e^(i p_j x_j) (square_j + m^2)] \ times bra(Omega) T pphi(x_1) pphi(x_2) dots pphi(x_j) ket(Omega) $

==== LSZ For Operators

- The LSZ Reduction formula is relatively powerful, as it applies for all operators $scr(O)_j$

- This implies that $ mel(p_3 dots.c p_j, S, p_1 p_2) = [i integral dif^4 x_1 e^(- i p_1 x_1) (square_1 +m^2)] \ times dots.c times [i integral dif^4 x_j e^(i p_j x_j) (square_j +m^2)] \ times bra(Omega) T scr(O)_1 (x_1) dots scr(O)_j (x_j) ket(Omega) $


