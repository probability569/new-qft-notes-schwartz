#import "/src/components/index.typ": docs-subchapter
#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Cross Sections",
  route: "cross-sect",
  description: "References cited by the notes.",
)

- Cross sections are how physicists analyze collider data (such as the exabytes of LHC data that is collected every year)


$ ((dif sigma)/(dif Omega) )_"CM" = 1/(64 pi^2 E_("CM")^2) abs(cal(M))^2 $ and the Born approximation $ ((dif sigma)/(dif Omega))_"Born" = m^2_e/(4 pi^2) [ op(tilde(V))(arrow(k))]^2 $

- Cross sections used to make sense of particle accelerator data
- Cross sectional area: $ sigma = (hash "particles")/("time" times "number density" times "velocity of beam") \ = 1/T 1/Phi N, Phi = hash "density" times "beam vel." = 1/V times abs(arrow(v)) $
  - More useful/natural is differential cross section $ (dif sigma)/(dif Omega) $ for some angle/change in angle $Omega$.
  - Info about shape of object with this

==== QM
  - Generalize to Differential Cross Sections due to their changing based on angle in colliders
  - In QM, there is a probability of scattering $ P = N/N_("inc") $ with $N_"inc"$ number of incident particles
  - Cross section $ d sigma = 1/T 1/Phi d P $ (normalize flux)
  - Differential scattering number $ dif N = L times dif sigma $
    - $L$ is defined as the _Luminosity_ through this equation

#note("Differential solid angle")[
  The cross section $dif sigma$ is generally measured via $(dif sigma)/(dif Omega)$ as seen earlier. This $dif Omega$ is equivalent to $ dif Omega = sin theta dif theta dif pphi = - dif cos theta dif pphi $
]

=== Cross Section to Matrix Element

- $2 -> N$ Particle Interaction: $ p_1 + p_2 -> {p_j} $
- $ Phi = abs(arrow(v)_1 - arrow(v)_2)/(V) \ ==> dif sigma = V/T 1/(abs(arrow(v)_1 - arrow(v)_2)) dif P $
- Have that $ dif P = (abs(mel(f,S,i))^2)/(braket(f) braket(i)) dif Pi $
  - with  $ dif Pi = product_j N/(2 pi)^3 dif^3 p_j $
  - $ integral dif Pi = 1 $ since $ integral diff(,P) = 1/V $

- $ [a_p, a^dagger_q] = ddelta(3, p-q) $
  - Implies that $braket(p) = ddelta(3,0)$
  - Normally $delta^3(0)$ is infinite but $ ddelta(3,p) = integral_V dif^3 x e^(i arrow(p) dot arrow(x)) \ ==> delta^3(0) = V/(2 pi)^3 \ "and" delta^4(0) = (T V)/(2 pi)^4 $

- $ braket(p) = 2 omega_p V = 2 E_p V $

- Since $ ket(i) = ket(p_1) ket(p_2) $ and $ ket(f) = product_j ket(p_j) $
  - It is implied that $ braket(i) = (2 E_1 V) (2 E_2 V) $
  - It is also implied that $ braket(f) = product_j 2 E_j V $
=== Actually Calculating the S-matrix (perturbatively)
- Notice that the _first order_ of a S-matrix is just $bb(1)$ since that is the case in which nothing happens
- Write $S = bb(1) + i cal(T) $
  - $cal(T) equiv$ *transfer matrix*
  - $cal(T)$ implies momentum conservation since it vanishes unless $ket(i)$ and $ket(f)$ have the same 4-momentum
- $cal(T) = ddelta(4,Sigma p) cal(M)$

==== Matrix Elements

- $mel(f,S- bb(1),i) = i ddelta(4,Sigma P) mel(f,cal(M),i)$
  - $ abs(mel(f,S,i))^2 = delta^4(0) delta^4(Sigma p) (2 pi)^8 abs(mel(f,M,i))^2 \ = delta^4( Sigma p) T V (2 pi)^4 abs(cal(M))^2 $

=== Lorentz Invariant Phase Space

- We denote the differential $dif Pi_("LIPS")$ as being defined as the product over final momenta differentials times delta function factors, that is $ d Pi_("LIPS") equiv product_("final "j) diff(3,p_j) 1/(2 E_(p_j)) ddelta(4, Sigma p) $

//- This was seen earlier as $dif Pi$, but now we gave it a slightly more formal definition and are applying it to the probability

- Utilizing this, (as well as the derived S-matrix elements from earlier) we can write the differential probability $dif p$ via $ dif P = (abs(mel(f,S,i))^2)/(braket(f) braket(i)) dif Pi = (ddelta(4,Sigma p) times T V)/(2 E_1 V times 2 E_2 V) \ times 1/(Pi_j (2E_j V)) abs(scr(M))^2 product_j diff(3,p_j) V \ = T 1/(2 E_1 times 2 E_2) abs(scr(M))^2 dif Pi_("LIPS") $

- This easily gives us the cross section for $2 -> j$ decay: $ dif sigma = 1/((2E_1)(2E_2)abs(arrow(v)_1 - arrow(v)_2)) abs(scr(M))^2 dif Pi_("LIPS") $

=== Particle Decay Rate

- This is another useful quantity in analyzing accelerator data denoted by $dif Gamma$
- The definition for this decay rate is $dif Gamma equiv 1/T dif P$ (probability of decay in certain amount of time)
  - Specifically it is the probability that a particle of momentum $p_1$ decays into particles of momenta $p_j$ in a time $T$
  - S-matrix theory cannot be used to describe these decays (?)
- $dif Gamma = 1/(2 E_1) abs(scr(M))^2 dif Pi_("LIPS")$

=== Cross Section formula

- Consider $2->2$ Scattering 
  - This means that the momenta are $p_1 + p_2 -> p_3 + p_4 $
- In the center of mass frame, the net momentum for each is zero. Therefore $ bold(p)_1 = - bold(p)_2$, $bold(p)_3 = -bold(p)_4 $ which implies that $E_1 + E_2 = E_3 + E_4 equiv E_("CM")$
- Then, for the LIPS differential, we get that $ dif Pi_("LIPS") = ddelta(4,Sigma p) diff(3,p_3) 1/(2 E_3) diff(3,p_4) 1/(2 E_4) $ 
- This is equivalent to the integral $ dif Pi_("LIPS") = 1/(16 pi^2 ) dif Omega integral dif p_f (p^2_f)/(E_3) 1/(E_4) delta(E_3 + E_4 - E_("CM")) $ (I don't understand how this is true)
  - Where $p_f = abs(bold(p_3)) = abs(bold(p_4))$ and $E_3 = sqrt(m_3^2 + p^2_f)$, $E_4 = sqrt(m_4^2 + p_f^2)$
  - Notice that the energies are dependent on the final momentum $p_f$, and so this integral is in fact, not trivial.
- Now we conduct a change of variables from $p_f$ to $x(p_f) equiv E_3(p_f) + E_4(p_f) - E_("CM")$
  - Calculating the change of variables, we get $ (dif x)/(dif p_f) = dif/(dif p_f) (E_3 + E_4 - E_("CM")) = p_f/E_3 + p_f/E_4 = (E_3 + E_4)/(E_3 E_4) p_f $
- We also have that $ E_3 + E_4 = E_("CM") $
- Then, $ dif Pi_("LIPS") = 1/(16 pi^2) dif Omega integral_(m_3 + m_4 - E_("CM"))^oo dif x (p_f)/(E_("CM")) delta(x) \ = 1/(16 pi^2) dif Omega p_f/(E_("CM")) theta(E_("CM") - m_3 - m_4) $ where $theta(x)$ is the Heaviside step function due to the integral of the delta function.

- Putting this all together, we obtain that $ dif sigma = 1/((2 E_1)(2 E_2) abs(bold(v)_1 - bold(v)_2)) 1/(16 pi^2) dif Omega p_f/(E_("CM")) abs(scr(M))^2 theta(E_("CM") - m_3 - m_4) $
  - Using $ abs(bold(v)_1 - bold(v)_2) = abs((abs(bold(p)_1))/(E_1) + (abs(bold(p)_2))/(E_2)) = abs(bold(p)_i) (E_("CM"))/(E_1 E_2) $, we obtain that, under the condition that the masses are equivalent, $ ((dif sigma)/(dif Omega))_("CM") = 1/(64 pi^2 E^2_("CM")) abs(scr(M))^2 $ as desired, allowing for computation of cross sections for simple scattering based off of quantum field theory predictions for $abs(scr(M))^2$


=== Born Approximation

- The Born approximation is a special case where a scalar electron $pphi_e$ with mass $m_e$ scatters off of a scalar proton $pphi_p$ with mass $m_p$  
  - It is considered the nonrelativistic limit
- I will not derive the born approximation, however, it is given by the formula $ ((dif sigma)/(dif Omega))_("Born") equiv (m^2_e)/(4 pi^2) [tilde(V)(arrow(k))]^2 $ where $tilde(V)$ is the fourier transformed potential/the potential in fourier space.
  - $ tilde(V)(arrow(K)) = integral dif^3 x e^(- i arrow(k) dot arrow(x)) V(arrow(x)) $


#note("Dimension of Matrix Elements")[
- Utilizing the formula $ (dif sigma)/(dif Omega) = 1/(64 pi^2 E_("CM")^2) abs(scr(M))^2 $, we can fairly clearly see that since $[(dif sigma)/(dif Omega)] = -2 $ and that $[E_("CM")^2] = -2$, $scr(M)$ must be dimensionless which should logically make sense.
]
