//#import "@preview/ctheorems:1.1.3": *
#import "@preview/layout-ltd:0.1.0": layout-limiter
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4" as cetz-plot
#import "@preview/physica:0.9.8": *
#import "@preview/physica:0.9.8": va as Va, vb as Vb, vu as Vu
#import "@preview/fancy-tiling:1.0.0": *
#import "@preview/mannot:0.3.3"
#import "@preview/fletcher:0.5.8"

#import "@preview/mitex:0.2.7":*

#let qft-macros = ```tex

\newcommand{\bra}[1]{\langle #1 \vert}
\newcommand{\ket}[1]{\vert #1 \rangle}
\newcommand{\braket}[2]{\langle #1 \vert #2 \rangle}
\newcommand{\mel}[3]{\langle #1 \vert #2 \vert #3 \rangle}
\newcommand{\ev}[1]{\langle #1 \rangle}
```

#let qft(body) = mitex(qft-macros.text + "\n" + body.text)

#import "@preview/feyndrawgram:1.0.0":feyndrawgram




#let cvector = cetz.vector
#let cmatrix = cetz.matrix
