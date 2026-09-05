#import "/src/components/index.typ": docs-frontmatter
#import "/lib.typ": *

#show: docs-frontmatter.with(
  title: "Mathematical Prerequisite and Notations",
  route: "prereq",
  description: "A short orientation to the course notes.",
  children: [
    #include "lin-alg/index.typ"
  ]
)
abc $quad $abc

#lbl(<eqn:third>, $ F = m a $)




eqn
sec
thm
sol
pbm
plm
lem
chp
