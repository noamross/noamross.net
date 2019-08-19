---
title: "Dynamic Optimization in An Equation-Free Framework"
author: "Noam Ross"
tags: [SOD, control, modeling]
date: 2014-01-22T09:46:27

---


Many ecological processes are best represented by individual-based
models (IBMs), where processes at the scale of individual scale of
organisms and their actions are modeled explicitly. Such processes can
pose a problem for management or control; our observational scale,
control levers, or management goals may be limited to coarser scales
than the individual.

IBMs suffer from the curse of dimensionality. The number of possible
states of the system, which consists of the possible states and
combinations thereof of all individuals, is enormous. This makes it
difficult to apply control techniques or various levels of system
analysis.

One approach to this problem is to apply optimal control techniques to
an aggregrated model (AM) that represents an IBM at the population with
some loss of accuracy [@Federico2013]. These techniques require an AM
that adequately approximates the IBM, though. In particular, it can fail
in cases of structured, heterogenous populations of individuals.

@Kevrekidis2009a describe a set of methods for analyzing IBM-like
systems at scales coarser than the individual. In this approach, one
contructs a "coarse time-stepper" that simulates the evolution of the
system through time at the population level. This stepper consists of an
IBM, a "lifting" function, and a "restriction" function. The functions
translate between coarse and individual scales. The "restriction"
function summarizes the distribution of individuals in small set of
moments. The "lifting" function generates distributions of individuals
from these moments. Short bursts of the IBM simulate the system in
between. The time stepper can be used to estimate derivatives of the
coarse-level system. Where IBMs are stochastic, this can be accomplished
by repeated lifting and bursts of the IBM to obtain mean values.

This approach, known as "equation-free" or "multi-scale" modeling,
allows simulation at coarse scale by forward integration of the
estimated derivatives rather than full simulation of the IBM. The coarse
time stepper can also be used for other numeric analyses, such as
mapping equilibria and bifurcation points of the system. Equation-free
modeling was developed for simulation of systems in physical chemistry,
where molecular-level interactions had to be simulated at the "beaker"
level. In the ecological context, it has been applied to swarm dynamics
[@Raghib2010a] and the evolution of strains of disease [@Cisternas2004].
The technique hinges on careful selection of the coarse-scale variables,
and a separation of time scales between these variables and higher
moments of the distributions of individuals, which must come into
equilibrium under short bursts of the IBM.

Here I propose an application of equation-free techniques to optimal
control in an ecological context.

Spatial point processes
-----------------------

@Brown2004 describe a *spatial point process* which represents the
dynamics of a disease spread through a plant population. Plants are
represented as discrete points in continuous space, and each
individuals' infection and mortality are discrete events that occur in
continuous time. Specifically, a suseptible individual may be converted
to an infected one at a probability which is the sum of the force of
infection from all other infected individuals, weighted by a disease
disperal kernel. For any individual, infection is a Poisson process,
where infection occurs at random times driven by a mean rate, as is
mortality, which occurs at fixed rate for infected individuals. At the
population level, the dynamics of the disease can be approximated by a
set of differential equations:

$\def\CSI{\mathcal C_{SI}} \def\dCSI{\dot{\mathcal{C}}_{SI}}$

$$\begin{aligned}
  \dot S &= -\beta (1 + \CSI) SI - \alpha S \\
  \dot I &= \beta (1 + \CSI) SI + \alpha S - \mu I \\
  \dCSI &= f(S, I, \CSI, \ldots)
\end{aligned}$$

Here $S$ and $I$ are the populations of suseptible and infected
individuals, $\beta$ is the overall contact rate between them and
$\alpha$ the background infection rate from exogenous spore pressure,
and $\mu$ is the mortality rate for diseased plants. $\CSI$ is a spatial
covariance term. It is essentially the integral of the distribution of
distances between pairs of plants, weighted by the dispersal kernel of
the disease.

The evolution of $\CSI$ can not described by a closed-form equation. It
must be simulated at the individual scale and depends on the particular
arrangement in space of individuals. However, using the equation-free
framework, we can construct a coarse-time stepper that estimates
$\Delta S, \Delta I$, and $\Delta \CSI$ over short intervals.

Control of the spatial point process
------------------------------------

In addition to the internal system dynamics, we also introduce a control
variable, $h$, which represents a harvest of plants:

$$\def\CSI{\mathcal C_{SI}}
\def\dCSI{\dot{\mathcal{C}}_{SI}}$$

$$\begin{aligned}
  \dot S &= -\beta (1 + \CSI) SI - \alpha S - h S \\
  \dot I &= \beta (1 + \CSI) SI + \alpha S - \mu I - h I \\
  \dCSI &= f(S, I, \CSI, h, \ldots)
\end{aligned}$$

Managers may harvest plants in order to reduce rate of disease-induced
mortality. Plants provide an ecosystem service continuously ($\gamma$
per plant per unit time) as long as they are alive, which managers want
to maximize. However, the only tool they have at their disposal (in this
sylized model) is harvesting the plant population to reduce contact
rates, irrespective of plant disease status. Harvesting occurs at a rate
$h$, the portion of plants removed per unit time, and the cost are
$c(S+I)$, where $c$ is the cost of removing a plant.

The (current-value) Hamiltonian equation of this system is:

$$\begin{aligned}
  \mathcal H = &\gamma S + \gamma I - chS - chI +
               \lambda_1 (-\beta (1 + \CSI) SI - \alpha S - h S) + \\
               &\lambda_2 (\beta (1 + \CSI) SI + \alpha S - \mu I - h I)  +
               \lambda_3 (f(\cdot))
\end{aligned}$$

The final term, $\lambda_3 (f(\cdot))$, represents the shadow price of
the spatial correlation, or the value of having the individuals arranged
in their particular configuration. We can determine the evolution of the
shadow prices by differentiating $\mathcal H$:

$$\begin{aligned}
\frac{\partial \lambda_1}{\partial t} =
  -\frac{\partial \mathcal H}{\partial S} - \delta \lambda_1 &=
  -\gamma + ch -\lambda_1 (-\beta (1 + \CSI) I - \alpha - h - \delta)
  - \lambda_2 (\beta (1 + \CSI) I + \alpha)
  - \lambda_3 \left(\frac{\partial f}{\partial S}\right) \\
\frac{\partial \lambda_2}{\partial t} =
  -\frac{\partial \mathcal H}{\partial I} - \delta \lambda_2 &=
  -\gamma + ch - \lambda_1 (-\beta (1 + \CSI) S)
  -\lambda_2 (\beta (1 + \CSI + \delta) S - \mu - h)
  - \lambda_3 \left(\frac{\partial f}{\partial I}\right) \\
\frac{\partial \lambda_3}{\partial t} =
  -\frac{\partial \mathcal H}{\partial \CSI} - \delta \lambda_3  &=
  -\lambda_1 (-\beta SI) - \lambda_2(\beta SI)
  - \lambda_3 \left(\frac{\partial f}{\partial \CSI} + \delta \right)
\end{aligned}$$

(With $\delta$ being the discount rate)

The derivatives of $f$ in these equations can be approximated if our
forward integration scheme estimates the second derivative of $\CSI$,
which it will if the forward integrator uses a polynomial scheme.

$$\frac{\partial f}{\partial S} =
  \frac{\partial f / \partial t}{\partial S / \partial t}  \approx
  \frac{\Delta \dCSI}{\Delta S}$$

For any of the derivatives above, though, we require $h$, which can be
calculated using the maximum principle:

$$\begin{aligned}
    &\frac{\partial \mathcal H}{\partial h} = -cS - cI + \lambda_1 S + \lambda_2 I +
    \lambda_3 \left(\frac{\partial f}{\partial h}\right) = 0 \\
    &\frac{\partial f}{\partial h} -
    \frac{S(c - \lambda_1) + I(c - \lambda_2)}{\lambda_3} = 0
\end{aligned}$$

Here we must approximate $h$ by using a Newton-type method where we
calculate $\partial f / \partial h$ by finite differences, repeated
calling the time-stepper. This may be the most numerically costly and
challenging component of the scheme, especially when the time-stepper is
stochastic.

With the above calculations, we can wrap the Hamiltonian set of ODEs, in
a differential equation solver, and additionally in a boundary value
solver to determine optimal paths.

I note that this scheme requires that the IBM have an explicit
implementation of a "lifting function" for the harvest variable. This
could take many potential forms which would correspond to different
harvest "strategies". That is, there are many ways that plants could be
harvested from the spatial point distribution for any given rate:
randomly, in a fixed or responsive spatial pattern, etc. This
optimization can only find the best harvest path for any given
"strategy".

Generalization
--------------

This approach should be applicable to similar systems where there is a
tractable profit function at the coarse scale $(\pi)$ but where the
evolution of the system can only be simulated by a "black box" function
$(f)$.

$$\dot S = f(S, h)$$ $$\mathcal H = \pi(S, h) + \lambda f(\cdot)$$
$$\frac{\partial \lambda}{\partial t} =
  -\frac{\partial \pi}{\partial S}
  -\lambda \left(\frac{\partial f}{\partial S} - \delta \right)
  \approx -\frac{\partial \pi}{\partial S}
  -\lambda \left(\frac{\Delta \dot S}{\Delta S} - \delta \right)$$
$$h^* = h \text{ given } \left\{\frac{\partial \pi}{\partial h} + \lambda \frac{\partial f}{\partial h} = 0\right\}$$

Questions and Next Steps
------------------------

-   Has something like this been implemented before? I think the
    multi-scale approach combined with optimal control such as this is
    novel, but I would not be surprised if a numerical approach had been
    taking to solving adjoint and maximum equations before.
-   I'm working on implementing a coarse time-stepper for the spatial
    point process. The thorniest part here is generating a sample
    spatial point fields from a given $\CSI$ value. This will probably
    be the computational bottleneck so I'm working on an efficient
    approach for it. From there I'll work on the algorithm from the
    inside out.

* * * * *
