#import "packages.typ": *

#let potential-frame(arg) = context {
  if target() != "paged" {
    html.frame(arg)
  } else {
    arg
  }
}
#let canvas(..args) = {
  potential-frame(cetz.canvas(..args))
}
#let ray(body, dy: 0em, tag: none) = context {
  if target() != "paged" {
    return math.arrow(body)
  }
  let body = pad(top: 0em, $#body$)

  mannot.core-mark(body, tag: tag, color: none, outset: (top: 0em), overlay: (width, height, color) => {
    place(bottom, dy: dy, math.stretch(sym.arrow, size: width))
  })
}

#let sray(body, tag: none) = context {
  return if target() == "paged" { ray($script(body)$, dy: 0.3em, tag: tag) } else { math.arrow(body) }
}

#let half-length-arrow(start, end, scalar: 0, mark: (end: ">>", fill: black), ..args) = {
  let pstart = (start, scalar, 90deg, end)
  let pend = (end, scalar, -90deg, start)
  cetz.draw.line(
    (pstart, 25%, pend),
    (pstart, 75%, pend),
    ..args,
    mark: mark,
  )
}

#let sub-vectors(a, b) = (rel: a, to: ((0, 0), -100%, b))

#let add-vectors(..vectors) = {
  vectors.pos().fold((0, 0, 0), (a, b) => (rel: a, to: b))
}

#let scale-vector(vector, scale) = {
  ((0, 0), scale * 100%, vector)
}

#let directional-points(offset: (0, 0), angle: 0, length: 1e-6, n: 10) = {
  let vec = ((0, 0), 100%, angle, (length, 0))
  let out = ()

  for i in range(n + 1) {
    out.push((rel: ((0, 0), i / n * 100%, vec), to: offset))
  }
  out
}

#let quick-plot(
  _canvas: none,
  extra-plot: none,
  canvas-args: none,
  scale: 1.4,
  x-min: -1,
  x-max: 6,
  y-min: -1,
  y-max: 6,
  ..args,
) = {
  let x-range = x-max - x-min
  let y-range = y-max - y-min
  let size = (x-range * scale, y-range * scale)
  let plot = {
    cetz-plot.plot.plot(
      size: size,
      axis-style: "school-book",
      x-min: x-min,
      x-max: x-max,
      y-min: y-min,
      y-max: y-max,
      x-tick-step: none,
      y-tick-step: none,
      ..args.named(),
      {
        cetz-plot.plot.add(x => 0, domain: (0, 0))
        extra-plot
        cetz-plot.plot.annotate(_canvas)
      },
    )
  }
  canvas(..canvas-args, plot)
}
// store all figures within the wrapper into a state: "typst-stored-figures"
#let typst-stored-figures = state("typst-stored-figures", (pdf: (), web: ()))
#let figure-wrapper(..items, columns: auto) = context {
  let figures = items.pos()
  let column-count = if columns == auto { figures.len() } else { columns }
  if target() == "paged" {
    typst-stored-figures.update(stored-figures => {
      stored-figures.at("pdf") += figures
      stored-figures
    })
    place(
      top + center,
      float: true,
      grid(
        columns: column-count, gutter: 1fr,
        inset: 1em,
        align: center,
        ..figures.map(item => grid.cell([#item])),
      ),
    )
  } else {
    typst-stored-figures.update(stored-figures => {
      stored-figures.at("web") += figures
      stored-figures
    })
    // combine the figures
    let body = for fig in figures {
      fig
    }

    if target() == "html" or state("render-mode").get() == "web" {
      html.elem("div", attrs: (class: "figure-wrapper"), body)
    } else {
      body
    }
  }
}

#let dot-tiling(pattern_dist: 2pt, radius: 0.4pt) = tiling(
  size: (pattern_dist, pattern_dist),
  relative: "parent",
  place(
    circle(
      radius: radius,
      fill: black,
    ),
  ),
)

#let arc-center(center, ..args) = {
  let start = args.at("start", default: auto)
  let start-angle = if start == auto {
    let stop = args.at("stop", default: auto)
    let delta = args.at("delta", default: auto)
    if stop != auto and delta != auto { stop - delta } else { 0deg }
  } else { start }

  let radius = args.at("radius", default: 1)
  let (rx, ry) = if type(radius) == array { radius } else { (radius, radius) }
  let (cx, cy, cz) = if center.len() == 2 {
    center.push(0)
    center
  } else { center }

  let start-pos = (
    cx + rx * calc.cos(start-angle),
    cy + ry * calc.sin(start-angle),
    cz,
  )

  cetz.draw.arc(start-pos, ..args)
}

#let citation(width: 55%, author, body) = {
  if target() == "html" or target() == "bundle" {
    html.elem("blockquote", attrs: (class: "epigraph"), {
      html.elem("p", body)
      html.elem("footer", author)
    })
  } else {
    align(right, block(width: width, inset: 0em)[
      #set text(style: "italic", size: 0.95em)
      #align(left, body)
      #align(right, author)
    ])
  }
}

#let arrow-populate = (n, offset01: 0, ..mark) => {
  return range(n)
    .map(num => 100% * (num + offset01) / n)
    .map(pos => (
      symbol: ">>",
      fill: black,
      ..mark.named(),
      pos: pos,
      shorten-to: none,
    ))
}
