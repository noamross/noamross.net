---
title: Week 1 readings for ARE277
author: Noam Ross
published: false
tags: [ARE277, class, fisheries, economics, papers]
date: 2012-04-03 13:48:12

--- 


Reading
-------

-   Reviewing Gordon (1954) and Smith (1968)
-   Reading Wilen (1976) and @Clark1990

Notes on @Clark1990, Chapters 1-2
---------------------------------

General form of population dynamics is $\dot{x} = F(x) - h(t)$, that is,
population growth minus harvest. This is similar in form to capital
growth and consumption

-   Logistic growth
-   Constant harvest and MSY

### Fishing effort

Catch-per-unit-effort assumption is that that the population (stock)
level is proportional to the catch per unit effort, or $h = qEx$, where
$E$ is effort and $q$ the catchability coefficient. We insert this into
the basic model with logistic growth to get:

$$\frac{dx}{dt} = F(x) - h = rx\left(1- \frac{x}{K}\right) - qEx$$

If $E < r/q$, (the critical level of effort) then there is a unique
nonzero equilibrium of

$$x_1 = K\left(1- \frac{qE}{r}\right)$$

Above this value of $E$ there is only a zero equilibrium. The yield $Y$,
or harvest, under the positive equilibrium is

$$Y = qEx_1 = qKE\left(1- \frac{qE}{r}\right)$$

Not that this is quadratic in $qE$ and has a maximum that is the MSY at
$E = r/2q$. This function produces the *yield-effort curve* ($Y(E)$).

### Allee effects

Under a weak Allee effect (depensation), there are multiple equilibria:

![From @Clark1990:
Depensation]({{< baseurl >}}/old-blog-stuff/Screen%20Shot%202012-04-03%20at%201.43.44%20PM.png)

A bifurcation occurs at $E^*$. With a strong Allee effect (critical
depensation), we have the same phenomenon but the collapse is
irreversible:

![From @Clark1990: Critical
Depensation]({{< baseurl >}}/old-blog-stuff/Screen%20Shot%202012-04-03%20at%201.49.23%20PM.png)

These models lack stochasticity, delays and periodicity, age structure,
species interactions or spatial structure.

### Open-access fisheries

Under the logistic model, with constant price, total revenue at price
$p$ is $TR = pY(E)$. We assume that total costs are proportional to
effort, so $TC = cE$. The profits (rents) are thus $\Pi = pY(E) - cE$.
Gordon (1954) showed that that under open-access the equilibrium
$E_{\infty}$ results in $TR=TC$, or $\Pi=0$. Why? If effort is higher,
there will be losses and fishers will exit the fishery, while if effort
is lower, other fishers will enter because there are profits to be had.
Note that the costs can include opportunity costs, so a fishery may
appear profitable nonetheless.

With logistic growth, get this open-access equilibrium:

$$\frac{dx}{dt} = rx\left(1- \frac{x}{K}\right) - qEx = 0$$
$$ TR-TC = pqEx - cE = 0$$

$$E_{\infty} = \frac{r}{q}\left(1 - \frac{c}{pqK}\right)$$
$$x_{\infty} = \frac{c}{pq}$$

Note that if $c > pqK$, it is not profitable for anyone to fish. Also,
this equilibrium may be above or below the MSY, so economic overfishing
may or may not result in biological overfishing, but will at
sufficiently high prices, low costs, or high catachability
(technological efficiency).

### Dynamics

While a regulator might want to impose conditions to generate an
equilibrium that maximizes $\Pi$, (the aggregate industry profit), this
will be inefficient in a dynamic environment, as it will take time both
to reduce effort and grow the population to equilibrium conditions where
the profit is maximized. In the meantime, enforcing lower effort will be
inefficient. There is thus a trade-off between immediate and equilibrium
efficiency. This, of course, gets us into the whole time-discounting
issue.

Note that in some case, dynamics are most of the story. For instance, if
in the case of depensation, $E_{\infty}$ falls on an unstable
equilibrium, then the equilibrium is unlikely to occur, but we can study
the dynamic effects.

Smith (1969) described entry and exit into the system this way:

$$\frac{dE}{dt} = k(pqxE - cE)$$

$k$ is a constant and the term inside the parentheses represents the
profits available for entering fishers. This, along with the population
dynamics constitutes a system we can study. Depensation will result in
oscillations.

### Notes on Wilen (1976)

Smith (1968, 1969) demonstrated that the responsiveness of both species
growth and entry and exit can determine whether a species is driven to
extinction, as the "path of adjustment" can reach extinction even if
there is a stable equilibrium with positive biomass.

The fur seal fishery had an open-access period (1880-1900) and a
privately managed period (1900-1910), which provides a case study for
fishery dynamics in these regimes.

Fur seal population growth is approximated by the logistic equation,
minus the harvest including a mortality coefficient:

$$\frac{dX}{dt} = aX_t - bX^2_t - mh_tt$$

Entry and exit of fishers ($K$) is:

$$\frac{dK}{dt} = \delta \left(\frac{P_t h_t - TC^I_t - \pi^I_t}{K_t}\right)$$

Where $TC^I_t$ is the total industry cost of harvest, $P_t$ is the
price, and and $\pi^I_t$ is the minimum (industry) return needed for
entrance (opportunity cost). With constant prices ($P$), per-fisher cost
coefficients ($C$), and catchability ($A$), this simplifies to

$$ \frac{dK}{dt} = \delta(PAX - C - \pi)$$

The equilibrium stock level is thus

$$X_t^* = \frac{a-mAK_T}{b} = \frac{C + \pi}{PA} $$

The dynamics are represented in phase space and can result in extinction
or equilibrium, which can be approached directly or via oscillations:

![image]({{< baseurl >}}/old-blog-stuff/Screen%20Shot%202012-04-03%20at%204.10.39%20PM.png)

#### Empirical estimation

Discrete approximations of the equations are above in order to fit
empirical data. Also, approximations of unmeasured variables are needed.
We assume that $K$ is uniform in any interval, and approximate $X$ from
the harvest, using $X = \frac{1}{A} \frac{h_t}{K_t}$, which requires an
assumption of uniform harvest rates and chatchability in any time
period. Appropriate transformation yield linear equations that can be
fit with OLS.

(*Leaving out a lot of the econometric details here. Basically, a number
of checks shows that this worked.*)

#### Analysis

Linearizing around the equilibrium with the fit parameters suggests that
the system had a stable equilibrium, despite belief at the time that the
fur seal was heading towards extinction. This is supported by looking at
the actual data in phase-space, which resembles the spiral shape of an
oscillating approach to equilibrium:

![image]({{< baseurl >}}/old-blog-stuff/Screen%20Shot%202012-04-03%20at%204.32.26%20PM.png)

(*I'm skipping discussion of shadow prices here.*)

References
----------

Gordon, H. S. 1954. The economic theory of a common-property resource:
the fishery. Journal of Political Economy 62:124–142. Retrieved from
[http://www.jstor.org/stable/1825571](http://www.jstor.org/stable/1825571 "http://www.jstor.org/stable/1825571").

Smith, V. L. 1968. Economics of production from natural resources. The
American Economic Review 58:409–431. Retrieved from
[http://www.jstor.org/stable/1813767](http://www.jstor.org/stable/1813767 "http://www.jstor.org/stable/1813767").

Smith, V. L. 1969. On Models of Commercial Fishing. Journal of Political
Economy 77:181. doi: 10.1086/259507.

Wilen, J. E. 1976. Common Property Resources and the Dynamics of
Overexploitation: The Case of the North Pacific Fur Seal.
