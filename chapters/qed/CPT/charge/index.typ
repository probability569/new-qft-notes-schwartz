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