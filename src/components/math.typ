#import "packages.typ": *

#let section-numbering-depth = 2

#let _scoped-number(value, depth: section-numbering-depth, loc: none) = {
  let prefix = if loc != none {
    counter(heading).display(at: loc)
  } else {
    counter(heading).display()
  }
  if prefix == none or prefix == [] {
    str(value)
  } else {
    [#prefix.#value]
  }
}

#let reset-heading-scoped-counters() = {
  counter(footnote).update(0)
  counter(math.equation).update(0)
}

#let scoped-equation-numbering(..args) = [(#_scoped-number(args.at(0)))]

#let heading-reset-marker(level) = context if level <= section-numbering-depth {
  reset-heading-scoped-counters()
}

#let vb(x) = Vb(math.upright(x))
#let vu(x) = Vu(vb(x))
#let va(x) = Va(vb(x))

#let dx = $dd(x)$
#let dy = $dd(y)$
#let dz = $dd(z)$
#let dzbar = $dd(overline(z))$
#let dzeta = $dd(zeta)$
#let dzetabar = $dd(overline(zeta))$
#let dtheta = $dd(theta)$
#let dt = $dd(t)$
#let dr = $dd(r)$

#let supp = math.op("supp")
#let diam = math.op("diam")
#let Log = math.op("Log")
#let logp = math.op($log^+$)
#let arg = math.op("arg")
#let Arg = math.op("Arg")
#let Aut = math.op("Aut")
#let Res = math.op("Res", limits: true)
#let Re = math.op($frak(Re)$)
#let Im = math.op($frak(Im)$)
#let Ind = math.op("Ind")
#let length = math.op("length")
#let jinterior = math.op("int")
#let jexterior = math.op("ext")
#let wp = $pee$

#let extcomplex = $hat(CC)$
#let uppi = $upright(pi)$
#let I-num = $upright(I)$
#let II-num = $upright(I #h(-0.15em) I)$
#let III-num = $upright(I #h(-0.15em) I #h(-0.15em) I)$
#let Order = $cal(O)$
#let order = $cal(o)$
#let diff = $partial$

#let ee = $upright(e)$
#let ii = $upright(i)$
#let taui = $2 uppi ii$

#let nothing = sym.diameter
#let emptyset = sym.diameter
#let interior(x) = $attach(limits(#x), t: circle.small)$

#let doubletilde(x) = $tilde(tilde(#x))$
#let widearc(x) = $accent(x, paren.t)$

#let math-rect(snippet, ..args) = {
  box(
    math.equation(numbering: none, block: true, $ inline(#snippet) $),
    fill: luma(100%, 80%),
    outset: 1pt,
    radius: 2pt,
    ..args,
  )
}
#let feynman(body) = math.cancel(angle: 15deg, body)
#let psibar = $macron(psi)$
custom function `feynman`: $feynman(x)$

#let munu = $mu nu$

#let pphi = $phi.alt$
#let lag = $cal(L)$

#let diff(x,y) = $(dif^#x #y)/(2 pi)^#x$

#let fquant(n,p,x) = $integral diff(#n,#p) 1/sqrt(2 omega_#p) (a_#p e^(- i #p #x) + a^dagger_(#p) e^(i #p #x) ) $


#let ddelta(x,y) = $(2 pi)^#x op(delta^#x)(#y)$
