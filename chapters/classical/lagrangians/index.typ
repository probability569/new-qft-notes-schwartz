#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Lagrangians",
  route: "lagrangians",
)
.

=== Lagrangians 
#definition("Lagrangian")[
  The _Lagrangian_ (Density) $cal(L)$, similar to the _Hamiltonian_ $H$  (or $cal(H)$ for Hamiltonian density, defined as $H=integral dif^3 x cal(H)$) as they both can be used to describe the evolution of a system. In Field Theories, densities are used more commonly. The Density of either quantity, as stated before, is a more useful quantity in Field theories due to Lorentz Invariance and other such things. 
]


#definition("Action")[
  Action $S$ is defined as $ S = integral dif t L = integral dif^4  x cal(L) $ which should be familiar from studying classical mechanics (Lagrangian mechanics specifically). This quantity is minimized in order to obtain the evolution of a system (*Equations of Motion*).
]

#theorem("Euler Lagrange Equations")[
  In order to minimize the action of a system with Lagrangian Density $cal(L)[phi.alt,partial_mu phi.alt]$, the system must satisfy the _*Euler Lagrange Equations*_:
   $ (partial cal(L))/(partial phi.alt) - partial_mu (partial cal(L))/(partial (partial_mu phi.alt)) = 0 $
   A differential equation which ends up being extremely useful in physics for describing the time evolution of a system.
]

#proof[
  We aim to equate the variation of the action $S$ with respect to the field $phi.alt$ to zero. That is, we require $ (delta S)/(delta phi.alt) =0 $

  Note that $ S = integral dif t L = integral dif^4 x cal(L[phi.alt, partial_mu phi.alt])  $
  in order to obtain $delta S$, we must perform a transformation $pphi -> pphi + delta pphi$ in the Lagrangian. This provides $ delta S = integral d^4 x ((partial cal(L))/(partial pphi )  delta pphi + (partial lag)/(partial (partial_mu pphi)) delta (partial_mu pphi))  $
  Via the product rule and the fact that infinitesimal variations commute with partial derivatives #footnote[Look into variational calculus if you want to learn more about this], we have that 
$ delta S = integral dif^4 x ((partial lag)/(partial pphi) delta pphi+ partial_mu ((partial lag)/(partial (partial_mu pphi)) delta pphi) - partial_mu (partial lag)/(partial (partial_mu pphi)) delta pphi ) \ delta S = integral dif^4 x ((partial lag)/(partial pphi) delta pphi - partial_mu (partial lag)/(partial (partial_mu pphi)) delta pphi + partial_mu ((partial lag)/(partial (partial_mu pphi)) delta pphi)) \
delta S = integral dif^4 x( ((partial lag)/(partial pphi) - partial_mu (partial lag)/(partial (partial_mu pphi))) delta pphi + partial_mu ((partial lag)/(partial (partial_mu pphi)) delta pphi)) $
Now we need to prove that the final term (the one without the shared common factor of $delta pphi$) vanishes as our integration bounds become infinite (as we are integrating over all spacetime of course). Since this term is a total derivative of some quantity that we will define to be $ A^mu equiv (partial lag)/(partial (partial_mu pphi)) delta pphi $ (Something similar with the form of $A^mu/(delta alpha)$ is a physically important quantity but this $A^mu$ is not of any significance besides being useful for math).
With the derivative being of course $partial_mu A^mu$. The integral of this quantity is $ integral dif^4 x  partial_mu A^mu $ and by the *4 dimensional divergence theorem*, we obtain
$  integral_V dif^4 x  partial_mu A^mu = integral.cont_(partial V) dif^3 sigma_mu A^mu $ This must vanish, given that the $delta pphi$ is forced to vanish at the boundaries by the principle of least action. Therefore, we have that 
$ (delta S)/(delta pphi) = integral dif^4 x ((partial lag)/(partial pphi) - partial_mu (partial lag)/(partial (partial_mu pphi)))  =0 $
For the integral to vanish, the integrand must vanish, therefore
$ markrect((partial lag)/(partial pphi) - partial_mu (partial lag)/(partial (partial_mu pphi))= 0 ) $
]



#theorem("Extended Euler Lagrange Equations")[ 
  In order to minimize the action of a system with Lagrangian Density $cal(L)[phi.alt,partial_mu phi.alt, partial_nu partial_mu phi.alt, dots]$, the system must satisfy the _*Extended Euler Lagrange Equations*_:
  $ (partial cal(L))/(partial phi.alt) - partial_mu (partial cal(L))/(partial (partial_mu phi.alt)) + partial_nu partial_mu (partial cal(L))/(partial (partial_nu partial_mu phi.alt)) - dots.c = 0 $

(This was actually a problem in the Schwartz QFT textbook, so if you are reading that, potentially skip this part.) 
]
  


#proof[
  We begin in a similar way to the proof to the _Euler-Lagrange equations_.
  $ delta S = integral dif^4 x ((partial lag)/(partial pphi) delta pphi + (partial lag)/(partial (partial_mu pphi)) delta(partial_mu pphi) + (partial lag)/(partial (partial_nu partial_mu pphi))delta(partial_nu partial_mu pphi) + dots.c  ) $
  
  We then utilize the product rule (or the reverse of it) to obtain $ partial_nu partial_mu ((partial lag)/(partial (partial_nu partial_mu pphi)) delta pphi) = partial_nu partial_mu (partial lag)/(partial(partial_nu partial_mu pphi)) delta pphi \ + space partial_nu (partial lag)/(partial(partial_nu partial_mu pphi))  delta(partial_mu pphi) \ + partial_mu (partial lag)/(partial(partial_nu partial_mu pphi) ) delta(partial_nu pphi) \ +(partial lag)/(partial (partial_nu partial_mu pphi) ) delta( partial_nu partial_mu pphi) $

  We can rewrite  $ partial_mu (partial lag)/(partial(partial_nu partial_mu pphi) ) delta(partial_nu pphi)$ and $ partial_nu (partial lag)/(partial(partial_nu partial_mu pphi) ) delta(partial_mu pphi)$ via similar methods and we can continue to do so with more terms forming a pattern of the $n$th (with $n$ partial derivatives) term has a coefficient of $(-1)^n$ (this method similar to the _principle of inclusion-exclusion_)
  $ delta S = integral dif^4 x( ((partial lag)/(partial pphi) - partial_mu (partial lag)/(partial (partial_mu pphi)) +  partial_nu partial_mu (partial lag)/(partial (partial_nu partial_mu pphi)) - dots.c) delta pphi \ + partial_mu ((partial lag)/(partial(partial_mu pphi)) delta pphi) + partial_mu (partial_nu (partial lag)/(partial(partial_nu partial_mu pphi))  delta pphi) + partial_nu (partial_mu (partial lag)/(partial(partial_nu partial_mu)) delta pphi) \ + partial_mu partial_nu ((partial lag)/(partial(partial_mu partial_nu)) delta pphi) + dots.c) $
  Every term besides those with the shared factor of $delta pphi$ disappears due to similar reasons mentioned in the proof of the _Euler-Lagrange equations_ (i.e. they are total derivatives). and therefore, since we want $(delta S)/(delta pphi)=0$, we have that $ markrect((partial lag)/(partial pphi) - partial_mu (partial lag)/(partial (partial_mu pphi)) +  partial_nu partial_mu (partial lag)/(partial (partial_nu partial_mu pphi)) - dots.c=0) $
]

#example("Lagrangian")[
  An example of a Lagrangian that can apply to some general scalar field $pphi$
  #footnote[
    That is, it doesn't apply universally, but just in this circumstance 
  ]
  is the Lagrangian $ lag = 1/2 (partial_mu pphi)(partial_mu pphi) -V[pphi] $

  This would give us the equation of motion $ (partial lag)/(partial pphi) - partial_mu (partial lag)/(partial (partial_mu pphi)) = 0 \ -V'[pphi]- square pphi = 0 $ so $ (square + V'[pphi])pphi = 0 $ which is related to the _Klein-Gordon equation_ $(square+m^2)pphi = 0$.
]


  - One can split the terms of a Lagrangian $lag$ into _Kinetic_ terms and _Interacting_ terms. 
     - _Kinetic_ terms of a Lagrangian are ones which have at most 2 fields in it
      - $ lag_("kin") supset 1/2 pphi square pphi, macron(psi) feynman(partial) psi, 1/4 F^2_munu, 1/2 m^2 pphi^2 , dots.c  $
  - Interacting terms are terms with more than 2 fields
  $ lag_("int") supset lambda pphi^3, g macron(psi) feynman(A) psi, g partial_mu pphi A_mu pphi^star, dots.c $
  #remark[
    Interacting terms in the lagrangian all have a factor $lambda$ or $g$ associated with them. This is due to the fact that it is a coupling constant related to the interaction.
  ]
