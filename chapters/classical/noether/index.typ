#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Classical Symmetries",
  route: "noether",
)
.

=== Classical Symmetries



==== Noether's Theorem

- This theorem is the core in the utilizing symmetries in classical and non-classical field theory. 

#theorem("Noether's Theorem")[
  If a Lagrangian has a continuous symmetry (i.e. it is parameterizable by some continuous $alpha$), there exists a conserved current $J^mu$ associated with said symmetry when the equations of motion of the Lagrangian are satisfied, i.e. the *Euler-Lagrange* equations. In other words, _symmetries imply conservation laws_.
]

#proof[
  The Proof for _Noether's Theorem_ is fairly short and clever. 

  We define $lag$ as the Lagrangian of the system, $pphi_n$ as the field(s) involved in the system, and $alpha$ as the parameter of the continuous symmetry.

  Similar to the derivation of the _Euler-Lagrange_ equations, $ 0 = (delta lag)/(delta alpha) = sum_(n) (((partial lag)/(partial pphi_n) - partial_mu (partial lag)/(partial (partial_mu pphi_n)) )(delta pphi_n)/(delta alpha)+partial_mu ((partial lag)/(partial (partial_mu pphi)))(delta pphi_n)/(delta alpha)) $

  This expression must be equivalent to zero due to $alpha$ parametrizing a symmetry (i.e. the Lagrangian is invariant wrt some variation in the parameter). It is necessary to define a $ J^mu equiv sum_n ((partial lag)/(partial (partial_mu pphi))) (delta pphi_n)/(delta alpha) $ Since we are only considering the case in which the equations of motion hold true, (i.e. the _Euler-Lagrange equations_ are true), we have that
  $ markrect(partial_mu J^mu = partial_mu sum_n ((partial lag)/(partial (partial_mu pphi))) (delta pphi_n)/(delta alpha) = sum_n partial_mu ((partial lag)/(partial (partial_mu pphi))) (delta pphi_n)/(delta alpha) = 0) $
  Therefore due to some continuous symmetry parametrized by some $alpha$, there exists a conserved current $J^mu$.
]


- The _Energy-Momentum Tensor_ $cal(T)_(mu nu)$ is the conserved current for spacetime translation.   

#definition("Energy Momentum Tensor")[
  The _Energy-Momentum Tensor_ $cal(T)_munu$ for some Lagrangian $lag[pphi_1,partial_mu pphi_1,dots pphi_n, partial_mu pphi_n]$ and some spacetime translation $x^nu->x^nu + xi^nu$ is defined as $ cal(T)_munu equiv sum_n (partial lag)/(partial(partial_mu pphi_n)) partial_nu pphi_n - g_munu lag $ Derivation below.
]

Starting with the translation $ pphi(x)->pphi(x+xi)= pphi(x) + partial_nu xi^nu pphi (x)+dots $ This provides $(delta pphi)/(delta xi^nu) = partial_nu pphi$ which applies universally regardless of the field $pphi$ (and in fact regardless of the physical object, as it applies to the Lagrangian $lag$, a consequence of the fact that $delta S=0$).

We then have that $ (delta lag)/(delta xi^nu) = partial_mu (sum_n (partial lag)/(partial (partial_mu pphi_n)) (delta pphi_n)/(delta xi^nu)) \ = partial_mu (sum_n (partial lag)/(partial (partial_mu pphi_n)) partial_nu pphi_n) \ partial_nu lag = partial_mu (sum_n (partial lag)/(partial(partial_mu pphi_n)) partial_nu pphi_n) $

We then have that $ partial_mu (sum_n (partial lag)/(partial (partial_mu pphi_n))partial_nu pphi_n - g_munu lag) =0 $
Where we then obtain $ cal(T)_munu equiv (sum_n (partial lag)/(partial (partial_mu pphi_n))partial_nu pphi_n - g_munu lag) $

and $partial_mu cal(T)_munu = 0$.

- Energy density: $ cal(E) = cal(T)_( 0 0) = sum_n partialderivative(lag,(dot(pphi)_n)) dot(pphi) - lag $
    - $dot(pphi)_n = partial_t pphi_n$
    - In the case of Lagrangians with $dot(pphi) = pi = partialderivative(lag,pphi)$, $cal(E) = cal(H)$ due to the _Legendre Transform_
#definition("4-Momentum")[In terms of the energy-momentum tensor, 4-momentum $p^mu$ is defined as $ p^nu equiv integral dif^3 x cal(T)^(0 nu) = (E,arrow(p)) $]

==== More information on currents
- A current can refer to a Noether current (such as the ones previously seen)
- They can be external, such as a moving electron in a wire
- They can be sources for fields
  - They are never fields with kinetic terms
- They can be placeholders in Lagrangians 
#example("Currents in Lagrangians")[
  In $ lag = - 1/4 F_munu F^munu - tilde(pphi) square pphi - i e A_mu (tilde(pphi) arrow.l.r(partial_mu) pphi ), $ we can write it as $ lag = - 1/4 F_munu F^munu - tilde(pphi) square pphi - A_mu J^mu $
- Clearly, you can see how currents are used to represent quantities in lagrangians that we do not care for.



]
