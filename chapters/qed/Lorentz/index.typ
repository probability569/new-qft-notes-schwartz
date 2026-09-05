= Spinors

== Lorentz and Spinors
#import "../../macros.typ":*
Some Supplementary material for this section is Spinors for Beginners by Eigenchris which is very useful to get a grasp of the actual math that is going on.

=== Lorentz Transformations




#definition("Metric Tensor")[
  A (or in special relativity, _The_) metric tensor is defined as being the dot product of basis vectors $ g_(mu nu) = hat(e)_((mu)) dot hat(e)_((nu))  $  This definition is all but useless in Quantum Field Theory due to the whole theory entirely using Special Relativity instead of General Relativity #footnote[
    Unless string theory, again
  ]

  The special relativity metric tensor (which is subject to arguments over convention), is either $g_(mu nu ) = "diag"(+,-,-,-)$ or $g_(mu nu ) = "diag"(-,+,+,+)$ #footnote[
    Personally I am used to $"diag"(+,-,-,-)$.
  ].
]

#definition("Lorentz Transformation & Lorentz Invariance")[
  A _Lorentz transformation_ $Lambda$ is defined as a coordinate transformation $ Lambda:(t,x,y,z) -> (t',x',y',z') $ such that $ Lambda^T g Lambda = g $ or $ Lambda^mu_alpha Lambda^nu_beta eta_(munu)  = eta_(alpha beta) $ In special relativity (minkowski space), this condition is loosened to $ s^2 = t^2 - x^2 $ is conserved but the previous condition is still useful in discussion of group theory and derivation of _Spinors_. Generally, Lorentz transformations are transformations that 
]

=== Group Theory (cont'd)
#definition("Lorentz Group")[
  This is the set of operations $Lambda$ such that $ Lambda^T g Lambda  = g $
]
- For instance, a Lorentz transformation could follow the 4-vector representation, defined as $ x_mu -> Lambda_munu x_nu $

- More generally, a field $pphi$ transforms under a representation of the lorentz group as $ pphi_i(x) -> R(Lambda)_(i j) pphi_j (Lambda^(-1) x) $ (Similar to a matrix transformation)


- The continuous Lorentz transformations that exist are _rotations_ and _boosts_, which are the most general possible (continous) Lorentz transformations which can occur as they (+ the discrete Lorentz transformations such as $P$ and $T$) form the *Lorentz Group*

- Rotations can be represented, again in the 4-vector representation, as rotation matrices. We let $theta_x, theta_y, theta_z$ represent rotations in the $x,y,z$ axes respectively. Then, the rotation matrices can be represent as as $ Lambda(theta_x) = mat(1,,,;,1,,;,,cos theta_x,sin theta_x ;,,-sin theta_x ,cos theta_x;), Lambda(theta_y) = mat(1,,,;,cos theta_y , , -sin theta_y; ,, 1 , ; , sin theta_y , , cos theta_y ;) \ 

Lambda(theta_z) = mat(1,,,; , cos theta_z , sin theta_z , ; , -sin theta_z, cos theta_z, ; ,,, 1; )

$

- In a similar manner, boosts can be represented by matrices in the 4-vector representation. Denoting $beta_x, beta_y, beta_z$ as the boost angles (in the hyperbolic trigonometric functions), we have that $ Lambda(beta_x) = mat( cosh beta_x,  sinh beta_x , , ; sinh beta_x,  cosh beta_x , , ; , ,1 , ; , , ,1 ; ), Lambda(beta_y) = mat(cosh beta_y, , sinh beta_y, ; , 1 , , ; sinh beta_y,, cosh beta_y, ; ,,,1;) \ Lambda(beta_z) = mat(cosh beta_z , , , sinh beta_z ; , 1 , ,; , , 1 ,; sinh beta_z , ,  , cosh beta_z ;) $

- Can utilize _infinitesimal_ Lorentz transformations in order to extract the group ($O(1,3)$) (we let $beta_i$ parametrize boosts and $theta_i$ parametrize rotations)
  - $ delta x_0 = beta_i x_i \ delta x_i = beta_i x_o - epsilon_(i j k) theta_j x_k $
  or $ delta x_mu = i [sum_(i in {1,2,3} ) theta (J_i)_munu + beta_i (K_i)_munu ]x_nu $
  - $J_i$ and $K_i$ matrices: 
  $ J_1 = i mat(
                 0, , , ;
                  , 0, , ;
                  , , 0, -1 ;
                  , , 1, 0 ; )
                  
    , J_2 = i mat(
                 0, , , ;
                  , 0, ,1;
                  , , 0, ;
                  ,-1, , 0 ; )    
    , J_3 = i mat(
                 0, , , ;
                  , 0,-1,;
                  ,1, 0, ;
                  ,, , 0 ; )    
\
K_1 = i mat(
                 0, -1, , ;
                  -1, 0, ;
                  , , 0, ;
                  ,, , 0 ; )    
, K_2 = i mat(
                 0, , -1, ;
                  , 0, ;
                  -1, , 0, ;
                  ,, , 0 ; )   
, K_3 = i mat(
                 0, , ,-1;
                  , 0, ;
                  , , 0, ;
                  -1,, , 0 ; )    
              
  $
     - Such matrices are _generators of the Lorentz group_
      - Can use to obtain the Lie Algebra

  - $ Lambda = exp(i theta_i J_i + i beta_i K_i) $
 

  == Dirac Spinors (TODO)
  === Spinors
  #definition("Dirac Spinor")[
    An object $psi$ obeying the transormation properties

    $ psi -> S[Lambda] psi, psi^dagger -> psi^dagger S[Lambda] $
  ]

- What does this mean?
- A lorentz transformation can be written as $ Lambda^mu_nu = exp(1/2 Omega_(rho sigma) (J^(rho sigma))^mu_nu) $ with new notation introduced for convenience such that $Omega_(0 i) = beta_i$ boosts, $Omega_(1 2) = - Omega_(1 2) = theta_z$ (rotation angles) with $ (J^(rho sigma))^munu = g^(rho mu)  g^(sigma nu) - g^(sigma mu) g^(rho nu)$

  - These are another way to write generators for the lorentz group
  - Notice that, using this tensor, we can write $ K_i = -i (J^(0 i))^mu_nu $ for boosts and  $ J_i = i/2 epsilon_(i j k) (J^(j k))^mu_nu $ for rotations
- These generators form $frak(s o)(1,3)$, the Lorentz Algebra
  - Their exponential gives a representation of the Lorentz Group double cover $"Spin"(1,3) tilde.equiv "SL"(2,CC)$

#theorem[
  The Lorentz Algebra, $frak(s o)(1,3)$, has two commuting sub-algebras represented by the 3d rotation algebras $frak(s u)(2)$
]
#proof[
- Notice that if we switch back to $J_i$ and $K_i$, we can derive $"SU"(2)$, the group for spinors.

- Define $ J^+_i equiv 1/2 (J_i + i K_i)$, $J^-_i equiv 1/2 (J_i - i K_i)$
- We have then, $ [J^+_i,J^+_j] = i epsilon_(i j k) J^+_k \ [J^-_i, J^-_j] = i epsilon_(i j k) J^-_k \ [J_i^+, J_i^-] = 0  $ hence, $frak(s o)(1,3)$ has 2 communiting sub algebras, both of which are 3d rotation groups given by the Levi-Cevita connections. Hence, $"SO"(1,3) tilde.equiv "SU"(2) plus.o "SU"(2)$
]
- Hence, we now have the definition of a spinor
#definition("Spinor")[
  A _Spinor_ is an object that transforms under $"SU"(2)$
]

=== Clifford Algebruh

- To construct Dirac Spinors, one must first construct gamma matrices, which form the basis of a Clifford Algebra $scr(C l)_(1,3) (RR)$

#definition("Gamma Matrices")[Gamma matrices are defined as being anticommuting matrices such that $ {gamma^mu, gamma^nu} = 2 g^munu $ and having the property that $ (gamma^0)^2 = 1,  (gamma^i)^2 = -1 $]


- As seen in the _math toolkit_, these matrices can be represented as $ gamma^mu = mat(, sigma^mu; macron(sigma)^mu , ;) $ with $sigma^mu = (bb(1), arrow(sigma)), macron(sigma)^mu = (bb(1), -arrow(sigma))$ and $sigma^i$ being Pauli Matrices
  - This representation is known as the Weyl Representation
- An additional piece of useful notation is the idea that $feynman(p) = p_mu gamma^mu = p^mu gamma_mu$



#rules("Pauli Matrix and Gamma Matrix Indentities")[
 $ sigma^i sigma^j = delta^(i j) i epsilon^(i j k) sigma^k, {sigma^i, sigma^j} = 2 delta^(i j), [sigma^i, sigma^j] = 2 i epsilon^(i j k) sigma^k $ For Pauli Matrices 
]

- A useful quantity to define is a representation of the Lorentz Algebra $ S^(rho sigma) = 1/2 [gamma^rho,gamma^sigma] = 1/2 gamma^rho gamma^sigma - 1/2 g^(rho sigma) $

=== Lorentz Group Representation

- We now want to derive why spinors behave the way that they do. That is, why do they have spin $1/2$?


- As seen before, we have our generators written as linear combinations #qft(```latex
J_i^+ \equiv \frac{1}{2}(J_i + iK_i), \quad J_i^- \equiv \frac{1}{2}(J_i - iK_i)
```) which formed two commuting subgroups $"SO"(1,3) tilde.equiv "SU"(2) times "SU"(2)$
- There are rotation generators $arrow(J)$ and hence the Lorentz group is a super of $"SO"(3)$
  - Any representation of $"SO"(3)$ is a representation of the Lorentz Group

- Notice that $"SU"(2)$ both have quantum numbers $A$ and $B$. The spin is their sum. 

#table(
  // Define how many columns you need (e.g., 2 columns)
  columns: (2fr,1.5fr, 1fr,1fr,1fr,1fr,1fr), 
  align: (left, top),

  // Row 1
  [$frak(s u)(2) plus.o frak(s u)(2)$ representation], [$(A,B)$],
  [$(0,0)$],[$(1/2,0)$],[$(0,1/2)$],[$(1/2,1/2)$],[$(1,1)$],

  // Row 2
  [$frak(s o)(3)$ representation],[$j=A+B$],[$0$],[$1/2$],[$1/2$],[$1 plus.o 0$], [$2 plus.o 1 plus.o 0$],
)
  - In this table, you can see that there are two different representations of $j=1/2$. Therefore, there are two different type of spinors (this corresponds to chirality which you will see)

- Now we $2 times 2$ matrices such that #qft(```latex
[J_i^+, J_j^+] = i \epsilon_{ijk} J_k^+ \\
[J_i^-, J_j^-] = i \epsilon_{ijk} J_k^- \\
[J_i^+, J_j^-] = 0
```)
- Remember our sigma matrix identities?, we had that #qft(```latex
\left[ \frac{\sigma_i}{2}, \frac{\sigma_j}{2} \right] = i \varepsilon_{ijk} \frac{\sigma_k}{2}
```) which is the perfect $frak(s o)(3)$ algebra that we wanted
  - For the $(1/2,0)$ representation, we can set $J^+ = 0$ and $J^-_i = 1/2 sigma_i$ as our generators
  - For the $(0,1/2)$ representation, we can set $J^- = 0$ and $J^+_i = 1/2 sigma_i$ as our generators

- Now we are able to get our Lorentz transformations. 
  - For rotations $arrow(J) = arrow(J)^- + arrow(J)^+$
  - For our boosts, $arrow(K) = i( arrow(J)^- - arrow(J)^+ )$

- Thus, #qft(```latex
\left( \frac{1}{2}, 0 \right) : \vec{J} = \frac{1}{2} \vec{\sigma}, \quad \vec{K} = \frac{i}{2} \vec{\sigma} \\
\left( 0, \frac{1}{2} \right) : \vec{J} = \frac{1}{2} \vec{\sigma}, \quad \vec{K} = -\frac{i}{2} \vec{\sigma}
```)
#note("Hermicity")[
  - Rotations are hermitian and boosts are anti hermitian
]

- Now we have an even better way to define spinors in terms of their handedness

#definition("Right Handed Weyl Spinor")[
  - An object transforming under the $(0,1/2)$ representation of the Lorentz group
]

- Right handed weyl spinors transform as $ #qft(```latex
\psi_R \to e^{\frac{1}{2} (i\theta_j \sigma_j + \beta_j \sigma_j)} \psi_R
```) = #qft(```latex
(1 + \frac{i}{2} \theta^j \sigma_j + \frac{1}{2} \beta^j \sigma_j + \dots) \psi_R 
```) $

#definition("Left Handed Weyl Spinor")[
  - An object transforming under the $(1/2,0)$ representation of the Lorentz group
]

- These transform as #qft(```latex
\psi_L \to e^{\frac{1}{2}(i\theta_j\sigma_j - \beta_j\sigma_j)} \psi_L = (1 + \frac{i}{2}\theta_j\sigma_j - \frac{1}{2}\beta_j\sigma_j + \dots) \psi_L
```)

- There are also infinitesimal transformations which are #qft(```latex
\delta \psi_R = \frac{1}{2} (i \theta_j + \beta_j) \sigma_j \psi_R \\
\delta \psi_L = \frac{1}{2} (i \theta_j - \beta_j) \sigma_j \psi_L \\
\delta \psi_R^\dagger = \frac{1}{2} (-i \theta_j + \beta_j) \psi_R^\dagger \sigma_j \\
\delta \psi_L^\dagger = \frac{1}{2} (-i \theta_j - \beta_j) \psi_L^\dagger \sigma_j
```)
#note("Unitarity")[Since there is no finite dimensional unitary representation of the lorentz group, spinor bases must be built in terms of momentum, much like the photon field]
=== Lorentz Invariant Lagrangian

- How do we get a Lorentz invariant lagrangian with our new spinor valued fields?
- First, let us write 
  - $ (1/2,0)$ rep: #qft(```latex
\psi_R(x) = \begin{pmatrix} \psi_{1R}(x) \\ \psi_{2R}(x) \end{pmatrix}
```)
  - $(0,1/2)$ rep: #qft(```latex
\psi(x) = \begin{pmatrix} \psi_{1L}(x) \\ \psi_{2L}(x) \end{pmatrix}
```)

- We want a lagrangian with the right number of DOF, of course
- Let us be naive and write #qft(```latex
\mathcal{L}=(\psi_R)^\dagger \Box \psi_R + m^2 (\psi_R)^\dagger \psi_R
```)
  - not L.I.: $ #qft(```latex
\delta(\psi_R^\dagger \psi_R) = \frac{1}{2} \psi_R^\dagger [i \theta_j + \beta_j \sigma_j \psi_R] + \frac{1}{2} [\psi_R^\dagger (-i \theta_j + \beta_j) \sigma_j] \psi_R 
```) \ = #qft(```latex
\beta_i \psi_p^\dagger \sigma_i \psi_R \neq 0
```) $

- Therefore, we must have two fields $psi_R$ and $psi_L$
  - Let's try terms like $psi^dagger_L psi_R$: #qft(```latex
\delta(\psi_L^\dagger \psi_R) = \left[ \psi_L^\dagger \frac{i}{2} (-i\theta_i - \beta_i) \sigma_i \right] \psi_R + \psi_L^\dagger \left[ \frac{i}{2} (i\theta_i + \beta_i) \sigma_i \psi_R \right] = 0
```)
  - Adding the h.c. will give us a lagrangian: #qft(```latex
\mathcal{L}_{\text{Dirac Mass}} = m(\psi_L^\dagger \psi_R + \psi_R^\dagger \psi_L)
```)

- Now we want kinetic terms to add to the lagrangian

  - we can try adding terms like $lag_"kin" = psi_L^dagger square psi_R + psi_R^dagger square psi_L$ but these are "not interesting" @schwartz2014quantum

  - Let's look at a term like $psi^dagger_R sigma_i psi_R$: #derivation("calculations for our new term")[#qft(```latex
\delta(\psi_R^\dagger \sigma_i \psi_R) = \frac{1}{2} \psi_R^\dagger \sigma_i [(i\theta_j + \beta_j) \sigma_j \psi_R] + \frac{1}{2} [\psi_R^\dagger (-i\theta_j + \beta_j) \sigma_j] \sigma_i \psi_R \\
= \frac{\beta_j}{2} \psi_R^\dagger (\sigma_i \sigma_j + \sigma_j \sigma_i) \psi_R + \frac{i\theta_j}{2} (\sigma_i \sigma_j - \sigma_j \sigma_i) \psi_R \\
= \beta_i \psi_R^\dagger \psi_R - \theta_j \epsilon_{ijk} \psi_R^\dagger \sigma_k \psi_R \\
```)] #qft(```latex \therefore \delta(\psi_R^\dagger \psi_R, \psi_R^\dagger \sigma_i \psi_R) = (\beta_i \psi_R^\dagger \sigma_i \psi_R, \beta_i \psi_R^\dagger \psi_R - \epsilon_{ijk} B_j \psi_R^\dagger \sigma_k \psi_R)
```)
- Notice that this is exactly how a vector transforms

  - #qft(```latex
\delta(v_0, v_i) = (\beta_i v_i, \beta_i v_0 - \epsilon_{ijk} \theta_j v_k)
```)
