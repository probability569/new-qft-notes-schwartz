#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#let chevron = sym.chevron

#show: docs-subchapter.with(
  title: "Gamma Matrix Identities",
  route: "gamma-identities",
)



- There are some important identities involving the traces of the $gamma$ matrices that are almost essential for computing anything QED related
- The following are some identities that are essential to know:
- Cyclic property of trace (general matrices):
- #mitex(```latex
\text{Tr}(A B \dots C) = \text{Tr}[B \dots C A]
```)

- Gamma-5 #lemma[#mitex(```latex
\gamma^5 = i\gamma^0\gamma^1\gamma^2\gamma^3 \\
(\gamma^5)^2 = 1, \quad \gamma^5\gamma^\mu = -\gamma^\mu\gamma^5 \\
\{\gamma^\mu, \gamma^\nu\} = 2g^{\mu\nu} \mathbb{I}
```)]

- Trace of gamma matrix $times$ identity #lemma[#mitex(```latex
\text{Tr}[g^{\mu\nu}\mathbb{I}] = g^{\mu\nu}\text{Tr}(\mathbb{I}) = 4g^{\mu\nu} \\
\rightarrow \text{Tr}[\gamma^\mu] = \text{Tr}[\gamma_5\gamma_5\gamma^\mu] \\
= \text{Tr}[\gamma_5\gamma_5\gamma^\mu] = \text{Tr}[\gamma^\mu] \\
\rightarrow \text{Tr}[\gamma^\mu] = 0 
```)]
- Trace of 2 gamma matrices: #lemma[#mitex(```latex
\text{Tr}[\gamma^\mu \gamma^\nu] = \text{Tr}[-\gamma^\nu \gamma^\mu + 2g^{\mu\nu} \mathbb{I}] \\
= -\text{Tr}[\gamma^\mu \gamma^\nu] + 8g^{\mu\nu} \\
\Rightarrow \text{Tr}[\gamma^\mu \gamma^\nu] = 4g^{\mu\nu}
```)]

- Trace of 3 gamma matrices: #lemma[#mitex(```latex
\text{Tr}\{\gamma^\alpha \gamma^\beta \gamma^\mu\} = 0
```)]
- Trace of 4 gamma matrices: #lemma[#mitex(```latex
\text{Tr}[\gamma^\alpha \gamma^\mu \gamma^\beta \gamma^\nu] = 4(g^{\alpha\mu} g^{\beta\nu} - g^{\alpha\nu} g^{\mu\beta} + g^{\alpha\nu} g^{\mu\beta})
```)]