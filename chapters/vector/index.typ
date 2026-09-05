#import "../macros.typ":*
= Vectors

== Gauge Invariance

- Gauge invariance is a principle that photons obey (specifically, $A^mu -> A^mu + partial_mu alpha$ must keep the lagrangian invariant)
  - This section will elaborate on what specifically gauge invariance is supposed to mean and the effects that it has on QFT.
- Additionally, it is useful to start with integer spins (and hence, we are using vector bosons like photons) due to simplicity of their behavior.

=== Unitary Representation of the Poincare Group

- Before reading this, note that there is no unitary matrix representation of the Poincare group in finite dimensions.
*Poincare Group*:
- For any field, call it $psi(x)$, if $x^nu -> x^nu + a^nu$, the observables of $psi(x+a)$ should remain the same.
- Additionally, standard laws of lorentz invariance should apply, (objects transform under lorentz transformations of course).

#definition("Poincare Group")[
  - The Group of coordinate translations and Lorentz transformations
  - It is denoted by $"ISO"(1,3)$, where ISO means ISOmetric (ISOmetric minkowski space)
]

- Notice that under a rotation or a boost, only the spin projection of a particle and momenta can change

  - Poincare group determines this


- A particle is defined as a set of states that mix among themselves under Poincare transformations

==== Representations of the Poincare Group

- Generally, it is expected that particles transform under the law $ ket(psi) -> P ket(psi) $
- A representation of a group is a set of objects that mix under some the transformation (this will be formalized later)

- Suppose that we have some basis for $ket(psi)$. Call it ${ket(psi_i)}$

  - Then, we have that $ ket(psi_i) = P_(i j) ket(psi_j) $

- We also want the representation of the Poincare group to be *irreducible*. That is, no subspace exists that is invariant under the group's actions. Or, as Schwartz puts it "no subset of states transform among themselves."
- The final condition that we want to impose onto the representation is _Unitarity_

- This is the idea that $P^dagger P = 1$ since we want the inner product to be Poincare invariant. $M = braket(psi_1, psi_2)  = mel(psi_1, P^dagger P, psi_2)$

- Hence, _Particles transform under irreducible representations of the Poincare Group_

- There is a final, stronger requirement, which is that the $S$-_matrix_ must be unitary.

- The problem with unitarity is that all representations (provided unitarity is true) must be infinite dimensional.




- All irrep of the Poincare group are parametrized by a mass $m$ and a spin $j$
  - Mass is a quantum number $m >= 0, in RR$
  - Spin is a quantum number $j in 0, 1/2, 1, dots$
  - If $j>0$, for all values of $p^2 = m^2$, there are $2j=1$ states in the representations (and $2$ states if $m=0$)
- We want to force spin states into objects $pphi(x), V_mu (x), T_munu (x), dots$. 
  - The problem lies in the degrees of freedom
- As mentioned, the DOF in spin states are $1,3,5,7,dots,2j+1$ and the DOF in tensors are $4^n$ for $4$ values of $mu$ in each index. Hence putting representations into objects is difficult.
- This is what leads to gauge invariance as a requirement

==== Unitarity VS LI disagreement

- Consider the state $ket(psi) = c_1 ket(arrow.t) + c_2 ket(arrow.b)$


- The inner product/magnitude is $braket(psi) = abs(c_1)^2 + abs(c_2)^2$
  - We want this quantity to remain invariant under Lorentz transformations

- Let's try a Lorentz rotation:

  $ ket(arrow.t) -> cos theta ket(arrow.t) + sin theta ket(arrow.b) \ ket(arrow.t) -> - sin theta ket(arrow.t) + cos theta ket(arrow.b) $

- In fact, this is invariant.

- Suppose now that we use a vector basis $ ket(V_mu)$

- Let our state $ket(psi) = ket(V_0)$. Then we apply a boost $ ket(psi') = cosh beta ket(V_0) + sinh beta ket(V_1) $.

- The inner product is $braket(psi') = cosh^2 beta + sinh^2 beta != 1 = braket(psi)$. Hence, this is not Lorentz invariant.

- This brings us to the heart of the problem; The hilbert space uses a $delta^munu$ inner product whereas relativity mandates a $g^munu$ inner product.


- The problem, for a vector boson representation, is that $ #qft(```latex
v_{\mu}^2 = v_0^2 - v_1^2 - v_2^2 - v_3^2
```) \ ="direct sum of spin 0 and spin 1" $

- There are other problems, such as having infinite dimensions causing there to be no const. #qft(```latex
\mathcal{\epsilon} = (1, 0, 0, 0), \dots
```) 

=== Particles in Fields
- Let us start with forcing energy to be positive, and define #qft(```latex
E = \int d^3x \, \mathcal{E} \\
\mathcal{E} = T_{00} = \sum_n \frac{\partial \mathcal{L}}{\partial \dot{\phi}_n} \dot{\phi}_n - \mathcal{L}
```)
- Spin 0 causes the lagrangian to be #qft(```latex
\mathcal{L}(x) = \frac{1}{2} \partial_\mu \phi(x) \partial^\mu \phi(x) - \frac{1}{2} m^2 \phi(x)^2
```)
- Therefore, we have the Klein Gorden equation #qft(```latex
(\Box + m^2) \phi = 0 
```) with solutions $#mi(```latex
\phi = e^{\pm i p x}
```)$

- The energy density is then #qft(```latex
\frac{\partial L}{\partial \dot{\phi}} \dot{\phi} - L = \frac{1}{2} [(\partial_t \phi)^2 + (\vec{\nabla} \phi)^2 + m^2 \phi^2]
```)
- This is positive definite

==== Massive Spin 1

- In $m>0$, there are 3 DOF that we need
- In contrast, a vector which we intend on using has $4 = 3 plus.o 1$ degrees of freedom.
  - The lorentz group is a division of 3d sin 1 and 1d spin 0 of SO(3) (3d rotation group)
- We can guess the lagrangian to be (for a free spin 1 field) #qft(```latex
\mathcal{L} = -\frac{1}{2} \partial_\nu A_\mu \partial^\nu A^\mu + \frac{1}{2} m^2 A_\mu A^\mu
```)
- This would imply that #qft(```latex
(\Box + m^2) A_\mu = 0
```)

- Hence, we have an energy density #qft(```latex
\mathcal{E} = \frac{\partial \mathcal{L}}{\partial (\partial_t A_\mu)} \partial_t A_\mu - \mathcal{L} \\
= -\frac{1}{2} [(\partial_t A_0)^2 + (\vec{\nabla} A_0)^2 + m^2 A_0^2] + \frac{1}{2} [(\partial_t \vec{A})^2 + (\partial_i A_j)^2 + m^2 \vec{A}^2]
```)

- However, there  is a problem. Notice that there are fields within this quantity that are allowed to be negative. Hence, this is not the lagrangian. However, we had obtained 4 (or 3+1) scalars instead of a vector which implies that the lagrangian chooses everything.

- There is 1 more term that can be added to this lagrangian. This term is #qft(```latex
A_{\mu} \partial_{\mu} \partial_{\nu} A_{\nu}
```).

- The fully generalized lagrangian for a massive vector field is #qft(```latex
\mathcal{L} = \frac{a}{2} A_\mu \Box A^\mu + \frac{b}{2} A_\mu \partial^\mu \partial^\nu A_\nu + \frac{1}{2} m^2 A_\mu^2
```) for some values $a$ and $b$

- The EOM of this lagrangian are $ #qft(```latex
a \Box A_m + b \partial_\mu \partial_\nu A_\nu + m^2 A_m = 0
```) \ overbrace(==>, partial_mu) #qft(```latex
[(a+b)\Box+m^2](\partial_\mu A^\mu)=0
```) $

- If $a=-b$, this removes one DOF via reducing the EOM to $partial_mu A^mu = 0$ and choose $a = 1$ & $b=-1$ $ #qft(```latex
\mathcal{L} = \frac{1}{2} A_\mu \Box A^\mu - \frac{1}{2} A_\mu \partial^\mu \partial_\nu A^\nu + \frac{1}{2} m^2 A_\mu A^\mu
```) \ = #qft(```latex
-\frac{1}{4} F_{\mu \nu}^2 + \frac{1}{2} m^2 A^2
```) $ with #qft(```latex
F_{\mu\nu} = \partial_{\mu} A_{\nu} - \partial_{\nu} A_{\mu}
```) is the EM field tensor.


- The EOM of this lagrangian are #qft(```latex
(\Box + m^2) A_\mu = 0 \quad \& \quad \partial^\mu A_\mu = 0
```)
- The stress energy tensor for this is (for the first line rendering cal messed up unfortunately) $ #qft(```latex
\cal{T} _{\mu \nu} = \frac{\partial \cal{L} }{\partial (\partial_\mu A_\alpha)} \partial_\nu A_\alpha = g_{\mu\nu} \cal{L}
```) \ = #qft(```latex
-F_{\mu\alpha} \partial_{\nu} A_{\alpha} + g_{\mu\nu} \left( \frac{1}{4} F_{\alpha\beta}^2 - \frac{1}{2} m^2 A_{\alpha}^2 \right)
```) $

- Now, we can write this in terms of em fields. #qft(```latex
\frac{F_{\mu\nu}^2}{4} = \frac{1}{2} (E^2 - B^2)
```) with #qft(```latex
\vec{E} = \partial_t \vec{A} - \nabla A_0, \quad \vec{B} = \nabla \times \vec{A}
```)

- Therefore, writing in terms of EM fields, we obtain that $ #qft(```latex
\mathcal{E} = T_{00} = -(\partial_t A_\alpha - \partial_\alpha A_0) \partial_t A_\alpha + \frac{1}{2} B^2 - \frac{1}{2} E^2 - \frac{1}{2} m^2 A_\alpha A_\alpha
```) \ #qft(```latex
= \frac{1}{2} (\vec{B}^2 + \vec{E}^2) + \partial_j A_0 (\partial_j A_i - \partial_i A_j) - \frac{1}{2} m^2 A_0^2 + \frac{1}{2} m^2 \vec{A}^2
```) $
- It looks as if there can be negative. However, some terms cancel out. We can rewrite it as #qft(```latex
\mathcal{E} = \frac{1}{2}(\vec{E}^2 + \vec{B}^2) + \frac{1}{2}m^2(A_0^2 + A_i^2) + \\ \underbrace{A_0 \partial_t (\partial_\mu A_\mu) - A_0 (\Box + m^2) A_0}_{\text{cancels due to EOM}} + \underbrace{\partial_i (A_0 F_{0i})}_{\text{Total Derivative so doesn't contribute to }E}
```)
- Now our energy is positive and we have reduced the DOF to $3$ due to a Lorentz invariant condition
==== Free Massive Spin 1 Field Solution
- The solution to the EOM is VERY similar to the solution for other fields. However, there is another factor that we must include which is the polarizations $epsilon^i_mu$.
- The most general solution to the EOM is by utilizing a fourier transform to obtain that #qft(```latex
(\Box + m^2) A_\mu = 0 \\ \implies 
A_\mu(x) = \sum_i \int \frac{d^3 p}{(2\pi)^3} \tilde{a}_i(\vec{p}) \epsilon_\mu^i(p) e^{ipx}
```) with $#mi(```latex
p_0 = \omega_p = \sqrt{\vec{p}^2 + m^2}
```)$ as always.
- We want to choose the basis in a smart way. 
- Notice that, since there is no Unitary finite dimension representation of the Lorentz group, $epsilon^i_mu (p)$ _must_ depend on $p$ (and hence they are "infinite dimensions")
- Suppose that $p^mu = (E,0,0,p_z)$ with $E^2 - p_z^2 =m^2$


- In order to have $epsilon_mu^i (p)$ s.t. $partial_mu A_mu = 0$, it is a requirement that #mi(```latex
p^\mu \mathcal{\varepsilon}_\mu(p) = 0
```)
- The trivial $epsilon_mu^i$ are #qft(```latex
\epsilon_{\mu}^{1} = (0, 1, 0, 0), \quad \epsilon_{\mu}^{2} = (0, 0, 1, 0)
```)
- These are known as transverse polarizations.
- The final polarization is #qft(```latex
\epsilon_L^\mu = \left( \frac{p_z}{m}, 0, 0, \frac{E}{m} \right)
```)

- Notice that we only need 3 of these _polarization vectors_ in order to have a basis for our field.

- We are now able to generate an irr. unitary representation of the Poincare group
  - Notice that this is infinite dimensional due to momentum dependence
- Now, we have a vector space that is created by integrating these basis vectors by #mi(```latex
\tilde{a}_i(\vec{p})
```)
  - This vector space is the space of fields satisfying the EOM of $A_mu$ of course

=== Massless Spin 1
- It is not impossible for Massive Spin 1 to exist, but it is not the most common of particle
  - However, photons are an _extremely_ common particle which is where it is convenient to start
- In the $m->0$ limit of massive spin 1, #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2
```)
- Note: we no longer have #qft(```latex
\partial_\mu A_\mu = 0
```) since that was determined by #qft(```latex
m^2(\partial_\mu A^\mu) = 0
```)
- Additionally, Longitudinal polarization blows up
$ #qft(```latex
\epsilon_\mu^L = (p_z/m, 0, 0, E/m)
```) $
- Momentum also goes to #qft(```latex
p \to (E, 0, 0, E)
```)
- _In Quantum Field Theory, when one problem is solved, two more appear in its place. Much like a hydra._

- Thus, we must start from the beginning
- Let us start with #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2
```)
#definition("Gauge Invariance")[
  - Gauge invariance is the idea that an addition of some total derivative of a function keeps the lagrangian invariant. Explicitly, $lag$ is invariant under #qft(```latex
A_{\mu}(x) \to A_{\mu}(x) + \partial_{\mu} \alpha(x)
```)
]
- Massless Vector Field theory has this gauge invariance of the Lagrangian.

- Equations of motion for Photon theory are #qft(```latex
\Box A_\mu - \partial_\mu (\partial_\nu A_\nu) = 0
```)
- Our goal again is to separate the temporal and spatial components. $ #qft(```latex
-\partial_j^2 A_i + \partial_t \partial_j A_0 = 0
```) \ #qft(```latex
\Box A_i - \partial_i (\partial_t A_0 - \partial_j A_j) = 0
```) $

- Next, we utilize the technique of Gauge fixing. 
- We apply a transformation such that #qft(```latex
\partial_j A_j \to \partial_j A_j + \partial_j^2 \alpha
```)
- In the *Coulomb Gauge*, we can choose this $alpha$ such that $#mi(```latex
\partial_j A_j = 0
```)$
- This therefore implies that #qft(```latex
\partial_j A^j = 0
```)

- Under #mi(```latex
\partial_i A_i \to \partial_i A_i + \partial_i^2 \alpha
```), the coulomb gauge is preserved under #mi(```latex
A_{\mu} \rightarrow A_{\mu} + \partial_{\mu} \alpha
```) such that #mi(```latex
\partial_i^2 \alpha = 0
```)
- Transforming #mi(```latex
A_0 \to A_0 + \partial_t \alpha
```) forces $A_0$ to satisfy $partial_i^2 A_0 = 0$
- This allows us to set $A_0 = 0$ via the Coulomb gauge (and get rid of a DOF)

- The EOM for the coulomb gauge is #qft(```latex
\Box A_i = 0
```)
- This gives a free field solution #qft(```latex
A_\mu(x) = \int \frac{d^4 p}{(2\pi)^4} \varepsilon_\mu(p) e^{i p x}
```)
  - This provides some equations: $ p^2 = 0, quad p_i epsilon_i  = 0 "due to gauge", quad epsilon_0 = 0 "due to gauge" $
  - Now we can write $p_mu = (E,0,0,E)$, giving #qft(```latex
\varepsilon^1_\mu = (0, 1, 0, 0), \varepsilon^2_\mu = (0, 0, 1, 0)
```)
  - This has only degrees of freedom
  - This is known as Linear polarization

- We can also use #qft(```latex
\varepsilon_{\mu}^{R} = \frac{1}{\sqrt{2}}(0, 1, i, 0), \quad \varepsilon_{\mu}^{L} = \frac{1}{\sqrt{2}}(0, 1, -i, 0)
```)
- These are known as circular polarizations
  - They are helicity eigenstates

- Additionally, there is the lorenz gauge $ partial_mu A_mu = 0 $
  - In this gauge, #qft(```latex
\varepsilon_{\mu}^{1} = (0, 1, 0, 0), \varepsilon_{\mu}^{2} = (0, 0, 1, 0), \varepsilon_{\mu}^{f} = (1, 0, 0, 1)
```)

- $epsilon_mu ^f$ is known as forward polarization

#note("Forward Polarization")[
  - Forward polarization is proportional to momentum
    - Hence, it corresponds to $A_mu = partial_mu pphi$
    - Therefore, $A_mu = 0$ due to gauge invariance
    - Therefore, forward polarization is not physical
]

=== Covariant Derivatives

- Interactions in the Lagrangian must retain Gauge invariance (since they involve $A_mu$)
  - For instance, we cannot add an interaction term such as $A_mu pphi partial_mu pphi$ due to lack of gauge invariance #qft(```latex
A_\mu \phi \partial_\mu \phi \to A_\mu \phi \partial_\mu \phi + (\partial_\mu \alpha) \phi \partial_\mu \phi
```)
- Since scalar fields only have 1 DOF, it is not possible to couple any $A_mu$ with $pphi$
  - Hence, we need at least $2$ fields
- We can write $pphi = pphi_1 + i pphi_2$ and have it transform as #qft(```latex
\phi \to e^{-i\alpha} \phi
```)
- Therefore $m^2 abs(pphi)^2$ is gauge invariant
==== Derivatives
- Notice that $abs(partial_mu pphi)^2$ is not guage invariant
- Hence, we note that in the transformation #qft(```latex
A_\mu \to A_\mu + \frac{1}{e} \partial_\mu \alpha
```) (electric charge is convention) #qft(```latex
(\partial_m + ieA_m)\phi \to (\partial_m + ieA_m + i\partial_m\alpha) e^{-i\alpha(x)}\phi
```). By the product rule, #qft(```latex
e^{-i \alpha(x)}(\partial_\mu + ieA_\mu)\phi
```)

- Thus, we can define the _Covariant Derivative_: #qft(```latex
D_{\mu} \phi \equiv (\partial_{\mu} + i e A_{\mu}) \phi \rightarrow e^{-i \alpha(x)} D_{\mu} \phi
```)
- The Covariant derivative provides us the _Scalar QED_ lagrangian #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu} F^{\mu\nu} + (D_\mu \phi)^\dagger (D^\mu \phi) - m^2 \phi^\dagger \phi
```)
- In general, for fields $pphi_n$, they transform under #qft(```latex
\phi_n \to e^{Q_n i \alpha(x)} \phi_n
```)
  - The covariant derivative would be #qft(```latex
D_\mu \phi_n = (\partial_\mu - i e Q_n A_\mu) \phi_n
```)
  - $Q$ represents the sign of the charge (for an electron, $Q = -1$, for quarks, $Q = 2/3, -1/3$, etc.)
  - This is an important relation that will be seen in more detail later.

==== Conserved Current of Scalar QED
- The scalar QED lagrangian can be written as #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2 + \partial_\mu \phi^* \partial^\mu \phi + ie A_\mu (\phi \overleftrightarrow{\partial^\mu} \phi^*) + e^2 A_\mu^2 \phi^* \phi - m^2 \phi^* \phi
```)

- The equations of motion for this lagrangian can be written as #qft(```latex
(\Box + m^2) \phi = -2ie A^\mu \partial_\mu \phi + e^2 A_\mu^2 \phi \\
(\Box + m^2) \phi^* = 2ie A^\mu \partial_\mu \phi^* + e^2 A_\mu^2 \phi^*
```)
  - This allows us to obtain the Noether currents for this (associated with complex phase rotation): #qft(```latex
\frac{\delta \phi}{\delta \alpha} = -i \phi, \quad \frac{\delta \phi^*}{\delta \alpha} = i \phi^*
```)
- The current is #qft(```latex
J_{\mu} = \sum_{n} \frac{\partial \mathcal{L}}{\partial (\partial_{\mu} \phi_n)} \frac{\delta \phi_n}{\delta \alpha} = -i \underbrace{(\phi \overleftrightarrow{\partial_{\mu}} \phi^*)}_{\text{Free Theory current}} - 2e A_{\mu} \phi^* \phi
```)

#note("Term in lagrangan")[
  - The term in $lag$ that is linear in $A_mu$ is $-e A_mu J_mu$
]
- There is a reason behind this.
- Define $lag_0$ as the limit of Gauge invariant lagrangians as $A_mu -> 0$ or $e ->0$
- Then, $lag_0$ will still be invariant under the global symmetry such that $A_mu$ is the gauge field
  - If $alpha$ is constant, then $A$ will not transform
- If $alpha = alpha(x)$, $lag_0$ transforms based on $partial_mu alpha$
- Suppose this is an infinitesimal transformation. Then, #qft(```latex
\delta \mathcal{L}_0 = (\partial_\mu \alpha) J^\mu + \mathcal{O}(\alpha^2)
```)

- In scalar QED with $A_mu = 0$, #qft(```latex
\mathcal{L}_0 = (\partial_\mu \phi)^* (\partial^\mu \phi) - m^2 |\phi|^2
```)
- This implies that an infinitesimal transformation is #qft(```latex
\delta \mathcal{L}_0 = (\partial_\mu \alpha) J^\mu + (\partial_\mu \alpha)^2 \phi
```)
- Integrating by parts and taking the terms linear in $alpha$, we obtain #qft(```latex
\delta \mathcal{L}_0 = \alpha \partial_\mu J_\mu
```)
- Then, under the EOM (since any variation must vanish), $partial_mu J_mu = 0$

- There is another way without using the EOM.
- Suppose that we define $lag = lag_0 - A_mu J_mu$ s.t. #qft(```latex
\delta \mathcal{L} = \mathcal{L}_0 - \delta A_\mu J^\mu = (\partial_\mu \alpha) J^\mu - (\partial_\mu \alpha) J^\mu = 0
```)
- This implies that the $A_mu J_mu$ term is universal

=== Quantization (and Ward Identity)

- Quantization of fields with more than 1 degrees of freedom works similarly to quantization of fields with 1 degree of freedom. For instance, quantizing complex scalar fields.

#example("Quantizing complex Scalar fields")[
  - Suppose we have a scalar field $pphi = pphi_1 + i pphi_2$. We can write
  #qft(```latex
\phi_1(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} (a_{p,1} e^{-ipx} + a^\dagger_{p,1} e^{ipx})
\\ \phi_2(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} (a_{p,2} e^{-ipx} + a^\dagger_{p,2} e^{ipx})

```)

- Writing #qft(```latex
\vec{\phi}(x) = \phi_1 + i \phi_2 = \begin{pmatrix} \phi_1 \\ \phi_2 \end{pmatrix}
```) 
- We obtain #qft(```latex
\vec{\phi}(x)= \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} \left[ \begin{pmatrix} a_{p,1} \\ a_{p,2} \end{pmatrix} e^{-ipx} + \begin{pmatrix} a^\dagger_{p,1} \\ a^\dagger_{p,2} \end{pmatrix} e^{ipx} \right] \\
= \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} \sum_{j \in \{1,2,3\}} \left( \vec{e}_j a_{p,j} + \vec{e}_j^* a^\dagger_{p,j} e^{ipx} \right)
```) 

with #mi(```latex
\vec{e}_1 = \begin{pmatrix} 1 \\ 0 \end{pmatrix}, \vec{e}_2 = \begin{pmatrix} 0 \\ 1 \end{pmatrix}
```)

]
- For quantization of vector fields, we must allow for 4 components for basis polarizations instead of 2 components
  - $arrow(epsilon)_i -> epsilon_j^mu (p)$

- As seen before in _Massive Spin 1_, #qft(```latex
A_{\mu}(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} \sum_{j \in \{1,2,3\}} \left( \epsilon_{\mu}^j(p) a_{p,j} e^{-ipx} + \epsilon_{\mu}^{j*}(p) a_{p,j}^{\dagger} e^{ipx} \right)
```) is how we quantized such fields

- $ #qft(```latex
\sum_{\mu} \varepsilon_{\mu}^{0}(p)
```) $ is known as the canonical set of bases

==== Creation and Annihilation operators for photons
- For creation operators, $ a^dagger_(p,j) ket(0) = 1/(sqrt(2 omega_p)) ket(p quad epsilon^j) $
- This implies that #qft(```latex
\mel{0}{A_\mu(x)}{p, \epsilon^j} = \epsilon_\mu^j e^{-ipx}
```)
- The vector field creates a particle at $x$ with the polarization able to be projected through contraction
- Notice that the basis depends on $p^mu$
  - If $epsilon_mu$ where not dependent on $p$ (i.e. const.), a Lorentz transform $epsilon^i_mu -> Lambda_munu epsilon_nu^i$ would mix timelike

==== Polarizations
- Now what happens if $p^mu = (E,0,0,p_z)$
  - This would imply that #qft(```latex
\varepsilon^1_\mu (p) = (0, 1, 0, 0)
\varepsilon^2_\mu (p) = (0, 0, 1, 0)
\varepsilon^L_\mu (p) = (p_z/m, 0, 0, E/m)
```)

- Notice that it satisfies the conditions #qft(```latex
\epsilon^i_m \epsilon^{i*}_m = 1
\epsilon^i_m p_m = 0
```)

- However, one must wonder. Where did the fourth degree of freedom go? Clearly, our vector field is functional with only these three as bases but it still begs the question.
- There is still one more polarization that is perpindicular to all of these. This polarization is expressed as #qft(```latex
\epsilon^\mu(p) = \frac{1}{m} p^\mu = \left( \frac{E}{m}, 0, 0, \frac{p}{m} \right)
```)
- In position space, it can be expressed as #qft(```latex
\varepsilon_{\mu}^{S} = \frac{1}{m} \partial_{\mu} \alpha(x)
```)

- This means that it is invariant under lorentz transforms
  - Hence, $epsilon_mu ^i$ do not mix with it
- $"SO"(3)$ rotations only mix $epsilon^i_mu$, however there exist other lorentz transformations that can mix the others


- Suppose that we fix $p^mu = q^mu$
- Our polarization bectores are then #mi(```latex
\varepsilon_\nu = c_j e^j_\mu(q)
```)
- Now suppose that we have a state $ket(epsilon) = c_j ket(j)$ such that $braket(j) = 1$
- This implies that $braket(epsilon) = abs(c_1)^2 + abs(c_2)^2 + abs(c_3)^2 = "positive definite, L.I."$

- The matrix element for our theory is $cal(M) = epsilon_mu M_mu$ where $epsilon_mu$ is a linear combination of $epsilon^j_mu$


=== Massless Spin 1
- We now have enough to establish our quantization for massless spin 1 (a photon)
- Massless spin 1 is the same as massive spin 1 except for the fact that we only need 2 polarizations instead of 1

#qft(```latex
A_{\mu}(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} \sum_{i \in \{1,2\}} \left( \varepsilon_{\mu}^i(p) a_{p,i} e^{-ipx} + \varepsilon_{\mu}^{i*}(p) a_{p,i}^{\dagger} e^{ipx} \right)
```)
- A sample basis is again if $p$ points in $hat(z)$

- Then, we have that #qft(```latex
p^\mu = (E, 0, 0, E) \\
\varepsilon_m^1(p) = (0, 1, 0, 0) \\
\varepsilon_m^2(p) = (0, 0, 1, 0)
```)

- This satisfies the conditions #mi(```latex
(\varepsilon_{\mu}^{i})^{2} = -1; \varepsilon_{\mu}^{i} p^{\mu} = 0
```) 

- There are, of course, orthogonal polarizations like we have seen before. #qft(```latex
\epsilon_{\mu}^{f}(p) = (1, 0, 0, 1), \epsilon_{\mu}^{b} = (1, 0, 0, -1)
```)
- These are known as forward and backwards polarizations

- Notice now that we cannot create $epsilon_mu$ due to mixing with longitudinal polarization under $"SO"(3)$
- In this case, longitudinal polarization becomes forward polarization
- Hence, $"SO"(3) -> "ISO"(2)$ or #qft(```latex
\lim_{m \to 0} \varepsilon_\mu^i(p) = \varepsilon_\mu^f(p) \propto p_\mu
```)

- Under $"ISO"(2)$, these polarization bases transform as #qft(```latex
\varepsilon_{\mu}^{1}(p) \to C_{11}(\Lambda) \varepsilon_{\mu}^{1}(p) + C_{12}(\Lambda) \varepsilon_{\mu}^{2}(p) + C_{13}(\Lambda) p_{\mu} \\
\varepsilon_{\mu}^{2}(p) \to C_{21}(\Lambda) \varepsilon_{\mu}^{1}(p) + C_{22}(\Lambda) \varepsilon_{\mu}^{2}(p) + C_{23}(\Lambda) p_{\mu}
```)

=== Photon Propagator

- We denote the photon propagator by $Pi^munu$ which is definte by #qft(```latex
\mel{0}{T \{ A^\mu(x) A^\nu(y) \}}{0} = i \int \frac{d^4 p}{(2\pi)^4} e^{ip(x-y)} \Pi^{\mu\nu}(p)
```) evaluated in the free theory

==== Photon Propagator as a Green's Function

- Suppose we have the lagrangian #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2 - A_\mu J^\mu
```)
- Then, the equations of motion are #qft(```latex
\partial_\mu F_{\mu\nu} = J_\nu
```)
  - This implies that #qft(```latex
\partial_\mu \partial_\mu A_\nu - \partial_\mu \partial_\nu A_\mu = J_\nu
```) and hence, via a fourier transform, #qft(```latex
\left( -p^2 \delta_{\mu\nu} + p_\mu p_\nu \right) A^\mu = J_\nu
```)
- We want $A_mu$ = $Pi_munu J_nu$. Therefore, as a green's function equation, #qft(```latex
\left( -p^2 \delta_{\mu\nu} + p_\mu p_\nu \right) \Pi_{\mu \alpha} = g_{\mu \alpha}
```)

- However, there is a drawback. Notice that #qft(```latex
\det(-p^2 g_{\mu\nu} + p_\mu p_\nu) = 0
```)
- Therefore, we must choose a gauge or add an auxiliarly Field 
  - Choosing a gauge is inconvenient and has 4 DOF instead of 2 
  - Adding an auxiliary field is similar to utilizing Lagrange multipliers
- We let our lagrangian be #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2 - \frac{1}{2\xi} (\partial_\mu A^\mu)^2 - J_\mu A^\mu
```)
  - Small $xi$ enforces $partial_mu A_mu = 0$
- Thus we have that #qft(```latex
\left[ -p^2 g_{\mu\nu} + \left( 1 - \frac{1}{\xi} \right) p_\mu p_\nu \right] \Pi_{\mu\nu} = g_{\mu\nu}
```)

- Therefore, in terms of our new parameter $xi$, #qft(```latex
\Pi_{\mu \nu} = \frac{g_{\mu \nu} - (1 - \xi) \frac{p_\mu p_\nu}{p^2}}{p^2}
```)
- It is simple to check this. $ #qft(```latex
\left[ -q^2 g_{\mu\alpha} + \left( 1 - \frac{1}{\xi} \right) p_\mu p_\alpha \right] \Pi_{\alpha\nu} =
```) \ #qft(```latex
\left[ p^2 g_{\mu\nu} - \left( 1 - \frac{1}{\xi} \right) p_\mu p_\nu \right] \left[ p^2 g_{\alpha\nu} - (1 - \xi) p_\alpha p_\nu \right] \frac{1}{p^4}
```) \  #qft(```latex
= g_{\mu \nu} + \left[ -\left( 1 - \frac{1}{\xi} \right) - (1 - \xi) + \left( 1 - \frac{1}{\xi} \right)(1 - \xi) \right] \times \frac{p_{\mu} p_{\nu}}{p^2} = g_{\mu \nu}
```) $

- Hence, we have our result for the photon propagator: 
#qft(```latex
i \Pi_{\mu \nu} = \frac{-i}{p^2 + i\epsilon} \left[ g_{\mu \nu} - (1 - \xi) \frac{p_\mu p_\nu}{p^2} \right]
```)
==== Covariant Gauges
- Finally, there are some gauges that are useful to enforce via $xi$ which make calculations simpler. Notice that the final result for any physical observable must be independent of $xi$ due to gauge invariance which implies that $xi$ is to be chosen to make our lives easier.

- There is the feynman guage where $xi = 1$: #qft(```latex
i\Pi^{\mu\nu}(p) = \frac{-ig^{\mu\nu}}{p^2 + i\varepsilon}
```)
- There is the Lorenz gauge where $xi = 0$: #qft(```latex
i\Pi^{\mu\nu}(p) = -i \frac{g^{\mu\nu} - \frac{p^\mu p^\nu}{p^2}}{p^2 + i\varepsilon}
```)
  - Notice that as $xi->0$, $partial_mu A_mu -> 0$
== Scalar QED in More Detail
- Scalar Quantum Electrodynamics describes a photon $A_mu$ and another particle (presumably the electron) $pphi$


- Lagrangian is $ lag =  -1/4 F_munu^2 + abs(D_mu pphi)^2 - m^2 pphi^* pphi $
  - $D_mu pphi = partial_mu pphi + i e A_mu$
  - $(D_mu pphi)^* = partial_mu pphi^* - i  A_ u$

=== Quantizing Scalar Fields
- The equations of motion for Scalar Quantum Electrodynamics are simililar to the klein gordon equation
  - #qft(```latex
(\Box + m^2) \phi = -i (-e A_\mu) \partial^\mu \phi + i \partial_\mu (-e A^\mu \phi) + (-e A_\mu)^2 \phi
```)
  - #qft(```latex
(\Box + m^2) \phi^* = i(e A_\mu) \phi^* + i \partial_\mu (e A_\mu \phi^*) + (e A_\mu)^2 \phi^*
```)
- A the solution to a free scalar field (a real one) is given by: 
#qft(```latex
\phi_0(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} (a_p e^{-ipx} + a_p^\dagger e^{ipx})
```)
- Generally, scalar fields are complex. Hence, it is convention to treat $pphi$ and $pphi^*$ separately


- #qft(```latex
\phi(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} (a_p e^{ipx} + b_p^\dagger e^{-ipx})
```)

- #qft(```latex
\phi^*(x) = \int \frac{d^3p}{(2\pi)^3} \frac{1}{\sqrt{2\omega_p}} (a_p^\dagger e^{ipx} + b_p e^{-ipx})
```)
=== Charge

- In scalar QED, as seen before, charge is associated with the $"U"(1)$ gauge symmetry #mi(```latex
\phi \to e^{-i\alpha} \phi
```) which becomes important later




=== Scalar QED Feynman Rules

- The lagrangian for Scalar QED is #qft(```latex
\mathcal{L} = -\frac{1}{4} F_{\mu\nu}^2 - \phi^* (\Box + m^2) \phi - i e A_\mu (\phi^* \overleftrightarrow{\partial_\mu} \phi) + e^2 A_\mu^2 |\phi|^2
```)
- The complex scalar propagator is $ #feyndrawgram(json("scalar_feyn.json")) = #qft(```latex
\frac{1}{p^2 - m^2 + i\epsilon}
```) $

- The photon propagator is $ #feyndrawgram(json("photon_feyn.json")) = #qft(```latex
\frac{-i}{p^2+i\epsilon}\left[g_{\mu\nu}-(1-\xi)\frac{p_\mu p_\nu}{p^2}\right]
```) $
- There are additionally four different vertex interactions which are as follows:

- The first interaction is $ #feyndrawgram(json("scalar_inter_1.json")) = #qft(```latex
ie(-p^1_{\mu} - p^{2}_{\mu})
```) $ 

- The second interaction is $ #feyndrawgram(json("scalar_inter_2.json")) = #qft(```latex
ie(p^1_{\mu} + p^2_{\mu})
```) $
- The third interaction is $ #feyndrawgram(json("scalar_inter_3.json")) quad = #qft(```latex
ie\left(-p_\mu^1+p_\mu^2\right)
```) $

- Finally, the fourth interaction is $ #feyndrawgram(json("scalar_inter_4.json")) quad = #qft(```latex
ie(-p^1_\mu + p^2_\mu)
```) $

- These are the _only_ interactions (at tree level) permitted by QED (scalar QED but similar is true for spinor QED) due to the fact that the interaction term in the lagrangian is #qft(```latex
ie A_{\mu} [\phi^* \overleftrightarrow{\partial_{\mu}} \phi]
```)


- There are also loops which are possible in any quantum theory. 
  - There are an infinite number of such loops, so it is impossible to enumerate them.
  - However, here are a few examples:

  $ #feyndrawgram(json("scalar_loop_1.json")) \ = epsilon_mu (p) integral diff(4,k)  (i e k) (i)/(k^2 -m^2) i/((p+k)^2 -m^2) (-i e k) epsilon_nu^* (p)  $
- This yields a divergence which is the reason that renormalization exists (as you will see later)

- There are also other loops, such as $ #feyndrawgram(json("scalar_loop_2.json")) $ (which I have not evaluated here). 

- There is an additional vertex which is given by the term $ lag_"int" = e^2 A_mu^2 abs(pphi)^2 $
  - This is not unphysical but it does not happen in reality since, although it appears in our toy theory, it does not appear in real QED and hence it doesn't actually represent a real interaction
    - It is required in scalar QED due to gauge invariance
  - This vertex is known as the _seagull vertex_
- The seagull vertex Feynman Diagram is $ #feyndrawgram(json("seagull.json")) = 2 i e^2 g_munu $ 

==== External States

- External States are extremely important for understanding how we go from a diagram (with photons, it will have tensor indices $mu,nu$) to a squared matrix element which is what we need to calculate the S matrix.

- The idea is that photons that exit and enter the graph (and hence are external) get factors of polarization, which you will see


- Recall the photon quantization: #qft(```latex
A_{\mu}(x) = \int \frac{d^3k}{(2\pi)^3} \frac{1}{\sqrt{2\omega_k}} \sum_{i=1}^2 \left( \varepsilon_{\mu}^i(k) a_{k,i} e^{-ikx} + \varepsilon_{\mu}^{i*}(k) a_{k,i}^{\dagger} e^{ikx} \right)
```)

- External states have momenta and polarization 

- Note that #qft(```latex
\mel{0}{A_\mu(x)}{k, \epsilon} = \epsilon_\mu(k) e^{-ikx}
```)
- Hence, the LSZ reduction is modified by adding $epsilon_mu$ for incoming photons and $epsilon_mu^*$ for outgoing photons

=== Scattering In Scalar QED

- Now, we move onto real particle interactions that occur in scalar QED

- It is convenient to utilize three variables known as the mandelstam variables: $s,t,u$ which will be defined soon.
- Consider the $t$ channel defined as $ i cal(M)_t = #feyndrawgram(json("t_channel.json")) \ #qft(```latex
= (-ie)(p_1^\mu + p_3^\mu) \frac{-i\left(g_{m\nu} - (1-\xi)\frac{k_\mu k_\nu}{k^2}\right)}{k^2} (-ie)(p_2^\nu + p_4^\nu)

```) $ with #mi(```latex
k^\mu = p_3^\mu - p_1^\mu
```)

- Notice that #qft(```latex
k^\mu(p_1^\mu + p_3^\mu) = p_3^2 - p_1^2 = m^2 - m^2 = 0
```)
- Hence, #qft(```latex
\mathcal{M}_t = \frac{(p_1^\mu + p_3^\mu)(p_2^\mu + p_4^\mu)}{t}
```)

- Now consider the $u$ channel: $  i cal(M)_u = #feyndrawgram(json("u_channel.json")) \ = #qft(```latex
(-ie)(p_1^\mu + p_4^\mu) \frac{-i[g_{\mu \nu} - (1-\xi)\frac{k_\mu k_2}{k^2}]}{k^2}(-ie)(p_2^\nu + p_3^\nu)
```) $
  - With #mi(```latex
k^\mu \equiv p_4^\mu - p_1^\mu
```)
- Now we have similar equations to before
- #qft(```latex
\mathcal{M}_u = e^2 \frac{(p_1^\mu + p_4^\mu)(p_2^\mu + p_3^\mu)}{u}
```)

- The final diagram is the s-channel $ i cal(M)_s = #feyndrawgram(json("s_channel.json")) \ = (- i e)(-p_1^mu + p_2^mu) #qft(```latex
\frac{-i\left(g_{\mu\nu}-(1-\xi)\frac{k_{\mu}k_{\nu}}{k^2}\right)}{k^2}
```) (-i e) (-p_3^nu +p_4^nu) $ with $k^mu = p_1^mu + p_2^mu$
- Notice that $k^mu (p_1^mu - p_2^mu) = 0$
- Hence, this diagram evaluates to $ i cal(M)_s = ((p_1^mu -p_2^mu) (p_3^mu - p_4 ^mu))/s $
- Our Mandelstam variables that we introduces $u,s,t$ evaluate to $ u = (p_4 - p_1)^2, quad s = (p_1 - p_2)^2, quad t = (p_1 +p_2)^2 $
  - $s$ is commonly used to represent the square of the COM energy from a particle accelerator

==== Moller Scattering

- The cross secition for $e^- e^- -> e^- e^-$ moller scattering can be evaluated with $u$ and $t$ channels, providing #qft(```latex
\frac{d\sigma}{d\Omega}(e^-e^- \to e^-e^-) \\ = \frac{e^4}{64\pi^2 E_{cm}^2} \left[ \frac{(p_1^\mu + p_3^\mu)(p_2^\mu + p_4^\mu)}{t} + \frac{(p_1^\mu + p_4^\mu)(p_2^\mu + p_3^\mu)}{u} \right]^2 \\ = \frac{\alpha^2}{4s} \left[ \frac{s-u}{t} + \frac{s-t}{u} \right]^2
```)

=== Ward Identity

- Notice how the above matrix elements are all independent of our gauge parameter $xi$
  - This relates to the Ward Identity, an extremely important result which can be generalized to the Ward Takahashi identity (as the reader may see later)

- The photon propagator that we had was #qft(```latex
i\Pi_{\mu\nu} = \frac{-i\left[g_{\mu\nu} - (1-\xi)\frac{p_\mu p_\nu}{p^2}\right]}{p^2 + i\varepsilon}
```)
- With an internal photon, the matrix element satisfies $ #qft(```latex
M_{\mu\nu} \Pi^{\mu\nu} = 0
```) $

- Due to gauge invariance $Pi^munu$ should be independent of $xi$.
- Hence, #qft(```latex
\mathcal{M}_{\mu\nu} p^\mu p^\nu = 0
```)
- An alternative way to write this is $ p_mu cal(M)_munu =0 $

- The proof for the ward identity is difficult perturbatively

#example("Nontrivial Scattering")[
- An example of using external photons is the non trivial $e^- e^- -> gamma gamma$
- The t channel diagram for this is
$ i cal(M)_t =  #feyndrawgram(json("electron_photon.json")) = #qft(```latex
(-ie)^2 \frac{i(2p_1^\mu - p_3^\mu)(p_4^\nu - 2p_2^\nu)}{(p_1 - p_3)^2 - m^2} \epsilon_3^{*\mu} \epsilon_4^{*\nu}
```) $

- Then, #qft(```latex
\mathcal{M}_t = e^2 \frac{(p_3 \cdot \varepsilon_3^* - 2p_1 \cdot \varepsilon_3^*)(p_4 \cdot \varepsilon_4^* - 2p_2 \cdot \varepsilon_4^*)}{p_3^2 - 2p_3 \cdot p_1}
```)


- The u channel diagram for this interaction is $ i cal(M)_u = #feyndrawgram(json("electron_photon_2.json")) = #qft(```latex
ie^2 \frac{(p_3 \cdot \varepsilon_3^* - 2p_2 \cdot \varepsilon_3^*)(p_4 \cdot \varepsilon_4^* - 2p_1 \cdot \varepsilon_4^*)}{p_3^2 - 2p_3 \cdot p_2}
```) $

- Checking the ward identity, we replace $epsilon_3^(* nu)$ with $p_3^mu$. $ #qft(```latex
\mathcal{M}_1 + \mathcal{M}_u = e^2 [p_4 \cdot \varepsilon_4^* - 2p_2 \cdot \varepsilon_4^* + p_4 \cdot \varepsilon_4^* - 2p_1 \cdot \varepsilon_4^*] \\ = 2e^2 \varepsilon_4^{*\mu} (p_4^\mu - p_2^\mu - p_1^\mu)
```) != 0 $

- The ward identity isnt true because we don't have the seagull vertex:

$ i cal(M)_4 =  #feyndrawgram(json("seagull_2.json")) = #qft(```latex
i e g_{\mu\nu} \epsilon_{3}^{* \mu} \epsilon_{4}^{* \nu} 
```) $
- Then, replacing polarization with momentum, #qft(```latex
\mathcal{M}_f + \mathcal{M}_u + \mathcal{M}_4 = 2e^2 \varepsilon_{\mu} (p_4^\mu - p_2^\mu - p_1^\mu + p_3^\mu) \\
= 0
```)
]


#theorem("Massless Spin 1")[
  - Massless Spin 1 particles imply conservation of charge
]

- This is a nontrivial result that has important implications


- Consider $ i cal(M)_0 = #feyndrawgram(json("charge_cons_1.json")) $ where the diamond is a black box
- Now consider $ #feyndrawgram(json("charge_cons_1.json")) -> #feyndrawgram(json("charge_cons_2.json")) = i cal(M)_i (p_i,q) $
- Then, #qft(```latex
\mathcal{M}_i(p_i, q) = (-ie) \frac{i[p_i^\mu + (p_i^\mu - q^\mu)]}{(p_i - q)^2 - m^2} \epsilon^\mu \mathcal{M}_0(p_i - q)
```)

- If $p_i^2 = m^2$, $q^2 = 0$, $q_mu epsilon_mu = 0$, we have that $ #qft(```latex
\mathcal{M}_i(p_i, q) = -e \frac{p_i \cdot \varepsilon}{p_i \cdot q} \mathcal{M}_0(p_i, -q)
```) $
  - In the limit $abs(q dot p_i) << abs(p_j dot p_k)$, $ #mi(```latex
\mathcal{M}_0(p_i - q) \approx \mathcal{M}_0(p_i)
```) $
  - In this case, we would obtain $ #qft(```latex
\mathcal{M}_i(p_i, q) \approx - e {\frac{p_i \cdot \epsilon}{p_i \cdot q}} \mathcal{M}_0(p_i)
```) $
- In the case of an incoming positron, $ #qft(```latex
\mathcal{M}_i(p_i, q) \approx e {\frac{p_i \cdot \epsilon}{p_i \cdot q}} \mathcal{M}_0(p_i)
```) $

- Now consider outgoing particles
$ i cal(M)_0 = #feyndrawgram(json("charge_cons_3.json"))  $

- Adding a photon coming out of the electron provides $ #feyndrawgram(json("charge_cons_3.json")) -> #feyndrawgram(json("charge_cons_4.json")) = i cal(M)_i $
- This implies that $ #qft(```latex
\mathcal{M}_i(p_i, q) = (-ie) \frac{i ( p_i^\mu + (p_i^\mu + q^\mu) )}{(p_i + q)^2 - m^2} \varepsilon_\mu \mathcal{M}_0(p_i + q)

\\ \approx e \frac{p_i \cdot \varepsilon}{p_i \cdot q} \mathcal{M}_0(p_i)
```) $

- For a positron, #qft(```latex
M_i(p_i, q) \approx -e \frac{p_i \cdot \varepsilon}{p_i \cdot q} M_0(p_i)
```)

- Notice that this implies that #qft(```latex
\mathcal{M} \simeq e \mathcal{M}_0 \left[ \sum_{inc.} Q_i \frac{p_i \cdot \varepsilon}{p_i \cdot q} - \sum_{outgo.} Q_i \frac{p_i \cdot \varepsilon}{p_i \cdot q} \right]
```)

- Under a lorentz transformation, $epsilon_mu -> epsilon_mu + q_mu$ and hence #qft(```latex
\mathcal{M} \rightarrow \mathcal{M} + \mathcal{M}_0 \left[ \sum_{\text{incoming}} Q_i - \sum_{\text{outgoing}} Q_i \right]
```)
- Therefore, #qft(```latex
\sum_{\text{incoming}} Q_i = \sum_{\text{outgoing}} Q_i,
```)
