#import "../macros.typ":*


= Renormalization (TODO)

  #quote(
  block: true,
  attribution: [Richard Feynman @feynman1985qed]
)[
    "_The shell game that we play ... is technically called 'renormalization'. But no matter how clever the word, it is still what I would call a dippy process! Having to resort to such hocus-pocus has prevented us from proving that the theory of quantum electrodynamics is mathematically self-consistent. It's surprising that the theory still hasn't been proved self-consistent one way or the other by now; I suspect that renormalization is not mathematically legitimate._" 

]

== Stereotypical Examples of (Counterterm) Renormalization

- Renormalization is the process of removing infinities by putting them in "_bare_" variables

- The three most stereotypical examples of renormalization of quantum electrodynamics (and _in general_) are the following
  + Vacuum Polarization
  + Electron Self Interaction
  + The anomalous magnetic moment

- There are two types of renorormalization:
  + Counterterm renormalization
  + Wilsonian renormalization
    - Arguably the coolest type of renormalization but it seems like it's completely different than traditional counterterm renormalization
=== Mass Renormalization

- This is equivalent to the Electron self interaction
#note("Why Renormalize?")[_In general, divergences form due to loop diagrams which give infinite integrals_]
#definition("Superficial Degree of Divergence")[
  - This quantity is a very standard quantity which counts essentially how bady something diverges. 
    - In QED, define the following quantities : $ #qft(```latex
N_e = \# \text{ elec} \\
N_\gamma = \# \text{ phot} \\
P_e = \# \text{ electron prop.} \\
P_\gamma = \# \text{ photon prop.} \\
V = \# \text{ vertices} \\
L = \# \text{ loops}
```) $
- The degree of divergence is $ D = 4 L - P_e - 2 P_gamma \ = 2 (P_e + P_gamma - V +1) - P_e - 2 P_gamma$
]
- Now we will make sense of this quantity

#definition("PV Regulation")[
 - Consider a divergent integral, such as $ integral diff(4,k) 1/k^2 $. The superficial degree of divergence _is_ the difference in powers of $k$ in the numerator and denominator. 
  - That is, $D_"ex." = 2$. 
 - PV regulation works by giving the integral a cutoff $ integral^Lambda diff(4,k) 1/k^2 prop Lambda^2 $
 - We would then enter counterterms into the lagrangian which would precisely (or not so precisely in some schemes like $overline("MS")$ as you will see) cancel them out
]
#note("Degree of Div.")[
  - Now we see that, in fact, the degree of divergence counts the power of $Lambda$. If $D = 0$, it is proportional to $ln Lambda$
]

- There is also another way to evaluate the integrals which shows us a divergence
#definition("DimReg")[
  - DimReg (dimension regulation) is a method of scanning for divergences by setting $d=4-epsilon$ and taking $lim_(epsilon->0) "of the integral"$
    - You only take this limit $#red("after")$ you subtract the divergence
]
- Lets look at the actual electron self energy to see what we can analyze

- At 1 loop, $ mel(Omega,T psibar(x) psi(x),Omega) = "feynman diagrams" = "normal electron propagator" \ + "momentum integral of some function "f $
- We define $ f equiv (i(feynman(p) +m))/(p^2 -m_0^2 + i 0) (- Sigma_2 (feynman(p))) (i(feynman(p) +m_0))/(p^2 - m_0^2 + i 0) $

- Essentially, we want to evaluate the loop integral given by $ i sigma_2 (feynman(p)) = (-i e)^2 integral diff(4,k) gamma^mu (i(feynman(k) +m_0))/(k^2 - m_0^2 + i 0) gamma^nu (-i g_munu)/((p-k)^2 + i 0) $
#trick[
- This trick that we use to evaluate these integrals is called _feynman paramaterization_
- Notice that $ 1/(A B) = integral_0^1 dif x 1/(x A + (1-x)B)^2 $
]
- Taking $A = (p-m_0)^2 - m_0^2 + i 0$ and $B = k^2 - m_0^2 + i 0$, we obtain that $ 1/(A B) = integral_0^1 dif x #mitex(```latex
\frac{1}{[x^2 - 2x k \cdot p + x p^2 - x \mu^2 - (1-x) m_0^2 + i\epsilon + x^2 p^2 - x^2 p^2]^2}
```) $

=== Vacuum Polarization
 - This is the photon splitting into an electron and a positron and then them combining again into a photon

 - The vertex evaluates to $ "feyn diag" = -(-i e)^2 integral diff(4,k) i/((p-k)^2 -m^2) i/(k^2 - m^2) \ times #qft(```latex
\text{Tr}\left[\gamma^\mu(\not{k}-\not{p}+m)\gamma^\nu(\not{k}+m)\right]
```) $
#derivation("Trace")[
  #qft(```latex
\text{tr}\left[ \gamma^\mu (\not{k} - \not{p} + m) \gamma^\nu (\not{k} + m) \right] = 4 \left[ -p^\mu k^\nu - k^\mu p^\nu + 2 k^\mu k^\nu + g^{\mu\nu} (-k^2 + p \cdot k + m^2) \right]
```)
]

- We define the loop in this diagram as $ i Pi_2^munu equiv #qft(```latex
\int \frac{d^4k}{(2\pi)^4} \frac{i}{(p-k)^2 - m^2} \frac{i}{k^2 - m^2} \times \text{Tr}[\gamma^\mu(\not{k} - \not{p} + m)\gamma^\nu(\not{k} + m)]
```) $

- With our trace, we get #qft(```latex
i \Pi_2^{\mu\nu} = -4e^2 \int d^4k \frac{2k^\mu k^\nu + g^{\mu\nu}(-k^2 + p\cdot k + m^2)}{[(p-k)^2 - m^2 + i\epsilon][k^2 - m^2 + i\epsilon]}
```)

#trick[
- We can parametrize this using a trick called feynman parameterization where we take $k^mu -> k^mu + p^mu (1-x)$ and integrate

]
#derivation("Pi tensor")[
#qft(```latex
\Pi_2^{\mu\nu} = 4i e^2 \int d^4k \int_0^1 dx \frac{2k^\mu k^\nu - g^{\mu\nu} [k^2 - x(1-x)p^2 - m^2]}{[k^2 + p^2 x(1-x) - m^2]^2} \\
= -8p^2 g^{\mu\nu} \frac{e^2}{(4\pi)^{d/2}} \Gamma(2-d/2) \mu^{4-d} \\
\times \int_0^1 dx x(1-x) \left( \frac{1}{m^2 - p^2 x(1-x)} \right)^{2-d/2}
```)
]

- This yields $ Pi_2^munu = #qft(```latex
-\frac{e^2}{2\pi^2} p^2 g^{\mu\nu} \int_0^1 dx \, x(1-x) \left[ \frac{2}{\epsilon} + \ln\left( \frac{\tilde{\mu}^2}{m^2 - p^2 x(1-x)} \right) + O(\epsilon) \right]
```) $


#include("running_coupling.typ")
