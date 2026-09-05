#import "/src/components/index.typ": docs-backmatter
#import "/lib.typ": *

#show: docs-backmatter.with(
  title: "Bibliography",
  route: "bibliography",
  description: "References cited by the notes.",
)

#context bibliography("/references.bib", full: true, group: state("render-mode").get())
