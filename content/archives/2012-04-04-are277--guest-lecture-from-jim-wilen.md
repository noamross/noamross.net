---
title: "ARE277: Guest Lecture from Jim Wilen"
author: Noam Ross
published: false
tags: [ARE277, lecture-notes, class, economics]
date: 2012-04-04 21:41:09

--- 


Papers discussed: Gordon (1954), @Hardin1966, Scott (1955), Smith (1968)

Gordon was a labor economist who was interested in why Eastern Canada
was poor despite the abundant ocean resources. At the time, work by
Beverton and Holt and others was producing very sophisticated
*biological* fishery models. Gordons model of fish growth was:

$$\dot{X}_t = a-bX_t - H_t$$

which was a linear rather than quadratic model with harvesting. The
harvest rate was proportional to effort/capital $K_t$ and the biomass
and catchability $q$

$$H_t = qK_tX_t$$

In steady state:

$$X_{ss}[qK_s b] = a,\, X_{ss} = \frac{a}{b qK_{ss}} $$

With prices ($p$) and cost per unit effort ($w$) fixed,

$$TR_{ss} = pqX_{ss}K_{ss} = \frac{apqK_{ss}}{b qK_{ss}}$$

$$TC_{ss} = wK_{ss}$$

![image]({{% asseturl %}}assets/old-blog-stuff/fisheq.png)

![image]({{% asseturl %}}assets/old-blog-stuff/openrent.png)

Consequences of open access (no owner of resource)

-   overexploitation
-   dissipation of potential resource rents
-   particular dynamic properties of regime

The key result was that controlling the level of effort, could result in
greater rents that could be distributed. In the case of Eastern Canada,
this is part of the story, the other side is that opportunity costs for
the fishermen were low, because they had few other opportunities

@Hardin1966 had a less complete view, but had both a game-theory and
externality approach, with a greater focus on the biological
overexploitation rather than rent dissipation.

The idea that the fisheries should have ownership happened. The UN Law
of the Sea established 200 mile exclusive economic zones.

Smith (1968) created the *dynamic* version of Gordon's model. Rents were
marginal incentives to enter the fishery. In his model, The costs for
individual vessels are

$$c = \phi(h,X,K) + \pi$$

Where $c$ is individual vessel costs, $h$ is the catch per vessel, $X$
is the fish stock, $K$ is number of boats fishing, and $\pi$ is a cutoff
required for entry. This drives change in the number of vessels as well
as the biomass stock:

$$\dot{X} = f(X_t) - K_t h_t$$

$$\begin{aligned} \dot{K} &= \delta \left[ \frac{pKh_t - Kc(h,X,K) - K \pi}{K}\right] \\ &= \delta [ph_t - c(h_t, X_t, K_t) - \pi)] \end{aligned}$$

We assume a simple functional form for the population dynamics and that
costs are proportional to the harvest:

$$\dot{X} = aX- bX^2 - qXK$$

$$\dot{K} = \delta [pqX - (c   \pi)]$$

Of course, these are simple entry-exit dynamics - people make decisions
based only on current profits. A more realistic model would include
forward-looking decision making.

We can analyze this system with phase diagrams, numerical methods (by
discretizing the system), or analytical solutions in some cases.

### Phase diagrams

1.  Determine and draw isoclines/nullclines

    $$\dot{X} = 0\, \text{ when }\, X[a-bx-qK] = 0$$

    $$\dot{K} = 0\, \text{ when }\, \frac{1}{q}[a-bX] = 0$$

    ![image]({{% asseturl %}}assets/old-blog-stuff/smithphasediagram.png)

2.  Determine motion of the system in each section of the phase diagram.
    This can be done by simple intuition in some case.

3.  Draw some representative trajectories - either computationally or by
    thought exercise. One way do do this is remove the time element:

    $$\frac{dK}{dX} = \frac{\delta[pqX-(c \pi)]}{ax-bx^2-qKX}$$

    Were this solvable, it would provide you with the curve.

    Rules for trajectories:

    -   Don't cross
    -   Cross isoclines horizontally and vertically
    -   Reflect the signs and force operating in each plane
    -   Influenced by the equilibrium (see "stability analysis", below)

4.  Explore motion around the axis - what happens as values approach
    zero?

    $$\lim_{x \rightarrow 0} \frac{dK}{dX} = \frac{\delta[pqX -(c \pi)]}{ax - bx^2 -qKX} = -\infty$$

Ordinarily, for economic models involving dynamic optimization, a phase
diagram will *not* have spirals, but saddle nodes and associated saddle
paths - smooth asymptotic approaches to the equilibrium. With a set of
equations that you get as an optimization solution, all trajectories
will be optimal paths for particular initial and final conditions.

### Stability analysis

Consider a system of linear ODES:

$$\begin{bmatrix}  \dot{X} \\ \dot{Y} \end{bmatrix} = \begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} X \\ Y \end{bmatrix} $$

It has a solution:

$$\begin{aligned} 
   X(t) = A_1e^{\lambda_1 t} +  A_2e^{\lambda_2 t} \\
   Y(t) = B_1e^{\lambda_1 t} +  B_2e^{\lambda_2 t}
  \end{aligned}$$

Where $\lambda_i$ are eigenvalues of the matrix $\boldsymbol{A}$ - roots
of the characteristic equation derived from det$[A-\lambda I]$.

$$\det \begin{vmatrix} a-\lambda & b \\ c & d-\lambda \end{vmatrix} =0$$

    $\lambda$    type of equilibrium
  ------------- ---------------------
    both \>0          unstable
     both <0           stable
   one of each      saddle point
     complex    
    real \> 0      unstable focus
     real <0        stable focus

We can take a Taylor expansion of a non-linear system to create a local
linear system, in order to describe stability around that equilibrium.
To do so, we create Jacobian of partial derivatives of the system and
solve them at equilibrium:

$$\begin{bmatrix}  \dot{X} \\ \dot{Y} \end{bmatrix} = \sigma   \begin{bmatrix} F_X & F_K \\ G_X & G_K \end{bmatrix} \begin{bmatrix} X-X^* \\ Y-Y^* \end{bmatrix}   \sigma^2 \dots$$

We take the determinate of $\boldsymbol{A}-\lambda I$ and set it equal
to zero, and solve for $\lambda$.

### Scott (1955)

Optimal use balances the capital depreciation against the current
profits

$$J^*_t = \max_{h_t} \int_t^{\infty} e^{-r(s-t)} \Pi(h^*(s), X^*(s)) ds$$

Gordon, H. S. 1954. The economic theory of a common-property resource:
the fishery. Journal of Political Economy 62:124–142. Retrieved from
[http://www.jstor.org/stable/1825571](http://www.jstor.org/stable/1825571 "http://www.jstor.org/stable/1825571").

Scott, A. 1955. The fishery: the objectives of sole ownership. The
Journal of Political Economy 63:116–124. Retrieved from
[http://www.jstor.org/stable/1827047](http://www.jstor.org/stable/1827047 "http://www.jstor.org/stable/1827047").

Smith, V. L. 1968. Economics of production from natural resources. The
American Economic Review 58:409–431. Retrieved from
[http://www.jstor.org/stable/1813767](http://www.jstor.org/stable/1813767 "http://www.jstor.org/stable/1813767").
