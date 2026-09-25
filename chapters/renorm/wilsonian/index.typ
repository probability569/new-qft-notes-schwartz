#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#let chevron = sym.chevron

#show: docs-subchapter.with(
  title: "Wilsonian Renormalization",
  route: "wilsonian",
)




- This is such an important topic in quantum field theory that I considered giving it its own section
  - Wilsonian renormalization has application in not only quantum field theory, but effectively all of physics in the language of condensed matter physics which is why it is an amazing feat that should not be overlooked
- Wilsonian renormalization tells us how we can neglect exteremely high energy terms which decay exponentially with a high cutoff (as you will see)

=== Running Coupling
- We must first define the _running coupling_ of a theory before discussing wilsonian renormalization
- The running coupling is defined through the $beta$-function 
#definition("Beta Function")[
  The beta function is defined as $ beta(g) equiv mu dif/(dif mu) g $
]
- This represents how the renormalized coupling constants of a theory "run" with the scale at which the theory is measured. 
- The $beta$ function of a theory is equivalent to $ beta(g) =  Lambda (dif)/(dif Lambda) g $ where the $Lambda$ is interpreted as the energy scale which will be shown.
- 