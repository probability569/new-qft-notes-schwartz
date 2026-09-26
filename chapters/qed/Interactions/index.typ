#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#let chevron = sym.chevron

#show: docs-subchapter.with(
  title: "Interacting QED",
  route: "interacting",
)



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
$ #feyndrawgram(json("../Diagrams/vert_1.json")) quad  = quad #feyndrawgram(json("../Diagrams/vert_2.json")) \ = quad #feyndrawgram(json("../Diagrams/vert_3.json"))  quad = quad #feyndrawgram(json("../Diagrams/vert_4.json")) quad = (-i e gamma^mu) $ 

- Notice how all of these terms are equivalent (as opposed to scalar QED)
  - This is one of the many differences between spinor QED and scalar QED

- Another difference in Spinor QED is the fact that it has no seagull interaction allowed by an $A^2 pphi^2$ term in scalar QED, simply because this term doesnt exist in QED




