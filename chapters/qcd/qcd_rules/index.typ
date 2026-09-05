#import "../macros.typ":*

== QCD Feynman Rules

- Now, we have the full lagrangian for QCD (the F-P) one allowing us to read off feynman rules

- #qft(```latex
\mathcal{L} = -\frac{1}{4}(F_{\mu\nu}^a)^2 - \frac{1}{2\xi}(\partial_\mu A_\mu^a)^2 + \\ (\partial_\mu \bar{c}^a)(\delta^{ac}\partial_\mu + gf^{abc}A_\mu^b)c^c + \bar{\psi}_i(i\partial\!\!\!/ \delta_{ij} + gA_\mu^a T_{ij}^a - m\delta_{ij})\psi_j + \\ [(\delta_{ki}\partial_\mu - igA_\mu^a T_{ki}^a)\phi_i]^\dagger [(\delta_{kj}\partial_\mu - igA_\mu^a T_{kj}^a)\phi_j] - m^2 \phi_i^\dagger \phi_i
```)
- The kinetic terms for the lagrangian are #qft(```latex
\mathcal{L}_{\text{kin}} = -\frac{1}{4} (\partial_\mu A_n^a - \partial_\nu A_\mu^a)^2 - \\ \frac{1}{2\xi} (\partial_\mu A_\mu^a)^2 + \bar{\psi}_i (i \not{D} - m) \psi_i - \phi_i^* (\Box + m^2) \phi_i - \bar{c}^a \Box c^a
```)
- The rules are as follows: 

$ mu;a #feyndrawgram(json("gluon.json")) nu;b quad = #qft(```latex
\frac{-g^{\mu\nu} + (1-\xi)\frac{p^\mu p^\nu}{p^2}}{p^2} \delta^{ab}
```) $
- For ghosts,
$ #feyndrawgram(json("ghost.json")) quad  = #qft(```latex
 \frac{\delta^{ab}}{p^2 + i\epsilon}
```) $
- For colored fermions, 
$ i #feyndrawgram(json("color_fermion.json")) j quad = #qft(```latex
\frac{i\delta^{ij}}{\not{p}-m+i\epsilon}
```) $
- For colored scalars, 
$ i #feyndrawgram(json("colored_scalar.json")) j quad = #qft(```latex
\frac{i\delta^{ij}}{\not{p}-m+i\epsilon}
```)  $

- The interaction terms (which are where this gets interesting) are the following: #qft(```latex
\mathcal{L}_{int} = -g f^{abc} (\partial_\mu A_\nu^a) A_\mu^b A_\nu^c - \frac{1}{4} g^2 (f^{eab} A_\mu^a A_\nu^b) (f^{ecd} A_\mu^c A_\nu^d) \\ + g f^{abc} (\partial_\mu \bar{c}^a) A_\mu^b c^c  + g A_\mu^a \bar{\psi}_i \gamma^\mu T_{ij}^a \psi_j \\ + ig A_\mu^a T_{ij}^a (\phi_i \overleftrightarrow{\partial^\mu} \phi_j) + g^2 \phi_i^* A_\mu^a T_{ik}^a T_{kj}^b A_\mu^b \phi_j
```)
- Trips g:
$ #feyndrawgram(json("trips_g.json")) = #qft(```latex
g A^{abc} [ g^{\mu\nu} (k-p)^\mu + g^{\nu\rho} (p-q)^\mu + g^{\rho\mu} (q-k)^\nu ]
```) $
- Quads g:
$ #feyndrawgram(json("quads_g.json")) \  #qft(```latex
= -ig^2 [f^{abe} f^{cde} (g^{\mu\rho} g^{\nu\sigma} - g^{\mu\sigma} g^{\nu\rho}) + f^{ace} f^{bde} (g^{\mu\nu} g^{\rho\sigma} - g^{\mu\sigma} g^{\nu\rho}) + f^{ade} f^{bce} (g^{\mu\nu} g^{\rho\sigma} - g^{\mu\rho} g^{\nu\sigma})]
```) $

$ #feyndrawgram(json("scalar-glue.json")) = #qft(```latex
ig \gamma^\mu T^a_{ij}
```) $

$ #feyndrawgram(json("ghost-glue.json")) = #qft(```latex
-g f^{abc} p^{\mu}
```) $

$ #feyndrawgram(json("scalar-glue-2.json")) = #qft(```latex
ig(k^\mu + q^\mu)T^a_{ij}
```) $

$ #feyndrawgram(json("seagull.json")) = #qft(```latex
ig^2 T^a_{i k} T^b_{k j} g^{\mu\nu}
```) $



