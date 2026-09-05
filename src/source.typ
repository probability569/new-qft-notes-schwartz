#let title = "Notes on QFT"

#let book = "Schwartz QFT"
#let authors = ("Probability Floor",)
#let date = "August 2026"
#let source-url = "https://github.com/probability569/qft-notes-schwartz"
// Public site root, used by 404.html even for deeply nested missing URLs.
#let site-url = "https://probability569.github.io/qft-notes-schwartz"
#let abstract(render-mode) = [
  #let _quote = quote[note to self, do this or im the biggest retard]
  #let _credit = [feyman likely]
  #if render-mode == "pdf" {
    align(center)[#_quote]
    align(right)[#_credit]
  } else {
    html.elem("div", attrs: (style: "text-align: center;"), _quote)
    html.elem("div", attrs: (style: "text-align: right;padding-bottom: 0.5rem"), _credit)
  }

]

#let web-view-recommendation = [
  For the best web viewing experience, we recommend using a Mozilla-based browser such as Firefox. This will be subject to change as browsers improve their MathML support.
]

#let join-oxford-commas(v) = {
  if v.len() < 2 { v.at(0, default: "") } else if v.len() == 2 { v.join(" and ") } else {
    v.slice(0, -1).join(", ") + ", and " + v.last()
  }
}

#let web-cover(href) = {
  html.elem("section", attrs: (class: "cover"), {
    html.elem("h1", title)
    html.elem("p", attrs: (class: "authors"), [by #join-oxford-commas(authors.map(smallcaps))])
    html.elem("p", attrs: (class: "date"), date)
    html.elem("div", attrs: (class: "abstract"), abstract("web"))
    html.elem("div", attrs: (class: "recommendation"), web-view-recommendation)
    html.elem("p", attrs: (class: "download"), {
      html.elem("a", attrs: (class: "button", href: href("pdf/notes.pdf")), [Download PDF])
    })
  })
}

#let pdf-cover(outline-target: heading) = [
  #set document(
    title: title,
    author: join-oxford-commas(authors),
  )
  #set page(background: rotate(20deg, {
    let f(n) = {
      if n <= 1 {
        $#box($cal(L)$)$
      } else {
        let prev = f(n - 1)
        $#prev _(#prev)^(#prev)$
      }
    }

    text(fill: black.transparentize(70%))[$#f(8)$]
  }))
  #align(center)[
    #v(2cm)
    #text(size: 24pt, weight: "bold")[#title]

    #text(size: 13pt)[#join-oxford-commas(authors.map(smallcaps))]

    #text(size: 11pt)[#date]

    #raw("Source: " + source-url)
  ]

  #block(inset: 10pt)[#abstract("pdf")]
  #outline(target: outline-target)
  #set page(background: none)
]
