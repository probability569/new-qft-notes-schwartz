#import "../../macros.typ":*
== Scalar Field Theory
- Scalar Field Theory is fairly similar to Classical Field Theory with the exception that it is quantized via the methods that will be presented shortly. This ensures that it obeys the laws of quantum mechanics, while still being a "Toy Theory" due to the simplicity of the objects involved in it ((potentially) complex fields $pphi$ as opposed to _vectors_ $A_mu$ or _spinors_ $psi$ which are closer to real, physical particles).
=== Quantization

- As seen in 's Quantum Field Theory Notes, one could try to naively try to quantize the Schrodinger Equation (via the use of a series to have the equation be on-shell), which would bring rise to some problems

$

H ket(psi) = i partial_t ket(psi)

\

H = sqrt(hat(p)^2 + m^2)
$

==== Harmonic Oscillator/First Quantization


- The standard Hamiltonian for a simple harmonic oscillator is $ H = 1/2 p^2/(2 m) + 1/2 m omega^2 x^2 $. The relevance to quantization will become apparent.

#definition("First Quantization")[
  The idea behind first quantization is to apply the commutation relation $[hat(x),hat(p) ]=i$ to a system. This commutation relation is known as the _canonical commutation relation_, and it can be used to obtain quantum mechanics from a classical theory (which we are doing now).
]

- Utilizing a change of variables to $ a$ and $a^dagger $, one can derive an alternative form for the Hamiltonian $ a equiv sqrt((m omega)/2)(x + (i p)/(m omega)), space a^dagger equiv sqrt((m omega)/2) (x - ( i p)/(m omega)) $
  - $ H = omega(a^dagger a + 1/2) $ is written in a very suggestive form. Such $a^dagger$ and $a$ can be thought of as "exciting" the harmonic oscillator, as you may know from quantum mechanics. 
  - The eigenstates of this Hamiltonian are eigenstates of $hat(N) equiv a^dagger a $
- Notice that this hamiltonian's eigenvalues (the energies of the eigenstates) are discrete. This is a result from quantum mechanics (or, rather, defining quantum mechanics). Such a result is the reason behind both the name _Quantum Mechanics_ and the idea of _First Quantization_.
- $hat(N)$ operator: 
  - $hat(N) ket(n) = n ket(n)$
  - $a^dagger ket(n) = sqrt(n+1) ket(n+1)$
  - $a ket(n) = sqrt(n) ket(n-1)$
==== Heisenberg Picture
  - $ i (dif)/(dif t) a = [a,H] = [a,a(a^dagger a + 1/2)] = omega(a a^dagger a - a^dagger a a ) = omega [a,a^dagger] a = omega a $
  - Solution is $ a(t) = e^(- i omega t) a(0) $
==== Relativistic Fields
- A common relativistic equation (heavy foreshadowing) for a (free) field is the equation $ square pphi = 0. $
  - Solution to this is $ pphi(x,t) = integral diff(3,p) [a_p (t) e^(i arrow(p) dot arrow(x)) + tilde(a_p) (t) e^(- i arrow(p) dot arrow(x))]   $
  which is written in a fairly suggestive manner

==== 2nd Quantization
#definition("Second Quantization")[To obtain 2nd quantization (and hence quantum field theory), one can use an annihilation operator $a_p$ and a creation operator $a_p^dagger$ which exist per wave number as opposed to being universal since now, we utilize infinite harmonic oscillators which exist per $p$
]
- Free Hamiltonian is obtained via integration over these $ H = integral diff(3,p) omega_p (a^dagger_p a_p + 1/2) $
 with $omega_p = abs(arrow(p))$

- 2nd Quantization new things:
  - Each (of the infinitely many) point of momentum $arrow(p)$ gets its own harmonic oscillator (which we integrate over to obtain our result)
  - The $n$th excitation of the harmonic oscillator $arrow(p)$ as being a state with $n$ particles

==== Fock Space
  - Instead of Hilbert space $cal(H)$, like in Quantum Mechanics/First Quantization, we have a _Fock Space_ $cal(F)$.
  - A Fock space $cal(F)$ is the direct sum of Hilbert spaces $cal(H)_n$, that is, $ cal(F) = plus.o.big_n cal(H)_n $
  - States in $cal(H)_n$ are linear combinations of ${ket(p_1^mu dots p_n^mu)}$
    - Since we are using _Fock Space_, this means that there can be however many particles due to the direct sum over Hilbert Spaces

#note("Momentum Notation")[
  $p^0 = sqrt(arrow(p)^2 + m^2 )$ so $ket(p) = ket(arrow(p)) = ket(p^mu)$ due to no loss of generality (this only works if it is on-shell).
]
  
==== Field Expansion
- Previously, we noted that $[a,a^dagger] = 1$. This generalizes to $[a_k , a^dagger_p] = (2 pi)^3 delta^3(arrow(p)-arrow(k))$
- $a^dagger_p ket(0) = 1/(sqrt(2 omega_p) ) ket(p)$
- $braket(0) = 1$ since it is the vacuum ground state
  - $braket(p,k)=2 sqrt(omega_p omega_k) matrixelement(0,a_p a^dagger_o,0) = 2 omega_p (2 pi)^3 delta^3 (arrow(p)-arrow(k))$

- Identity operator $ bb(1)  = integral diff(3,p) 1/(2 omega_p) ketbra(p) $

- Free field definition $ pphi_0 (arrow(x)) equiv integral diff(3,p) 1/sqrt(2 omega_p) (a_p e^(i arrow(p) dot arrow(x)) + a_p^dagger e^(- i arrow(p) dot arrow(x))) $ which is why I said $pphi(arrow(x),t)$ from 4.1.2 was written in a suggestive manner (although this is still technically just a definition)
#note("Momentum state inner product with free field")[
  $ mel(arrow(p),pphi_0(arrow(x)),0) = bra(0) sqrt(2 omega_p) a_p integral diff(3,k) (a_k e^(i arrow(k) arrow(x)) + a_k^dagger e^(- i arrow(k) dot arrow(x)) ) ket(0) \ = integral diff(3,k) sqrt(omega_p/omega_k) [e^(i arrow(k) dot arrow(x)) mel(0,a_p a_k , 0) + e^(- i arrow(k) dot arrow(x) ) mel(0,a_p a^dagger_k,0) = e^(- i arrow(p) dot arrow(x)) ] \ = e^(- i arrow(p) dot arrow(x)) $
  This is the expected result of $braket(arrow(p),arrow(x))$, and so we conclude $pphi_0(arrow(x)) ket(0) = ket(arrow(x))$
]

==== Time Dependence
- Because of Heisenberg's equations of motion, in the Heisenberg perspective, $a_p (t)$ and $a_p^dagger (t)$ are time dependent
  - $a_p (t) = e^(-i omega_p t) a_p, a_p^dagger (t) = e^(i omega_p t) a_p^dagger $
- Heisenberg equations of motion
  - $ [H_0,pphi_0(arrow(x),t)] = integral diff(3,p) integral diff(3,k) 1/sqrt(2 omega_k) [omega_p (a^dagger a_p + 1/2),a_k e^(- i k x) + a_k^dagger e^(i k x) ] \ = integral diff(3,p) 1/sqrt(2 omega_p) [-omega_p a_p e^(- i p x) + omega_p a^dagger_p e^(i p x) ] \ = - i partial_t pphi_0(arrow(x),t) $
  - Should have that, for any field $pphi$, $ [H, pphi(arrow(x),t)]= i partial_t pphi(arrow(x),t) $
    - $ pphi(arrow(x),t) = integral diff(3,p) 1/sqrt(2 omega_p) [a_p (t) e^(- i p x) + a_p^dagger (t) e^(i p x) ] $ is the solution to the _Heisenberg equations of motion_ for $pphi$, our field which does not necessarily have to be free in this case
  
