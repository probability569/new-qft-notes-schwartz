#import "counter.typ": thm-counter-get, thm-counter-step, thm-counters
#import "state.typ": thm-stored

#let _numbering = numbering
#let _counter = counter

#let _computed-number(number, numbering, counter-name, base) = {
  if number != auto {
    return number
  }
  if numbering == none {
    return none
  }
  if base == "heading" {
    let count = thm-counter-get(counter-name)
    let local = count.last()
    let prefix = _counter(heading).display()
    if prefix == none or prefix == [] {
      return _numbering("1", local)
    }
    return [#prefix.#local]
  }
  _numbering(numbering, ..thm-counter-get(counter-name))
}

/// Default formatting function for theorem environments, wrapping everything in a block.
/// Intended for use in @thm.fmt.
/// Named arguments from @thm.args can override all of the arguments below;
/// any remaining named arguments are passed to the block.
/// Blocks have ```typc width: 100%``` set by default.
/// #example(
/// ```
/// >>>#show: thm-rules
/// #thm(
///   base: none,
///   fmt: thm-fmt-block,
///   title-fmt: x => strong(smallcaps(x)),
///   separator: [\ ],
///   stroke: (left: 1pt),
///   inset: (x: 0.7em, y: 0.2em)
/// )[Special][
///   #lorem(16)
/// ]
/// ```,
/// mode: "markup",
/// scope: (thm-rules: thm-rules-2)
/// )
///
/// -> content
#let thm-fmt-block(
  /// Theorem data.
  /// See @thm.fmt for details.
  /// -> dictionary
  thm,
  /// Named arguments for the block.
  /// -> dictionary
  block-args: (:),
  /// Formatting for the environment name.
  /// -> function
  name-fmt: x => [(#x)],
  /// Formatting for the environment title (head and number).
  /// -> function
  title-fmt: strong,
  /// Formatting for the environment body.
  /// -> function
  body-fmt: emph,
  /// Separator between title and body.
  /// -> content
  separator: [*.* ],
) = {
  let name = []
  if thm.name != none {
    name = [ #name-fmt(thm.name)]
  }

  // Swallow formatting arguments passed directly to the `thm`
  block-args = thm.args.remove("block-args", default: block-args)
  name-fmt = thm.args.remove("name-fmt", default: name-fmt)
  title-fmt = thm.args.remove("title-fmt", default: title-fmt)
  body-fmt = thm.args.remove("body-fmt", default: body-fmt)
  separator = thm.args.remove("separator", default: separator)

  let title = thm.supplement
  if not thm.number == none {
    title += [ #thm.number]
  }
  title = title-fmt(title)
  let body = body-fmt(thm.body)
  return block(
    width: 100%,
    ..block-args,
    ..thm.args,
    [#box[#title]#name#separator#body],
  )
}



/// Numbered theorem environment.
/// #example(
/// ```
/// >>>#show: thm-rules
/// #thm(base: none)[Name][
///   #lorem(10)
/// ]
///
/// #thm(supplement: "Corollary", base: "Theorem")[
///   #lorem(7)
/// ]
/// ```,
/// mode: "markup",
/// scope: (thm-rules: thm-rules-1)
/// )
/// -> figure | context
#let thm(
  /// Extra arguments.
  /// See @thm.name.
  /// -> arguments
  ..args,
  /// Theorem body.
  /// -> content
  body,
  /// Theorem supplement.
  /// -> str | content
  supplement: "Theorem",
  /// Environment counter name.
  /// If ```typc auto```, defaults to @thm.supplement.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #thm(
  ///   supplement: "Proposition",
  ///   counter: "Theorem",
  ///   base: none
  /// )[
  ///   #lorem(7)
  /// ]
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> str | auto
  counter: auto,
  /// Base counter name, whose numbering prefixes the theorem environment
  /// numbering.
  /// If ```typc "heading"```, use the heading counter.
  /// If ```typc none```, the theorem environment maintains a global count with no
  /// prefix.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #thm(supplement: "Example", base: "Theorem")[
  ///   #lorem(4)
  /// ]
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> str | none
  base: "heading",
  /// Base level, determining the number of levels of the `base` numbering to
  /// use for the theorem environment numbering.
  /// If ```typc none```, all levels from the `base` numbering are used.
  /// Setting a base level higher than what the `base` provides will introduce zeros for padding.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #thm(
  ///   supplement: "Sub-Sub-Theorem",
  ///   base: "Theorem",
  ///   base-level: 2
  /// )[
  ///   #lorem(12)
  /// ]
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> int | none
  base-level: none,
  /// Theorem name.
  /// If ```typc auto```, the first positional argument from
  /// @thm.args (if present) is chosen as the theorem environment's name.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #thm(name: "Named", base: none)[
  ///   #lorem(4)
  /// ]
  /// #thm(base: none)[Also Named][
  ///   #lorem(8)
  /// ]
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> content
  name: auto,
  /// Theorem number.
  /// If ```typc auto``` (and @thm.numbering is not ```typc none```), the
  /// number is computed based on @thm.counter, @thm.base, @thm.base-level.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #thm(number: $dagger dagger$, base: none)[
  ///   #lorem(5)
  /// ] <d-dag>
  ///
  /// Recall @d-dag.
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> content | auto | none
  number: auto,
  /// Theorem numbering style.
  /// If ```typc none```, numbering is suppressed.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #thm(supplement: "Remark", numbering: none)[
  ///   #lorem(5)
  /// ]
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> str | function | none
  numbering: "1.1",
  /// Mark for being restated later. See @thm-restate.
  /// -> bool
  restate: false,
  /// Mark for being deferred to later, without appearing in the current position.
  /// See @thm-restate.
  /// -> bool
  defer: false,
  /// Keys used by @thm-restate.keys for filtering.
  /// If ```typc auto```, defaults to an array containing @thm.supplement and @thm.name (if present).
  /// -> array
  restate-keys: auto,
  /// Formatting function controlling the appearance of the theorem
  /// environment, of the form ```typc thm => content```.
  /// `thm` is a dictionary whose keys are essentially the arguments of @thm,
  /// with a couple of additions/exceptions.
  /// - The keys `name`, `counter`, `number`, `restate-keys` contain their
  ///   finally inferred/computed values.
  /// - The key `loc` contains the theorem's location.
  /// - The key `args` contains a dictionary of only the named arguments from
  ///   @thm.args.
  /// It is often useful to use @thm.args to control formatting functions.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #let thm-color = thm.with(
  ///   base: none,
  ///   fmt: thm => {
  ///     let color = thm.args.at("color", default: black)
  ///     [*#thm.supplement~#thm.number.* #text(color, thm.body)]
  ///   }
  /// )
  ///
  /// #thm-color[#lorem(15)]
  /// #thm-color(color: blue)[#lorem(7)]
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> function
  fmt: thm-fmt-block,
  /// Formatting function for references, with the same form as @thm.fmt.
  /// The `thm` dictionary carries an additional `ref-supplement` key containing
  /// the supplement used in the ```typ @cite[ref-supplement]``` call.
  /// #example(
  /// ```
  /// >>>#show: thm-rules
  /// #let thm-ref-name = thm.with(
  ///   base: none,
  ///   ref-fmt: thm => {
  ///     [#thm.name~(#thm.supplement~#link(thm.loc, thm.number))]
  ///   }
  /// )
  ///
  /// #thm-ref-name[Gauss][#lorem(17)] <gauss>
  ///
  /// By @gauss, ...
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> function
  ref-fmt: thm => {
    let supplement = thm.supplement
    if thm.ref-supplement != none { supplement = thm.ref-supplement }
    if supplement != none and supplement != [] { supplement = [#supplement~] }
    link(thm.loc, [#supplement#thm.number])
  },
) = {
  if name == auto {
    if args != none and args.pos().len() > 0 {
      name = args.pos().first()
    } else {
      name = none
    }
  }

  if counter == auto {
    counter = supplement
  }

  if restate-keys == auto {
    restate-keys = (supplement,)
    if name != none {
      restate-keys += (name,)
    }
  }

  if number == auto and numbering == none {
    number = none
  }

  let number-update = none
  if number == auto and numbering != none {
    number-update = context thm-counter-step(
      counter,
      base: base,
      base-level: base-level,
    )
  }

  let thm = (
    args: args.named(),
    supplement: supplement,
    counter: counter,
    base: base,
    base-level: base-level,
    name: name,
    body: body,
    fmt: fmt,
    numbering: numbering,
    restate: restate,
    defer: defer,
    restate-keys: restate-keys,
    ref-fmt: ref-fmt,
  )

  let thm-update = context {
    let loc = here()
    let number-computed = _computed-number(number, numbering, counter, base)
    thm-stored.update(thms => {
      let thm = thm + (number: number-computed, loc: loc)
      if thms == none {
        return (thm,)
      } else {
        return thms + (thm,)
      }
    })
  }

  if defer {
    return number-update + thm-update
  }

  return figure(
    number-update
      + thm-update
      + context {
        let loc = here()
        let number-computed = _computed-number(number, numbering, counter, base)
        let thm = thm + (number: number-computed, loc: loc)
        [
          #metadata(thm) <meta:thm-env-counter>
          #fmt(thm)
        ]
      },
    kind: "thm-env",
    outlined: false,
    caption: name,
    supplement: supplement,
    numbering: numbering,
  )
}

// Track whether the qed symbol has already been placed in a proof
#let thm-qed-done = state("thm-qed-done", ())

// Show the qed symbol, update state
#let thm-qed-show = {
  metadata("thm-qed-symbol")
  thm-qed-done.update(stack => {
    stack.slice(0, -1) + (true,)
  })
}

#let thm-qed-show-float = {
  metadata("thm-qed-symbol-float")
  thm-qed-done.update(stack => {
    stack.slice(0, -1) + (true,)
  })
}

/// If placed in a block equation/enum/list within a proof, place a qed symbol
/// to its right.
///
/// #example(```
/// >>> #show: thm-rules
/// #proof[
///   #lorem(3)
///   $ x^2 + y^2 = z^2. #qedhere $
/// ]
///
/// #proof[
///   + #lorem(4)
///   + #lorem(5) #qedhere
/// ]
///
/// #proof[
///   $
///     (a + b)^2 &= (a + b)(a + b) \
///               &= a^2 + 2 a b + b^2. #qedhere
///   $
/// ]
/// ```,
/// mode: "markup",
/// scope: (thm-rules: thm-rules-2)
/// )
///
/// -> metadata
#let qedhere = metadata("thm-qedhere")

#let tag-metadata-counter = counter("tag-metadata-counter")
/// Add content which floats to the right in an equation.
/// #example(```
/// >>> #show: thm-rules
/// $
///   (a + b)^2
///     &= a^2 + 2 a b + b^2 \
///     &<= 2a^2 + 2b^2 #tag[(AM-GM)] \
///     &<= 2 thin max{a, b}^2.
/// $
/// ```,
/// mode: "markup",
/// scope: (thm-rules: thm-rules-2)
/// )
///
/// -> content
#let tag(
  /// Content to use as tag
  /// -> any
  t,
  /// If ```typc false```, tags occupy no horizontal space in the equation layout.
  /// Set this to ```typc true``` if equation content overlaps the tag.
  /// This will have the minor disadvantage of moving the equation off-center
  /// to accommodate the tag.
  ///
  /// *Note:* Trying to determine this option automatically currently causes
  /// layout convergence issues in some cases.
  ///
  /// -> bool
  move: true,
) = {
  tag-metadata-counter.step()
  context {
    if state("render-mode").get() == "web" {
      html.elem("a", attrs: (class: "eq-tag"), t)
    } else {
      let key = "pre-extra-diff-" + str(tag-metadata-counter.get().first())
      metadata((
        eq-tag: t,
        move: move,
        pre-extra-diff: state(key),
      ))
    }
  }
}

/// Used as @thm-fmt-block.body-fmt by @proof, for properly styling proofs
/// with a `qed` symbol inserted at the end of the body.
/// Also see @qedhere.
/// #example(```
/// #show: thm-rules.with(qed-symbol: $"QED"$)
///
/// #proof-body-fmt[#lorem(3)]
///
/// #proof-body-fmt[
///   $
///     phi.alt(x) = 1/sqrt(2 pi) e^(-x^2\/2) #qedhere
///   $
/// ]
/// ```,
/// mode: "markup",
/// scope: (thm-rules: thm-rules-2)
/// )
///
/// -> content
#let proof-body-fmt(
  /// Proof body.
  /// -> content
  body,
) = {
  thm-qed-done.update(stack => {
    stack + (false,)
  })
  body
  context {
    if thm-qed-done.get().last() == false {
      if state("render-mode").get() != "web" {
        box(width: 0pt)
        h(1fr)
        sym.wj
        sym.space.nobreak
      } else {
        sym.wj
      }
      thm-qed-show-float
    }
  }
  thm-qed-done.update(stack => {
    stack.slice(0, -1)
  })
}

/// Proof environment.
/// Identical to @thm, with different defaults.
/// Uses the @thm-fmt-block formatting function (for @thm.fmt), with
/// @proof-body-fmt (for @thm-fmt-block.body-fmt).
/// #example(```
/// >>> #show: thm-rules
/// #thm(base: none)[
///   #lorem(6)
/// ]
/// #proof[
///   #lorem(3)
/// ]
/// ```,
/// mode: "markup",
/// scope: (thm-rules: thm-rules-2)
/// )
///
/// -> function
#let proof = thm.with(supplement: "Proof", numbering: none, fmt: thm-fmt-block.with(
  name-fmt: emph,
  title-fmt: emph,
  body-fmt: proof-body-fmt,
  separator: [. ],
))


/// Rules for styling theorem environments, references, proofs, etc.
/// _Must appear at the beginning of the document._
///
/// -> content
#let thm-rules(
  /// Symbol displayed at the end of proofs.
  /// See @proof, @qedhere, @proof-body-fmt.
  /// Use as
  /// #example(```
  /// #show: thm-rules.with(
  ///   qed-symbol: $square$
  /// )
  ///
  /// #proof[
  ///   #lorem(5)
  ///   $ integral_0^oo sin(x)/x thin d x = pi/2. #qedhere $
  /// ]
  ///
  /// ```,
  /// mode: "markup",
  /// scope: (thm-rules: thm-rules-2)
  /// )
  /// -> content
  qed-symbol: $qed$,
  mode: "pdf",
  doc,
) = {
  show figure.where(kind: "thm-env"): it => {
    set block(breakable: true)
    set align(left)
    it.body
  }

  show ref: it => {
    let targets = query(it.target)
    if targets.len() == 0 {
      return it
    }
    let target = if mode == "pdf" {
      targets.first()
    } else {
      targets.last()
    }

    if target.func() != figure {
      return it
    }
    if target.kind != "thm-env" {
      return it
    }

    // let ref-supplement = it.element.supplement
    // if it.citation.supplement != none {
    //   ref-supplement = it.citation.supplement
    // }

    let ref-supplement = it.citation.supplement
    // if (ref-supplement == none or ref-supplement == [] or (ref-supplement.has("text") and ref-supplement.text == "")) {
    //   ref-supplement = none
    // }

    let loc = target.location()
    let thms = query(selector(<meta:thm-env-counter>).after(loc))
    let thmloc = thms.first().location()
    let thm = thm-stored.at(thmloc).last()
    return (thm.ref-fmt)(thm + (ref-supplement: ref-supplement))
  }

  show math.equation: eq => {
    show metadata.where(value: "thm-qedhere"): tag(thm-qed-show)
    show metadata: data => {
      if (
        type(data.value) == dictionary
          and data.value.keys().contains("eq-tag")
          and data.value.keys().contains("pre-extra-diff")
      ) {
        context {
          let equation-numbering-metadata = query(
            selector(<thm-equation-numbering>).after(eq.location()),
          ).first()
          let pos-numbering = equation-numbering-metadata.location().position()
          let pre-extra-diff = data.value.pre-extra-diff.final() // hacky but we reuse data from previous passes
          let dy = 0em
          if pre-extra-diff == none {
            pre-extra-diff = 0pt
          }
          let pos-here-x = here().position().x + pre-extra-diff
          let width = measure(data.value.eq-tag).width
          if (
            equation-numbering-metadata.value.keys().contains("align")
              and equation-numbering-metadata.value.align == "left"
          ) {
            move(dx: 0.4em, dy: dy, {
              data.value.eq-tag
            })
          } else {
            let tag-start = pos-numbering.x - width
            let diff = tag-start - pos-here-x
            if (data.value.move) {
              let raw-overlap = (-diff + 0.4em).to-absolute()
              // if the marker/position metadata of numbering, minus width (so tag start) is before equation end (here), we add spaces after to add effective spaces
              // otherwise do nothing
              let extra-diff = calc.max(0pt, raw-overlap) // amount of space to add
              extra-diff = calc.round(extra-diff * 3 / 1pt) * 1pt / 3 // help out convergence a bit
              place(horizon, dx: diff + extra-diff, dy: dy, data.value.eq-tag)
              // place(horizon, dx: diff + extra-diff + 2em, repr(extra-diff))
              // place(horizon, dx: diff + extra-diff + 6em, repr(pre-extra-diff))
              box(width: 2 * extra-diff, height: 0pt, stroke: none)
              data.value.pre-extra-diff.update(extra-diff)
            } else {
              place(horizon, dx: diff, dy: dy, data.value.eq-tag)
              data.value.pre-extra-diff.update(0pt)
            }
          }
        }
      } else {
        data
      }
    }

    if eq.numbering == none and eq.block and mode == "pdf" {
      layout(size => {
        if (size.width / 1pt).is-infinite() {
          // infinite or unbounded width
          grid(
            columns: 2,
            eq, [#metadata((align: "left")) <thm-equation-numbering>],
          )
        } else {
          // finite width, use edge
          box(width: 100%, {
            eq
            place(
              right + horizon,
              [#metadata((align: "right")) <thm-equation-numbering>],
            )
          })
        }
      })
    } else {
      eq
    }
  }

  show enum.item: it => {
    show metadata.where(value: "thm-qedhere"): {
      if mode != "web" {
        h(1fr)
      }
      thm-qed-show-float
    }
    it
  }

  show list.item: it => {
    show metadata.where(value: "thm-qedhere"): {
      if mode != "web" {
        h(1fr)
      }
      thm-qed-show-float
    }
    it
  }

  show metadata.where(value: "thm-qed-symbol"): {
    qed-symbol
  }
  show metadata.where(value: "thm-qed-symbol-float"): {
    if mode != "web" {
      qed-symbol
    } else {
      html.span(qed-symbol, class: "qed-symbol")
    }
  }
  doc
}
