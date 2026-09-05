= QED (TODO)

#import "../macros.typ":*

#definition("Quantum Electrodynamics")[
  Quantum Electrodynamics is a relatively simple theory with only one force involved (as suggested by the name, it is the electromagnetic force), mediated by the _photon_  $A_mu$ and one/two type(s) of fermion depending on what you consider a type of particle  (an _electron_/_positron_) 
]

=== Charge

- The charge in quantum electrodynamics is associated with the $"U"(1)$ symmetry $ pphi -> e^(- i alpha(x)) pphi $ (in fact, this applies in spinor QED as well, due to the )
- 

== Spinor QED (Standard Quantum Electrodynamics)

- The Spinors in Quantum Electrodynamics are Dirac Spinors due to their presence of charge (Since Majorana spinors are the same as their antiparticle, they of course cannot be a candidate for this, and hence the spinors must be Dirac Spinors).



=== Solution to the Dirac Equation

- We want to quantize our dirac spinors $psi$.
- We follow a similar procedure to what we did with photons (we will introduce basis spinors similar to polarizations $epsilon_mu$ )
- The dirac equation #qft(```latex
(i\not\partial - m)\psi = 0
```) implies that, for spinors
#qft(```\left((i\partial_\mu - eA_\mu)^2 - \frac{e}{2} F_{\mu\nu} \sigma^{\mu\nu} - m^2\right) \psi = 0
```)

- For antispinors, #qft(```latex
\overline{\psi} \left( (i\overleftarrow{\partial}_\mu + eA_\mu)^2 + \frac{e}{2} F_{\mu\nu} \sigma^{\mu\nu} - m^2 \right) = 0
```)

- Similarly to a Scalar field theory, we will quantize particles by writing $ psi_s (x) = integral diff(3,p) u_s (p) e^(i p x) $ for particles and $ chi_s (x) = integral diff(3,p) v_s (p) e^(i p x) $ for antiparticles

- These $u_s (p)$ and $v_s (p)$ are _basis spinors_ which satisfy the momentum space dirac equation. That is, $ mat(-m, p dot sigma; p dot macron(sigma), -m) u_s (p) = mat(-m, -p dot sigma; -p dot macron(sigma),  -m;) v_s (p) = 0 $ 
- Again, these $u_s (p)$ and $v_s (p)$ are 4-index Dirac spinors.
#rules("Basis Dirac Spinors")[In general, the solution to this equation is $ u_s (p) = mat(sqrt(p dot sigma) xi; sqrt(p dot macron(sigma)) xi), v_s (p) = mat(sqrt(p dot sigma) eta_s ; -sqrt(p dot macron(sigma)) eta_s) $]
  - $ sum_s u_s (p) macron(u)_s (p) = feynman(p) + m $

  - $ sum_s v_s (p) macron(v)_s (p) = feynman(p) - m $
 


=== CPT Theorem

- In order to have the entire Lorentz Group, we must define the following discrete transforms for spinors.
- Time reversal $T$ which maps $ T: (t,arrow(x)) -> (-t,arrow(x)) $
- Parity $P$ which maps $ P: (t, arrow(x)) -> (t, -arrow(x)) $
- Charge conjugation $ C: psi -> -i gamma^2 psi $ reverses charge (essentially it is $"particle"->"antiparticle"$)



=== Interacting QED

- The Lagrangian for Quantum Electrodynamics is $ lag = -1/4 F_munu F^munu + i macron(psi) feynman(D) psi - m macron(psi) psi \ = -1/4 F_munu F^munu  + macron(psi) (i gamma^mu partial mu - m ) psi - e macron(psi) gamma^mu psi A_mu $

- This gives rise to the interaction $-i e gamma^mu$ with the Feynman Diagram //insert 4 feynman diagrams for vertex interactions e macron(psi) gamma^mu psi A_mu

#theorem("Spin-Statistics Theorem")[
  The Spin statistics theorem is the theorem that spinors are governed by Fermi-Dirac statistics and that Vectors are governed by Bose-Einstein statistics. Essentially $psi(x) chi(y) = - chi(x) psi(y)$ and
]

- The Feynman propagator for spinors is $ mel(0, T psi(0) macron(psi)(x) , 0 ) = integral diff(4,p)  (i ( feynman(p) +m))/(p^2 - m^2 + i epsilon) e^(i p x ) $ with of course the implicit limit of $epsilon -> 0$
  - The derivation for this is as follows
  - 

- The Feynman propagator clearly gives rise to the electron propagator present on internal electrons $ "feynman diagram" = i(feynman(p) + m)/(p^2 - m^2 + i epsilon) $

- The QED vertex factor is given by the interaction term $-e macron(psi) gamma^mu A_mu psi$
$ #feyndrawgram(json("Diagrams/vert_1.json")) quad  = quad #feyndrawgram(json("Diagrams/vert_2.json")) \ = quad #feyndrawgram(json("Diagrams/vert_3.json"))  quad = quad #feyndrawgram(json("Diagrams/vert_4.json")) quad = (-i e gamma^mu) $ 

- Notice how all of these terms are equivalent (as opposed to scalar QED)
  - This is one of the many differences between spinor QED and scalar QED

- Another difference in Spinor QED is the fact that it has no seagull interaction allowed by an $A^2 pphi^2$ term in scalar QED, simply because this term doesnt exist in QED


