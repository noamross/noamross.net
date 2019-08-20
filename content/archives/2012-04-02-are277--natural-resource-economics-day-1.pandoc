---
title: "ARE277: Natural Resource Economics Day 1"
author: Noam Ross
published: false
tags: [ARE277, economics, class-notes]
date: 2012-04-02 12:13:08

--- 


Outline of Topics:
------------------

-   4/2: Population dynamics
-   4/4: Jim Wilin on papers by Gordon and Smith. Phase diagrams,
    stability properties
-   4/9: Basic optimal control, nonlinear fishery models, transversality
-   4/11: Linear optimal control of fishery problems

Dynamic problems
----------------

-   Extractive paths (oil, water)
-   Consumptive paths
-   Investment paths

### Characteristics of dynamic problems:

1.  Involve time-dated decisions. Example:

    Assume a "Robinson Crusoe" world where $U = A l^{\alpha} F^{\beta}$
    where $l$ is leisure and $F$ is fish.

    $F = BL^{\delta}$ where $L$ is labor and $B$ is fish biomass in the
    water. Time is $T = L + l$

    Take logs of $U$ and substute:

    $$\log U = \log A + \alpha \log l + \beta \log B + \delta \beta \log (T-l)$$

    $$\frac{d \log U}{dl = 0}$$

    $$l^* = \frac{\alpha T}{l\delta \alpha} \Rightarrow L^* \Rightarrow F*$$

    Now we introduce a time-varying fish biomass $B(t)$. However, this
    has no bearing on the time-dated decisions, because our decisions
    vary instantaneously, or a series of status decisions.
    **Therefore**, dynamic problems need another factor:

2.  Involve a capital good that is:
    a.  durable (relative to decision period) (this creates an inter
        temporal relationship, or possibly a time delay)
    b.  can not be instantly and costlessly adjusted

Population dynamics
-------------------

### Basic discrete and continuous dynamics

Population is described by a basic state equation driven by births,
deaths, and dispersal ($M$):

$$N_{t+1,j} = N_{t,j} + B(t,j) - D(t,j) + \boldsymbol{M}(t,j)$$

The choice between discrete and continuous representations depends on
whether the reproduction process is pulsed. Most of our examples will be
continuous.

-   Let $\tau$ be the generation time (time to female fecundity, time of
    population to increase by factor equal to net reproduction rate).
-   $R$ is the net lifetime replacement ratio.
-   $K$ is the generation number.
-   $N$ is the population

$$ N(\tau K) = N(0)R^K $$

We can rescale this in continuous time to:

$$N(t) = N(0)e^{rt}$$

$$r = \frac{\log R}{\tau}$$

### R vs. K selection

*(A useful thought exercise, but not really considered correct anymore.
Many organisms (e.g., trees) don't fit this paradigm.)*

  Characteristic           r-        K-
  --------------------- -------- -----------
  Body Size              Small      Large
  Reproduction           Early      Late
  Lifespan               Short      Long
  Natural Mortality       High       Low
  Parental Care          Little   Extensive
  Fecundity               High       Low
  Investment in young     Low       High

  : Characteristics of r- and K-selected species

![Relationships between generation time and rates of
increase]({{% asseturl %}}assets/old-blog-stuff/ARE277Day1Fig1.jpg)

![Relationships between size and generation
time]({{% asseturl %}}assets/old-blog-stuff/ARE277Day1Fig2.jpg)

### Models of growth

Start with lumped parameter models (where details of birth and death are
captured by few parameters)

#### Exponential

$$\dot{X}_t = \frac{dX}{dt} = rX_t$$

How long does it take to get from X\_0 to X\_T?

Method 1:

$$X_T = X_0 e^{rT}$$

$$T = \frac{1}{r} \log \left(\frac{X_T}{X_0}  \right)$$

Method 2:

$$\frac{dt}{dx} = \frac{1}{rX_t}$$

$$ \int_0^T r \frac{dt}{dx} = \int_0^T \frac{1}{X_t}$$

$$ T = \frac{1}{r} \log \left( \frac{X_T}{X_0}  \right) $$

Doubling time is $\frac{1}{r} \log 2 \approx \frac{1}{r} (0.69)$.
Something growing exponentially at a a percentage rate of $100 \times r$
will double every $\frac{70}{100} r$ periods.

#### Logistic

$$\dot{X}_t = r_t X_t = rX_t - \frac{r}{L}X^2_t = rX_t \left(1 - \frac{X_t}{K} \right) $$

Growth is quadratic in $X_t$. Equilibrium at $X=0$ (unstable) and $X=K$
(stable)

Solve for $X_t$:

$$\frac{dX}{dt} = rx_t\left(1- \frac{X_t}{K}\right)  \rightarrow r dt = \frac{1}{x \left[ \frac{K-X}{K}\right]^{dx} } $$

Steps

-   Separate variables
-   Expand right-hand-side by partial fractions
-   Integrate each fraction
-   Re-arrange, solve for $X_t$

$$A = \frac{X_0}{K-X_0}$$

$$X_t = \frac{K}{1+\left(\frac{K-X_0}{X_0}\right)e^{-rt} }$$

Doubling time is no longer so simple:

$$T_{\text{double}} = \frac{1}{r} \log(2) + \frac{1}{r} \log \left(\frac{K-X_0}{K-2X_0}\right)$$

The latter term is the adjustment for density dependence.

### To-Dos

**Read**: For Wednesday, read Gordon (1954), Smith (1968), and Scott
(1955). For the following week, read Clark (1990), Chapters 1 and 2.

**HW**: Look into `R` equivalents of Matlab's `quiver` and `BVP45` for
homework problems.

References
----------

Clark, C. W. 1990. Mathematical Bioeconomics: The Optimal Management of
Renewable Resources. Wiley and Sons, New York, NY.

Gordon, H. S. 1954. The economic theory of a common-property resource:
the fishery. Journal of Political Economy 62:124–142. Retrieved from
[http://www.jstor.org/stable/1825571](http://www.jstor.org/stable/1825571 "http://www.jstor.org/stable/1825571").

Scott, A. 1955. The fishery: the objectives of sole ownership. The
Journal of Political Economy 63:116–124. Retrieved from
[http://www.jstor.org/stable/1827047](http://www.jstor.org/stable/1827047 "http://www.jstor.org/stable/1827047").

Smith, V. L. 1968. Economics of production from natural resources. The
American Economic Review 58:409–431. Retrieved from
[http://www.jstor.org/stable/1813767](http://www.jstor.org/stable/1813767 "http://www.jstor.org/stable/1813767").
