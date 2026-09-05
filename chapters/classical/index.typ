#import "/src/components/index.typ": docs-frontmatter
#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Classical Field Theory",
  route: "cft",
)

== Classical Field Theory
- The idea behind *classical field theory* is to utilize the idea of Lagrangians that will be presented in _Lagrangians_ and in _Classical Symmetries_ to obtain a "toy theory" without the quantum effects that will later appear such as Loops in diagrams, etc. In practice, this means that it is essentially the _Lagrangian Formalism_ of Classical Mechanics where _position_ and _momentum_ coordinates $(p,q)$ are replaced by fields $(pphi,pi)$, as seen before in _Lagrangians_ without having been explicitly stated.
- Classical Field Theory, much like _Classical Mechanics_, functions as the unquantized equivalent to Quantum Field Theory. Quantization does not require much to achieve as simply putting quantization conditions on the operators being used acheives it with relative ease.

#example("Klein Gordon Equation")[
  - A very standard equation for a field in Classical Field theory is the _Klein Gordon Equation_. (This, in fact, describes a _free_ field in which there are no interactions, allowing for a very good "toy theory" to use and potentially apply later).

  $ (square + m^2)pphi = 0 $ or $ ( partial^2 + m^2 ) pphi = 0 $
  is the _Klein Gordon Equation_.
]
