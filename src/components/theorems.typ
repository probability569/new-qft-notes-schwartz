#import "ctheorems/lib.typ": *

#let _is-web-render() = state("render-mode").get() == "web"
#let qed-symbol = $square$

#let _plain-text(value) = {
  if value == none { "" } else if type(value) == str { value } else if (
    type(value) == int or type(value) == float or type(value) == decimal
  ) { str(value) } else if type(value) == content {
    let fields = value.fields()
    if fields.keys().contains("text") { fields.text } else if fields.keys().contains("children") {
      fields.children.map(_plain-text).join("")
    } else if fields.keys().contains("body") { _plain-text(fields.body) } else if fields.keys().contains("child") {
      _plain-text(fields.child)
    } else if value.func() == [ ].func() { " " } else { "" }
  } else { str(value) }
}

#let _slug(value) = lower(_plain-text(value)).replace(" ", "-").replace(".", "-").replace("(", "").replace(")", "")

#let _html-thm-fmt(head, css-class, numbered: true) = thm => {
  let title = if numbered and thm.number != none { [#head #thm.number] } else { [#head] }
  let id = if numbered and thm.number != none { "thm-" + _slug(head) + "-" + _slug(thm.number) } else { none }
  let attrs = (class: "thm-box " + css-class)
  if id != none { attrs.insert("id", id) }

  html.elem("div", attrs: attrs, {
    html.elem("p", attrs: (class: "thm-head"), {
      html.elem("strong", title)
      if thm.name != none [ (#thm.name)]
      [.]
    })
    thm.body
  })
}

#let _html-proof-like-fmt(head, css-class, collapsible: false) = thm => {
  let title = if thm.name != none { [#head #thm.name] } else { [#head] }
  if collapsible {
    html.elem("details", attrs: (class: "thm-proof thm-solution"), {
      html.elem("summary", attrs: (class: "proof-head solution-head"), html.elem("em", [#title.]))
      proof-body-fmt(thm.body)
    })
  } else {
    html.elem("div", attrs: (class: "thm-proof"), {
      html.elem("p", attrs: (class: "proof-head"), html.elem("em", [#title.]))
      proof-body-fmt(thm.body)
    })
  }
}

#let thm-fmt = thm-fmt-block.with(
  name-fmt: x => smallcaps[(#x)],
  title-fmt: strong,
  body-fmt: emph,
  separator: [*.* ],
)

#let thm-def-fmt = thm-fmt-block.with(
  name-fmt: x => [(#x)],
  title-fmt: strong,
  body-fmt: x => x,
  separator: [*.* ],
)

#let thm-rem-fmt = thm-fmt-block.with(
  name-fmt: name => emph([(#name)]),
  title-fmt: emph,
  body-fmt: x => x,
  separator: [. ],
)

#let proof-pdf-fmt = thm-fmt-block.with(
  name-fmt: emph,
  title-fmt: emph,
  body-fmt: proof-body-fmt,
  separator: [. ],
)

#let _wrap(head, css-class, pdf-fmt, numbered: true, ..opts) = {
  thm.with(
    supplement: head,
    ..opts,
    fmt: thm => context {
      if _is-web-render() {
        _html-thm-fmt(head, css-class, numbered: numbered)(thm)
      } else {
        pdf-fmt(thm)
      }
    },
  )
}

#let _wrap-proof(head, css-class, pdf-fmt, collapsible: false) = {
  thm.with(
    supplement: head,
    numbering: none,
    fmt: thm => context {
      if _is-web-render() {
        _html-proof-like-fmt(head, css-class, collapsible: collapsible)(thm)
      } else {
        pdf-fmt(thm)
      }
    },
  )
}

#let theorem = _wrap("Theorem", "thm-theorem", thm-fmt, counter: "Theorem")
#let proposition = _wrap("Proposition", "thm-proposition", thm-fmt, counter: "Theorem")
#let lemma = _wrap("Lemma", "thm-lemma", thm-fmt, counter: "Theorem")
#let conjecture = _wrap("Conjecture", "thm-conjecture", thm-fmt, counter: "Theorem")
#let corollary = _wrap("Corollary", "thm-corollary", thm-fmt, counter: "Sub-Theorem", base: "Theorem")

#let definition = _wrap("Definition", "thm-definition", thm-def-fmt, counter: "Theorem")
#let example = _wrap("Example", "thm-example", thm-def-fmt, counter: "Theorem")
#let problem = _wrap("Problem", "thm-problem", thm-def-fmt, counter: "Problem")

#let remark = _wrap("Remark", "thm-remark", thm-rem-fmt, numbered: false, numbering: none)
#let claim = _wrap("Claim", "thm-claim", thm-rem-fmt, numbered: false, numbering: none)

#let proof = _wrap-proof("Proof", "thm-proof", proof-pdf-fmt)
#let solution = _wrap-proof("Solution", "thm-solution", proof-pdf-fmt, collapsible: true)

#let theorem-toc-entry(thm) = {
  let head = [#thm.supplement]
  if thm.number != none { head += [ #thm.number] }
  if thm.name != none { head += [ (#thm.name)] }
  head
}
