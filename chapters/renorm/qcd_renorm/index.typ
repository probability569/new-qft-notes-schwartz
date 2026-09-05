#import "../macros.typ":*

== Running Coupling of QCD
- *This in no way is the order that you should learn QFT but it is a convenient way to keep notes*

- How does the strong force coupling constant $alpha_s$
  - Spoiler alert, it runs the opposite way that $alpha_"QED"$ does.
- In order to get the coupling, we need to renormalize it
- In order to renormalize QCD, we need to calculate the loops
$therefore$ we should calculate loops lmao

=== Vac pol
- There are 4 + 1 counterm graphs for the QCD vacuum polarization


$ "1 loop vac pol" = quad #feyndrawgram(json("gluon_vac_pol_1.json")) quad + quad #feyndrawgram(json("gluon_vac_pol_2.json")) \ + quad #feyndrawgram(json("gluon_vac_pol_3.json")) quad + quad #feyndrawgram(json("gluon_vac_pol_4.json")) \ + quad #feyndrawgram(json("gluon_vac_pol_counterterm.json")) $

- First, consider the gluon $->$ quarks $->$ gluon diagram

$ i cal(M)_p^(a b munu) = quad #feyndrawgram(json("gluon_vac_pol_1.json")) \ = #qft(```latex
\text{tr}(T^a T^b) (ig)^2 \int d^4k \frac{i}{(p-k)^2 - m^2} \frac{i}{k^2 - m^2} \text{tr} \left[ \gamma^\mu (\not{p} - \not{k} + m) \gamma^\nu (\not{k} + m) \right]
```) $
- This is the exact same as QED except there is a color factor $tr[T^a T^b] = T_F delta^(a b) = 1/2 delta^(a b) $

- The answer is of the form #qft(```latex
\mathcal{M}_F^{ab\mu\nu} = -g^2 (g^{\mu\nu}p^2 - p^\mu p^\nu) \delta^{ab} \Pi_2(p^2)
```)
- Then, #qft(```latex
\mathcal{M}_F^{ab\mu\nu} = -\delta^{ab} T_F \frac{g^2}{2\pi^2} (p^2 g^{\mu\nu} - p^\mu p^\nu) \\ \times \int_0^1 dx \, x(1-x) \left[ \frac{2}{\varepsilon} + \ln \frac{\tilde{\mu}^2}{m^2 - p^2 x(1-x)} + O(\varepsilon) \right]
```)  
  - Notice how the pole and the coefficient of the log is indep. of the quark mass

- In the massless quark limit, #qft(```latex
\mathcal{M}_F^{ab\mu\nu} = \delta^{ab} T_R \left( \frac{g^2}{16\pi^2} \right) (p^2 g^{\mu\nu} - p^\mu p^\nu) \left[ -\frac{8}{3} \frac{1}{\epsilon} - \frac{20}{9} - \frac{4}{3} \ln \frac{\mu^2}{-p^2} \right]
```)

- Now let's look at the double gluon bubble (the vertices are triple g)

  - $ i cal(M)_3^(a b munu) = #feyndrawgram(json("gluon_vac_pol_2.json")) \ = #qft(```latex
\frac{g^2}{2} \int d^4k \frac{-i}{k^2} \frac{-i}{(k-p)^2} f^{ace} f^{bdf} g^{cf} \delta^{ed} N^{\mu\nu} ```) $
- The numerator $N^munu$ is equivlent to #qft(```latex
N^{\mu\nu} = [g^{\mu\alpha}(p+k)^{\rho} + g^{\alpha\rho}(p-2k)^{\mu} + g^{\rho\mu}(k-2p)^{\alpha}] \\ \times g^{\alpha\beta} g^{\rho\sigma} [g^{\nu\beta}(p+n)^{\sigma} - g^{\beta\sigma}(2k-p)^{\nu} - g^{\sigma\nu}(2p-k)^{\beta}]
```)
#derivation("Feynman Parameterization")[
  - Parameterizing with feynman parameters #qft(```latex
\frac{1}{k^2(p-k)^2} = \int_0^1 dx \frac{1}{[(1-x)k^2 + x(p-k)^2]^2}
```)
  - Taking $k -> k + x p$ and completing the square, we obtain that #qft(```latex
i \mathcal{M}_3^{ab\mu\nu} = \frac{g^2}{2} \int_0^1 dx \int d^4k \frac{1}{(k^2 - \Delta)^2} f^{acd} f^{bcd} N^{\mu\nu}
```) where #mi(```latex
\Delta = x(x-1)p^2
```)
- Now, our numerator is $ N^munu = 2k^2 g^munu - (6-4d)k^mu k^nu - (6(x^2 - x+1) - d(1+2x)^2) p^mu p^nu \ - (2x^2 -2x +5) p^2 g^munu \ underbrace(-(2-4x)g^munu (k dot p) + (2d-3)(2x-1)(k^mu p^nu + k^nu p^mu),"vanishes since are odd in "k->-k ) $ 
- In DimReg, we can replace the $k^mu k^nu$ terms with $1/d k^2 g^munu$
]
- Now, we have #qft(```latex
\mathcal{M}^{ab\mu\nu} = -\frac{g^2 \mu^{4-d}}{(4\pi)^{d/2}} \delta^{ab} \int_0^1 dx \left( \frac{1}{\Delta} \right)^{2-d/2} \left\{  g^{\mu\nu} 3 (d-1) \Gamma(1-d/2) \Delta \\ + p^\mu p^\nu \left[ 6(x^2-x+1) - d(1-2x)^2 \right] \Gamma(2-d/2) \\ + g^{\mu\nu} p^2 \left[ (-2x^2+2x-5) \Gamma(2-d/2) \right] \right\}
```)


- Our next diagram that we have to evaluate is $ #feyndrawgram(json("gluon_vac_pol_3.json")) equiv i cal(M)_4^(a b munu) $
- This is proportional to $ integral diff(4,k) 1/k^2$ which vanishes in DimReg but it is still fairly reasonable to actually evaluate the diagram just to see (in PV the divergence is quadratic)
- #qft(```latex
i\mathcal{M}_4^{ab\mu\nu} = -\frac{ig^2}{2} \mu^{4-d} \int d^d k \frac{-ig^{\rho\sigma} \delta^{cd}}{k^2 + i\epsilon} \times \left[ f^{abe} f^{cde} (g^{\mu\rho} g^{\nu\sigma} - g^{\mu\sigma} g^{\nu\rho}) \\ + f^{ace} f^{bde} (g^{\mu\nu} g^{\rho\sigma} - g^{\mu\rho} g^{\nu\sigma})  + f^{ade} f^{bce} (g^{\mu\nu} g^{\rho\sigma} - g^{\mu\sigma} g^{\nu\rho}) \right]

\\ = -g^2 \delta^{ab} g^{\mu\nu} C_A (d-1) \mu^{4-d} \int d^d k \frac{1}{k^2 + i\epsilon}
```)
- Multiplying by $(p-k)^2/(p-k)^2$ yields $N^munu = g^munu (p-k)^2$
- Parametrizing gives $ #qft(```latex
\mathcal{M}_{\mu}^{ab \mu \nu} = -g^2 \delta^{ab} C_A \frac{m^{4-d}}{(4\pi)^{d/2}} g^{\mu \nu} \int_0^1 dx \left( \frac{1}{\Delta} \right)^{2-d/2} \\ \times (d-1) \left[ -\frac{d}{2} \Gamma(1-d/2) \Delta + (1-x)^2 p^2 \Gamma(2-d/2) \right]
```) \ (=0) $

- Now, we evaluate the diagram for the ghost

$ i cal(M)_"gh"^(a b munu) = #feyndrawgram(json("gluon_vac_pol_4.json")) \ #qft(```latex
= (-1) g^2 \int d^4k \frac{i}{(k-p)^2} \frac{i}{k^2} f^{cad} k^\mu f^{dbc} (k-p)^\nu
```) $

- This implies that #qft(```latex
\mathcal{M}_{\mu\nu}^{ab} = g^2 \frac{\mu^{4-d}}{(2\pi)^{d/2}} \delta^{ab} C_A \int_0^1 dx \left( \frac{1}{\Delta} \right)^{2-d/2} \\ \times \left\{ g_{\mu\nu} \left[ \frac{1}{2} \Gamma(1-d/2) \Delta \right] + p_\mu p_\nu [x(1-x)] \Gamma(2-d/2) \right\}
```)

- Now, we can evaluate the full vacuum polarization that we have wanted to evaluate:

#derivation("Summing Diagrams + Tricks")[

#mitex(```latex
\mathcal{M}_{\text{glue}}^{ab\mu\nu} = \mathcal{M}_{3}^{ab\mu\nu} + \mathcal{M}_{4}^{ab\mu\nu} + \mathcal{M}_{gh}^{ab\mu\nu} \\
= \delta^{ab} C_A g^2 \int_0^1 dx \left( \frac{1}{\Delta} \right)^{2-d/2} \left\{ g^{\mu\nu} \Delta \left( \frac{3-3d}{d} + (d-1) + \frac{1}{d} \right) \frac{d}{2} \times \Gamma(1-d/2) \right\} \\
+ p^\mu p^\nu \left[ -3(x^2-x+1) + d/2(1-2x)^2 + x(1-x) \right] \Gamma(2-d/2) \\
+ g^{\mu\nu} p^2 \left[ (x^2-x+5/2) - (1-x)^2(d-1) \right] \Gamma(2-d/2)
```)
- There is a quadratic divergence from $Gamma(1-d/2)$ 
  - it has a coefficient of $1/d (d-2)^2$ which cancels
- Via Gamma function factorial identities (i.e. $Gamma(1-d/2)(d-2) = 2 Gamma(2-d/2)$, we obtain #qft(```latex \mathcal{M}_{\text{glue}}^{ab\mu\nu} = \delta^{ab} C_A g^2 \frac{\mu^{4-d}}{(4\pi)^{d/2}} \int_0^1 dx \left( \frac{1}{\Delta} \right)^{2-d/2} \Gamma(2-d/2) \left\{ g^{\mu\nu} p^2 \left[ (1-2x+3x-1)d + x(4x-5) + \frac{7}{2} \right] \\ + p^\mu p^\nu \left[ d/2(1-2x)^2 - 4x^2 + 4x - 3 \right] \right\} ```)
- Setting $d=4-epsilon$
#qft(```latex
\mathcal{M}_{\text{glue}}^{ab\mu\nu} = C_A \delta^{ab} \frac{g^2}{16\pi^2} (g^{\mu\nu} p^2 - p^\mu p^\nu) \times \left( \frac{10}{3\varepsilon} + \frac{31}{9} + \frac{5}{3} \ln \frac{\tilde{\mu}^2}{p^2} + O(\varepsilon) \right)
```)
]
- Adding in fermion flavor and colors, #qft(```latex
\mathcal{M}^{ab\mu\nu} = \delta^{ab} \frac{g^2}{16\pi^2} (g^{\mu\nu} p^2 - p^\mu p^\nu) \\ \times \left[ C_A \left( \frac{10}{3\epsilon} + \frac{5}{3} \ln \frac{\tilde{\mu}^2}{-p^2} \right) - n_f T_F \left( \frac{8}{3\epsilon} + \frac{4}{3} \ln \frac{\tilde{\mu}^2}{-p^2} \right) \right]
```)
- We can simply introduce a counterterm to remove this, which you will see
=== Other Renormalization

- The renormalized QCD lagrangina is #qft(```latex
\mathcal{L} = -\frac{1}{4} Z_3 (\partial_\mu A_\nu^a - \partial_\nu A_\mu^a)^2 \\
+ Z_2 \bar{\psi}_i (i \not\partial - Z_m m_p) \psi_i - Z_3 \bar{c}^a \Box c^a \\
- g_R Z_{A^3} f^{abc} (\partial_\mu A_\nu^a) A_\mu^b A_\nu^c \\
- \frac{1}{4} g_R^2 Z_{A^4} (f^{eab} A_\mu^a A_\nu^b) (f^{ecd} A_\mu^c A_\nu^d) \\
+ g_R Z_1 A_\mu^a \bar{\psi}_i \gamma^\mu T_{ij}^a \psi_j \\
+ g_R Z_{1c} f^{abc} (\partial_\mu \bar{c}^a) A_\mu^b c^c
```)

#trick[
  - #qft(```latex
\left[ \int d^d k \frac{1}{k^4} \right]_{\text{UV div}} = \frac{i}{8\pi^2} \frac{1}{\epsilon}
```) extracts the UV div. from a $1/k^4$ integral.
]


==== 2 Point Functions
- First, let's renormalize 2 point functions.

- For vacuum polarization, #qft(```latex
\mathcal{M}^{ab\mu\nu} = \delta^{ab} (g^{\mu\nu} p^2 - p^\mu p^\nu) \left\{ \frac{g^2}{16\pi^2} \left[ C_A \left( \frac{10}{3\epsilon} \right) - n_f T_F \left( \frac{8}{3\epsilon} \right) \right] - \delta_3 \right\} + \text{finite}
```)
$ therefore #qft(```latex
\delta_3 = \frac{1}{\epsilon} \frac{g^2}{16\pi^2} \left[ \frac{10}{3} C_A - \frac{8}{3} n_f T_F \right]
```) $

- Now, let's look at the quark self energy.

$ #feyndrawgram(json("quark_self.json")) $

