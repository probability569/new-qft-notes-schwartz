#import "/src/components/index.typ": docs-chapter
#import "/lib.typ": *

#let chevron = sym.chevron

#show: docs-chapter.with(
  title: "Quantum Electrodynamics",
  route: "QED",
)




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
=== Basis Dirac Spinors
 In general, the solution to this equation is $ u_s (p) = mat(sqrt(p dot sigma) xi; sqrt(p dot macron(sigma)) xi), v_s (p) = mat(sqrt(p dot sigma) eta_s ; -sqrt(p dot macron(sigma)) eta_s) $ 
  - $ sum_s u_s (p) macron(u)_s (p) = feynman(p) + m $

  - $ sum_s v_s (p) macron(v)_s (p) = feynman(p) - m $
 










