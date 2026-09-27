#import "/src/components/index.typ": docs-subsubchapter
#import "/lib.typ": *

#let chevron = sym.chevron

#show: docs-subsubchapter.with(
  title: "Charge invariance",
  route: "charge",
)

- First, we would like to know what happens under charge conjugation for Dirac Spinors
- Consider the rest frame: 
  #mitex(```latex
u_{\uparrow} = \begin{pmatrix} 1 \\ 0 \\ 1 \\ 0 \end{pmatrix}, u_{\downarrow} = \begin{pmatrix} 0 \\ 1 \\ 0 \\ 1 \end{pmatrix}, v_{\uparrow} = \begin{pmatrix} 1 \\ 0 \\ 1 \\ 0 \end{pmatrix}, v_{\downarrow} = \begin{pmatrix} 0 \\ 1 \\ 0 \\ -1 \end{pmatrix}
```)

- Under charge conjugation, $u -> - i gamma_2 u$. #mitex(```latex
(u_\uparrow)^L = -i \gamma_2 \begin{pmatrix} 1 \\ 0 \\ 1 \\ 0 \end{pmatrix} = -i \begin{pmatrix} 0 & 0 & 0 & -i \\ 0 & 0 & i & 0 \\ 0 & i & 0 & 0 \\ i & 0 & 0 & 0 \end{pmatrix} \begin{pmatrix} 1 \\ 0 \\ 1 \\ 0 \end{pmatrix} = \begin{pmatrix} 0 \\ 1 \\ 0 \\ 1 \end{pmatrix} = v_{\downarrow}
```)


- We can write several things about charge conjugation
#theorem[
- Quantum Electrodynamics is invariant under charge conjugation
]

#proof[
- For a general spinor $psi$,
- #mitex(```latex
C: \psi \to -i \gamma_2 \psi^*
```)

- #mitex(```latex
C: \psi^* \to -i \gamma_2 \psi
```)

#lemma[ $ #mitex(```latex
C: \bar{\psi} \psi \to (-i \partial_2 \psi)^T \partial_0 (-i \partial_2 \psi) \\
= -\psi^T \partial_2^T \partial_0 \partial_2 \psi^* \\
= -\psi^T \partial_0 \psi^* \\
= -(\partial_0)_{\alpha\beta} \psi_\alpha \psi_\beta^* \\
```) \ = #mitex(```latex
(\partial_\alpha)_{\alpha\beta} \psi_\alpha \psi_\beta^* \\ = \partial_\alpha  \alpha\beta \psi_\beta^* \psi_\alpha \\ = (\partial_\alpha)_{\beta\alpha} \psi_\alpha^* \psi_\beta \\ = \psi^\dagger \gamma_0 \gamma_\alpha \psi = \bar{\psi} \psi
```) $ 
- Thus, $C: macron(psi) psi -> macron(psi) psi$ ]

#lemma[$ C: macron(psi) feynman(partial) psi -> macron(psi) gamma psi $]

#lemma[#mitex(```latex
C: \bar{\psi} \gamma^{\mu} \psi \to -\bar{\psi} \gamma^{\mu} \psi
```)]

#lemma[
  If $#mitex(```latex
e A_{\mu} \bar{\psi} \gamma^{\mu} \psi
```)$ is charge invariant, #mitex(```latex
C: A_{\mu} \to \bar{A}_{\mu}
```)
  Since $F^2_munu$ is invariant, #mitex(```latex
C: A_{\mu} \to \pm \bar{A}_{\mu}
```)
]
Thus, QED is charge invariant.
]