#import "../macros.typ":*
== Useful Math formalism (Appendix): Helicity Spinors (TODO)

#rules("Summary")[
  - Helicity spinors are a way to write polarizations $epsilon_mu$ and momentum $p_mu$ in terms of a more natural way (bispinors)
    - This is more convenient specifically for calculating gluon scattering
  - They are written in the weyl representation where $psi_alpha$ and $tilde(chi)^(dot(alpha))$ are left and right handed spinors
]

- Notice that spin 1 fields transform in the $(1/2,1/2)$ representation of the Lorentz group
  - This entails that we can write them as bispinors instead of 4-vectors
- Remember the mathematical relations for spinors in the weyl representation:
  - $ epsilon^(alpha beta) psi_alpha (x) psi_beta (x)$ and $epsilon_(dot(alpha) dot(beta)) tilde(psi)^(dot(alpha)) tilde(psi)^(dot(beta))$ are L.I.
- Some useful relations with these (and the pauli matrices) are #qft(```latex
g^{\mu\nu} \sigma_{\mu}^{\alpha\dot{\alpha}} \sigma_{\nu}^{\beta\dot{\beta}} = 2 \epsilon^{\alpha\beta} \epsilon^{\dot{\alpha}\dot{\beta}}
\\
\epsilon_{\alpha\beta} \epsilon_{\dot{\alpha}\dot{\beta}} \sigma^{\mu\dot{\beta}\beta} = \bar{\sigma}^{\mu}_{\dot{\alpha}\alpha}
```)
- For the inner product, defined as #mi(```latex
\psi\chi \equiv \varepsilon^{\alpha\beta} \psi_{\alpha}(x) \chi_{\beta}(x)
```)
  - $psi chi = chi psi$
- All of these spinors are fields. What happens when we use constant spinors?

#definition("Helicity Spinor")[
  - $RR$ or $CC$ doublets that transform in the $(1/2,0)$ or $(0,1/2)$ representation of the Lorentz Group
]
- The inner products for these are 
- #qft(```latex
\ev{\lambda \chi} = \epsilon^{\alpha \beta} \lambda_{\alpha} \chi_{\beta} = \lambda_{\alpha} \chi^{\alpha} = -\lambda^{\alpha} \chi_{\alpha}
```)
- #qft(```latex
[\lambda \chi] = \epsilon_{\alpha \beta} \tilde{\lambda}^\alpha \tilde{\chi}^\beta = \tilde{\lambda}^\alpha \tilde{\chi}_\alpha = -\tilde{\chi}_\alpha \tilde{\lambda}^\alpha
```)
- These products have some identities due to them commuting: #qft(```latex
\ev{\lambda \chi} = - \ev{\chi \lambda}, [\lambda \chi] = - [\chi \lambda] \\
[\lambda \lambda] = \ev{\lambda \lambda} = 0
```)

=== Momentum
- For bispinor representation of momentum, we have:
#qft(```latex
p_{\alpha\dot{\alpha}} \equiv \sigma_{\alpha\dot{\alpha}}^\mu p_\mu = \begin{pmatrix} p^0 - p^3 & -p^1 + i p^2 \\ -p^1 - i p^2 & p^0 + p^3 \end{pmatrix}
```)

- *Relations* with these spinors are: #qft(```latex
p^{\alpha\dot{\alpha}} \equiv \sigma^{\alpha\dot{\alpha}}_{\mu} p^{\mu}, \quad p_{\alpha\dot{\alpha}} = \bar{\sigma}^\mu_{\alpha\dot{\alpha}} p_\mu, \\
p^\mu = \frac{1}{2} \bar{\sigma}^{\mu\alpha\dot{\alpha}} p_{\alpha\dot{\alpha}}, \quad p^\mu = \frac{1}{2} \bar{\sigma}^\mu_{\alpha\dot{\alpha}} p^{\alpha\dot{\alpha}}.
```)


- If $p^(alpha dot(alpha))$ is lightlike (that is, #mi(```latex
\det(p^{\alpha\dot{\alpha}}) = 0 
```)), we can express it in terms of an outer product #qft(```latex
p^{\alpha\dot{\alpha}} = \lambda^\alpha \tilde{\chi}^{\dot{\alpha}}
```)

#derivation("Explicit Lambda Values")[
#qft(```latex
\lambda_\alpha = \frac{z}{\sqrt{p^0-p^3}} \begin{pmatrix} p^0-p^3 \\ -p^1-ip^2 \end{pmatrix}, \\
\tilde{\lambda}^\dot{\alpha} = \frac{z^1}{\sqrt{p^0-p^3}} (p^0-p^3, -p^1+ip^2)
```)
]

==== Little Group

- These momenta bispinors are invariant under $lambda_alpha -> z lambda_alpha$ and $tilde(lambda)^dot(alpha) -> 1/z tilde(lambda)^dot(alpha)$

  - This is equivalent to a phase shift $z = e^(i pphi)$ if the momenta are real

==== Connecting Momentum and Helicity Spinors

- Notice that the dot product $ #qft(```latex
p \cdot q = \frac{1}{4} g_{\mu \nu} \sigma^\mu_{\alpha \dot{\alpha}} \sigma^\nu_{\beta \dot{\beta}} \lambda^\alpha \tilde{\lambda}^{\dot{\alpha}} \chi^\beta \tilde{\chi}^{\dot{\beta}} \\
= \frac{1}{2} \varepsilon_{\alpha \beta} \varepsilon_{\dot{\alpha} \dot{\beta}} \lambda^\alpha \tilde{\lambda}^{\dot{\alpha}} \chi^\beta \tilde{\chi}^{\dot{\beta}} 
```) #qft(```latex
= \frac{1}{2} \ev{\chi \lambda} [\chi \lambda]
```) $
- Therefore, we obtain that $chevron.l chi lambda chevron.r$ and $[chi lambda]$ are the square roots of inner products up to a phase shift #qft(```latex
\ev{\lambda \chi} = \sqrt{2p \cdot q} \, e^{i\phi} \\
[\chi \lambda] = \sqrt{2p \cdot q} \, e^{-i\phi}
```)
  - This allows us to write $ lambda_alpha = p chevron.r, quad lambda_alpha = chevron.l p, quad tilde(lambda)^(dot(alpha)) = [p, quad tilde(lambda)_(dot(alpha)) = p] $ As for our momentum, #qft(```latex
p^{\alpha\alpha} = p \rangle [p, p_{\alpha\alpha} = p] \langle p
```)

  - The dot products of momenta are #qft(```latex
q \cdot p = q^\mu p_\mu = \frac{1}{2} q_{\alpha \dot{\alpha}} p^{\dot{\alpha} \alpha} \\
= \frac{1}{2} \text{tr}\{ q ] \langle q p\rangle [ p \} \\
= \frac{1}{2} \ev{q p} [ q p ]
```)

- Here is another identity that is useful: 
#qft(```latex
\sum_{i} p_i = 0 \\
\sum_{j} \lambda_\alpha^j \lambda_\alpha^j = 0 \\
\sum_{j=1}^n j\rangle [j = 1\rangle [1+2\rangle [2+\dots+n\rangle [n = 0
```)

- To help us with being terse, we write $i chevron.r equiv p_i chevron.r$, etc.

  - Our conservation of momentum $ sum_j chevron.l i j chevron.r [j k] = 0 $
  - Since the spinors are two dimensions, we can write them in terms of two other spinors (a _linear combination_)
  $ 1 chevron.r = (chevron.l 1 3 chevron.r)/(chevron.l 2 3 chevron.r) 2 chevron.2 - (chevron.l 12 chevron.r)/(chevron.l 23 chevron.r) 3 chevron.r $

=== Polarizations

  - All polarizations satisfy the relation that $ epsilon^*_mu epsilon^mu = -1, quad p_mu epsilon^mu = 0 $
  - Notice that $epsilon_mu epsilon^mu = 0$

#example("Helicity Polarizations")[
  - If the momentum is $p^mu = (E,0,0,E)$ then we obtain polarizations#qft(```latex
\epsilon^\mu_+ = \frac{1}{\sqrt{2}}(0, 1, i, 0), \\
\epsilon^\mu_- = \frac{1}{\sqrt{2}}(0, 1, -i, 0)
```)
  - as seen before, they are the _helicity polarizations_
]


#definition("Reference Momentum")[
  - In order to write the polarizations in terms of the momentum, we need a reference momentum. In the case of gluon scattering which this is a very useful tool for, we take the reference momentum to be the momentum of the other gluons.

  - This is denoted by $r^mu$
]
  - Writing $ p^(alpha dot(alpha)) = p chevron.r [p, quad r^(alpha dot(alpha)) = r chevron.r [r $
  - Thus, the polarizations in the bibspinor format is written as #qft(```latex
[\varepsilon_p^-(v)]^{\alpha\dot{\alpha}} = \sqrt{2} \frac{ p \rangle [r}{[p r]} \\
[\varepsilon_p^+(v)]^{\alpha\dot{\alpha}} = \sqrt{2} \frac{ r \rangle [p}{\langle r p\rangle}
```)

$ #qft(```latex
\varepsilon^{-}_{p}(v) \cdot \varepsilon^{+}_{p}(v) = \frac{1}{2} [\varepsilon^{-}_{p}(v)]_{\dot{\alpha}\alpha} [\varepsilon^{+}_{p}(v)]^{\alpha \dot{\alpha}}
```)
 \ = 1/2 2/([p r] chevron.l r p chevron.r) tr{r] chevron.l p r chevron.r [p} = -1 $
 - since $chevron.l p p chevron.r [p p] = 0$, we have that #mi(```latex
\varepsilon^+ \varepsilon^+ = \varepsilon^- \cdot \varepsilon^- = 0
```)

