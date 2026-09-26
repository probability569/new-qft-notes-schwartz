#import "/src/components/index.typ": render-mode, route-folders, thm-counter, thm-state

#set heading(numbering: none)
#route-folders.update(())
#thm-counter.thm-counters.update((:))
#thm-state.thm-stored.update(())

#include "cover.typ"
#include "preface/index.typ"

#context if render-mode.get() == "pdf" {
  pagebreak()
}

#set heading(numbering: "1.1")
#counter(heading).update(0)
#include "math/index.typ"
#include "scalar/index.typ"
#include "classical/index.typ"
#include "classical/lagrangians/index.typ"
#include "classical/noether/index.typ"
#include "scalar/Propagators/index.typ"
#include "scalar/Propagators/interactions/index.typ"
#include "scalar/Quantization and Fock/index.typ"
#include "cross_sect/index.typ"
#include "feynman_diagrams/index.typ"

#include "qed/Lorentz/index.typ"
#include "qed/CPT/index.typ"
#include "qed/CPT/charge/index.typ"
#include "qed/CPT/parity/index.typ"
#include "qed/CPT/time/index.typ"
#include "qed/index.typ"
#include "qed/Interactions/index.typ"
#include "qed/gamma_identities/index.typ"
#include "renorm/index.typ"
// #include "renorm/qcd_renorm/index.typ"
#include "renorm/wilsonian/index.typ"

#include "qcd/index.typ"
#include "qcd/qcd_rules/index.typ"
#include "qcd/helicity/index.typ"
#include "ew/index.typ"


#set heading(numbering: "A.1")
#counter(heading).update(0)
#route-folders.update(("appendix-1",))
// #include "appendices/index.typ"


#context if render-mode.get() == "pdf" { pagebreak() }
#include "bibliography/index.typ"
