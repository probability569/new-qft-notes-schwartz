#import "../../macros.typ":*


== Propagators (TODO)

=== Green's Functions

#definition("Green's Functions")[
  A Green's function is a function of the form $A^(-1)$ where $A$ is an operator. A standard way to evaluate these green function operators is via a Fourier transform into $k$-space #footnote[ $k$-space is effectively momentum space due to the relation $p = planck k$ and the fact that we are using natural units  ]. This is a type of _propagator_.
]

#definition("Propagator")[
  Defines or is used to define how a field propagates via applying the propagator $Pi$ to some other field or current. Can be used perturbatively in order to describe more complicated fields. 
]

- An example of a propagator is the $2$-point Green's function $Pi = -1/square$ which is defined by $ square_x Pi(x,y) = -delta^4 (x-y) $ 
- With $square_x = g^(mu nu ) (partial)/(partial x^mu) (partial)/(partial x^nu)$ This gives the solution (via the Fourier transform), that $ Pi(x,y) = integral (dif^4 k)/(2 pi)^4 e^(i k (x - y)) 1/k^2 $. 

#note("Fourier Transform of Operators")[
  Under _Fourier Transforms_, certain operators are effectively interchangeable with some counterpart that often simplifies calculations. An example of this is how $Pi(x,y)$ is interchangeable with $1/k^2$.
]

#example("Delta Functions")[
  For an instance of this occurrence, we can utilize delta functions.
#note[
  The Fourier transform of any delta function is $ tilde(delta)(arrow(k)) = 1 \ ==> delta(arrow(x)) = integral (dif^3 k)/(2 pi)^3 e^(i arrow(k) dot arrow(x)) $ 
]
  
  - $ triangle^n delta^3(arrow(x))  = integral (dif^3 k)/(2 pi)^3 triangle^n e^(i arrow(k) dot arrow(x)) \ =integral (dif^3 k)/(2 pi)^3 (-arrow(k)^2)^n e^(i arrow(k) dot arrow(x)) $

  - $triangle^n <--> (-arrow(k)^2)^n$ (this means that in a _Fourier Transform_, these are interchangeable).

  - Additionally, we can do the same for the relativistic $square = partial_mu partial^mu$  $ square^n (delta^4(x)) = integral (dif^4 k)/(2 pi )^4 square^n e^(i k dot x) = integral (dif^4 k)/(2 pi )^4 (-k^2)^n e^(i k dot x) $

  - Have that $tilde([square^n delta^4])(k) = (-k^2)^n$ and $tilde([triangle^n delta^3])(k) = (-arrow(k)^2)^n$
]

=== Perturbation Theory

#definition("Perturbation Theory")[
  This topic is introduced in Quantum mechanics (and often before-hand) where we consider an initial state that we can solve and then higher order terms that we continue to be able to solve. Perturbation theory only works when the leading term is the "dominant" force in play. Often, we can utilize an initial term which is _non-interacting_ and extra terms that are _interacting_.
]

#example("Gravity")[
  This example was provided from the Schwartz textbook #footnote()[
    This is the primary textbook that I am learning Quantum Field Theory through, as seen in the credits section.
  ]
  We start with the Lagrangian $ lag = -1/2 h square h + 1/3 lambda h^3 + J h $ where $J$ is some _current_ and $h$ is our field.
  From the _Euler-Lagrange equations_, our equation of motion is $ square h - lambda h^2 - J = 0 $ First order approx ($lambda = 0$): $h_0 = 1/square J$.
  We let $h = h_0 + h_1$.
  $ square(h_0 + h_1) - lambda(h_0 + h_1)^2 - J = 0 $ implies $ square h_1 = lambda h_0^2 + cal(O)(lambda^2) \ h = 1/square J + lambda 1/square ((1/square J) (1/square J)) + cal(O)(lambda^2) $ which we now have in terms of our Green's Functions. 
]
#note[
  In fact, something being defined as $1/square J$ is not that uncommon, as it also happens with the Electromagnetic field.
]

=== OFPT




- For *Old Fashioned Perturbation Theory* we utilize perturbation by setting the Hamiltonian to $ H = H_0 + V $
- The idea is that we have some $ket(pphi)$ and some $ket(psi)$ such that $ H_0ket(pphi) = E ket(pphi) $ and $ H ket(psi) = E ket(psi) $ 
- From this we can derive $ ket(psi) = ket(pphi) + 1/(E-H_0)V ket(pphi), $ the _Lippmann-Schwinger_ equation
 - This allows us to define the propagator#footnote[In fact, this is not well-defined, but the limit $ lim_(epsilon -> 0) 1/(E-H_0 + i epsilon) $ is.] $ Pi_("LS") equiv 1/(E-H_0) $
// definition("Lippmann-Schwinger Propagator")[
  //As previously mentioned, the _Lippmann-Schwinger Propagator_ is defined as $ Pi_("LS") equiv 1/(E-H_0). $ This definition is just here to make sure that it gets its recognition that it deserves due to its importance in this section. 
//]

- We define an operator $T$ as $ V ket(psi) = T ket(pphi) \  ket(psi) =ket(pphi) + Pi_("LS") T ket(pphi) \ V ket(psi) = V ket(pphi) + V Pi_("LS") T ket(pphi) $ 
  - Note that $V ket(psi) = T ket(pphi)$ so $ T ket(pphi) = V ket(pphi) + V Pi_("LS") T ket(pphi) = (V  + V Pi_("LS") T) ket(pphi). $ (This holds when contracted with any eigenstate of $H_0$, $ket(pphi_j)$)
- This implies that that $T = V + V Pi_("LS") T.$ 
- Recursion provides $ T = V + V Pi_("LS") V + V Pi_("LS") V Pi_("LS") V + dots.c  $
If we want a transition amplitude for this, we want to calculate $ bra(f)T ket(i) = bra(f) V ket(i) + bra(f) V Pi_("LS") V ket(i) + dots.c $

#note[
  We can insert the eigenstates within this equation due to the fact that $ sum_j ketbra(pphi_j) = bb(1) $
]

This provides $ bra(pphi_f)T ket(pphi_i) = bra(pphi_f) V ket(pphi_i) + bra(pphi_f) V Pi_("LS") ket(pphi_j) bra(pphi_j) V ket(pphi_i) + dots.c $

- In an alternative/more convenient notation, $ T_(f i) = V_(f i) + (sum_j)V_(f j) Pi_("LS")(j) V_(j i) + (sum_j)V_(f i ) Pi_("LS")(j) V_(j k) Pi_("LS")(k) V_(k i ) + dots.c $
  Where $T_(i j)=bra(pphi_i)T ket(pphi_j)$, $V_(i j)=bra(pphi_i)V ket(pphi_j)$, $Pi_("LS")(j) = 1/(E-E_j)$ with $E_f = E_i$ and the sums tend to be omitted
#note("OFPT With particle interactions")[
  We can with a certain particle state $ket(i)$ and end with a final certain particle state $ket(f)$ and use _OFPT_ to calculate what happens in-between such states. An example of this is the case of an electron scattering off an electron.
]

#example("Electron Scattering")[
  This is an example from the textbook that I was reading which allows for the derivation of the _Advanced_ and _Retarded_ propagators.
]

  - The transition matrix element is $ T_(f i) = V_(f i) + sum_n V_(f n) 1/(E_i - E_n) V_(n i) + dots.c $
  - For electron scattering, the initial and final states are $ket(i)= ket(psi^1_e psi^2_e)$ and $bra(f)=bra(psi_e^3 psi_e^4)$
  - Due to the fact that Coulomb's law is replaced by photon exchange we need a photon field $pphi(x)$.
  - This provides $ V = 1/2 e integral d^3 x psi_e (x) pphi(x) psi_e (x) $ with the $1/2$ from spin and the $e$ as some coupling constant (which happens to be the electron charge).

 #note[
   - This interaction turns a $arrow(p)_1$ electron into a $arrow(p)_3 $ electron and a $arrow(p)_gamma$ photon.
   - Since both $ket(i)$ and $ket(f)$ have 2 electrons and no photons, $V_(i j) = 0$ //WTF
   
 ]
==== Retarded and Advanced Propagators
 
- This gets split into two states. (propagated by the _Retarded_ Propagator and the _Advanced_ Propagator)

- The propagators that this creates are foundational to quantum field theory, (the advanced and retarded ones), which is the primary reason behind this methodology.

 #figure(
   feyndrawgram(json("ret_propag_feynman.json"),unit:0.5pt) 
   , caption: [Retarded state]
 )


- In the Retarded state, electrons interact via the _Retarded Propagator_.
- We have that $ ket(n) = ket( psi^3_e pphi^gamma psi^2_e) $

 - Which implies that $ V^R_(n i) =  mel(psi^3_e pphi^gamma psi^2_e, V,psi^1_e psi^2_e ) \
  = mel( psi^3_e phi^gamma, V, psi_e^1) braket(psi^2_e) \ =  mel( psi^3_e pphi^gamma, V, psi^1_e) $


 #figure(
   feyndrawgram(json("adv_propag_feynman.json"),unit:0.5pt), caption:[ Advanced State ]

 )
- For the _advanced state_, a similar result is derived
  - $ V^A_(n i) = mel(psi^4_e phi^gamma , V, psi_e^2) $

==== Evaluating The Propagators
- $ V^R_(n i )= mel(psi^3_e phi^gamma, V ,psi^1_e) = e/2 integral dif^3 x mel(psi^3_e phi^gamma, psi_e (x) pphi(x) psi_e (x), psi^1_e) $
#note[
  - Free field (like the photon and electron fields inside of the integral)
  $ mel(pphi^gamma, pphi(x),0) =e^(- i arrow(p) dot arrow(x)) $
]
- This implies: $ V^R_(n i) = e integral dif^3 x e^(i (arrow(p)_1 - arrow(p)_2 - arrow(p)_3) dot arrow(x)) \ = e ddelta(3,arrow(p)_1 - arrow(p)_2 - arrow(p)_3) $
  - This is similar to other matrix elements

- First order: $ T_(f i) = integral dif^3 arrow(p)_gamma ddelta(3,arrow(p)_1 - arrow(p)_2 - arrow(p)_gamma) ddelta(3,arrow(p)_2 - arrow(p)_4 + arrow(p)_gamma) e^2/(E_i - E_n) $
    - Energy is not conserved in such intermediate states (otherwise $E_i = E_n$ would blow u
==== Energy Calculations


- We want to calculate the energy of the states

#rules("Denotations")[
  - Momenta of particles are $ arrow(p)_1, arrow(p)_2, arrow(p)_3, arrow(p)_4, arrow(p)_gamma $
  - The energy of each respective particle is
  
]






#include "interactions.typ"
