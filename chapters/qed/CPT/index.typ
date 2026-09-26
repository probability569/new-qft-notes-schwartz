#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#let chevron = sym.chevron

#show: docs-subchapter.with(
  title: "CPT Theorem For Spinors",
  route: "cpt",
)

=== CPT Theorem

- In order to have the entire Lorentz Group, we must define the following discrete transforms for spinors.
- Time reversal $T$ which maps $ T: (t,arrow(x)) -> (-t,arrow(x)) $
- Parity $P$ which maps $ P: (t, arrow(x)) -> (t, -arrow(x)) $
- Charge conjugation $ C: psi -> -i gamma^2 psi $ reverses charge (essentially it is $"particle"->"antiparticle"$)

