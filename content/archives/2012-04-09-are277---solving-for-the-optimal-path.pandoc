---
title: ARE277 - Solving for the Optimal Path
author: Noam Ross
published: false
tags: [ARE277, class, economics, fisheries]
date: 2012-04-09 12:12:02

--- 


Thresholds / Critical Depensation in Population Dynamics
--------------------------------------------------------

Mechanisms for critical depensation (Allee effect):

-   Mate-finding (example: Right Whales)
-   Demographic stochasticity (can be captured by a deterministic
    threshold if stochasticity is not explicit)

$$\dot{X} = -r\left(1- \frac{X}{\tilde{K}}\right)\left(1- \frac{X}{K}\right)X$$

Here, $\tilde{K}$ is the threshold of zero growth.

Optimal Control
---------------

### Terminology

-   1-dimensional: 1 control, 1 state variable

State equation:

$$\dot{X} = f(X,t,u(t))\, 0 \leq t \leq T$$

$X(t)$ is the *state variable*, u(t) is the *control variable*. The
equation gives us the path over time, and we use *u* to manipulate that
path. $T$ is the terminal time, but it can be $\infty$.

In some cases, there will be a *terminal condition*, or boundary
condition, e.g., $X(T) = X_T$.

A feasible control $u(t) \subseteq U(t)$ such that $X_t$ satisfies
$(X_0,\, X_t)$, where $U(t)$ is closed and bounded.

The objective Functional:

$$J\{u\} = \int_0^T g(x(t), t, u(t))\, dt$$

*Aside: a Functional is a function of a function, as in
$F_{a,b}\{f\}=\int_a^b f(x)^2\,dx$*

$g(\cdot)$ is a given, continuously differentiable function. For
instance, it could be the profit function.

The goal of optimal control is to find $u(t)$ that maximizes $J\{u\}$
such that it satisfies the boundary conditions and the state equation.

The *Pontraygin conditions* give the necessary conditions that must be
satisfied for $u(t)$ to exist.

$$J\{u\} = \max_{u(x)} \int_0^T g(\cdot) \, dt, \text { s.t. } \dot{X} = f(\cdot), \, X_0, X_T$$

Necessary conditions:

-   The Hamiltonian ($H$), which is the dynamic equivalent of the
    Lagrange,

    $$H = g(x,t,u(t)) + \lambda(t)(f(x(t),t(u(t)))$$

    $$H = \text{profits summed over time} + \lambda[\text{stock over time}]$$

-   The adjoint ($\lambda$) equation:

    $$ \frac{d\lambda}{dt} = -\frac{dH}{dx} = -\frac{\partial g}{\partial x} + \lambda(t) \frac{\partial f}{\partial x}$$

    $$ \max_{u(t) \subseteq U(t)} H \Rightarrow \frac{dH}{du} = 0$$

-   A differentiable state function

    $$\frac{dx}{dt}=f(\cdot)$$

-   Boundary conditions

    $$X_0, X_t, x(t) \geq 0$$

For multivariable problems, we just use vectors for each of the state
variables.

### Example: A Non-linear Fishery

Here our control is the harvest function $h(t)$, and $g(\cdot)$ is the
time-discounted profit function.

$$\max_{h_t} \int_0^T e^{-rt} \Pi h(t)\,dt$$

$$\dot{X}_t = F(X_t) - h_t$$

$F(X_t)$ is logistic. Also, profit is a positive, concave function of
harvest:

$$\Pi_h \geq 0,\, \Pi_{hh} \leq 0$$

Our Hamiltonian is:

$$H = e^{-rt} \Pi(h(t)) + \lambda [F(X_t) - h_t]$$

<div style="border:1px solid #ccc; padding:20px;">

#### Aside: Dimensionality

$$\dot{X}_t = F(X(t)) - h(t)$$

$$\frac{\text{biomass}}{\text{time}} = F(X_t) - \frac{\text{biomass}}{\text{time}}$$

$$F(X_t) = \delta X_t\left(1 - \frac{X_t}{K}\right)$$

$$\delta = \frac{1}{\text{time}}$$

This means that $\Pi_{hh} \leq 0$ means that there is a penalty, or
*adjustment cost* for changing $h$ too fast.

$\lambda_t$ is in dollars per unit biomass - it is a shadow price.

</div>

*Back to the problem:*

2.  Determine the conditions:

    A.
    $$\frac{d\lambda_t}{dt} = -\frac{dH}{dX} = -\lambda_t \frac{dF}{dX_t}$$
    B. The K-T Condition:
    $$h_t \frac{dH}{dt} = 0 = \left( e^{-rt} \Pi_{h_t} - \lambda_t \right) h_t$$\
    C. $$\frac{dX_t}{dt} = F(x_t) - h(t)$$

Assume $h^* \neq 0$

$$e^{-rt} \Pi_{h_t} - \lambda_t = 0$$

$$\dot{\lambda}_t = \lambda_t \frac{dF}{dX_t}$$

$$\dot{X}_t = F(x) - h{t}$$

Eliminate $\lambda$. Differentiate the first equation, using the chain
rule, and set equal to the second:

$$\frac{d\lambda}{dt} = -re^{-rt} \Pi_{h_t} + e^{-rt} [\dot{h} \Pi_{hh}] \Rightarrow$$

$$-r \Pi_{ht} + \dot{h} \Pi_{hh} = -\Pi_{h_t} \frac{dF}{dX_t}$$

$$\dot{h} = \frac{\Pi_{h_t}}{\Pi_{hh}} \left[ r - \frac{dF}{dX_t} \right]$$

$$\dot{X} = F(X_t) - h(t)$$

Boundary equations $(X_0, X_T)$. Note that the boundary conditions are
only for the biomass, not the harvest. If you get $(X_0, h_0)$, then you
can solve this as a set of normal ODEs.

### Stability / Phase Diagrams

The phase diagram should describe *all* qualitative solutions. Now the
diagram gives us the *optimal* path - the optimal $h$ and associated
$X$. We

$$\dot{h} = \frac{\Pi_{h_t}}{\Pi_{hh}} \left[ r - \frac{dF}{dX_t} \right]$$

$$\dot{X} = F(X_t) - h(t)$$

We derive the nullclines and plot:

$$h(t) = F(X_t)$$

For $\dot{h} = 0$, $r = \frac{dF}{dX_t}$

![image]({{% asseturl %}}assets/old-blog-stuff/optphase.png)

Now, with $X_0$, you need $X_T$ to determine what that harvest path and
$h_0$ are. For $T=\infty$, we want to get onto one of the saddle paths
that leads to the saddle node.

#### Linearizing

$$ \begin{bmatrix} \dot{h} \\ \dot{X} \end{bmatrix} = \begin{bmatrix} \frac{d \dot{h}}{dh} && \frac{d \dot{h}}{dX} \\ \frac{d \dot{X}}{dh} && \frac{d\dot{X}}{dX}     \end{bmatrix} \begin{bmatrix} h^* - h^{ss} \\ x^* - x^{ss} \end{bmatrix} $$

$$\begin{bmatrix} \frac{d\dot{h}}{dh} = r - F'(X) - \frac{\Pi_h}{\Pi_{hh}}[r - F'(x)]   && \frac{d\dot{X}}{dh} = -1 \\ \frac{d\dot{h}}{dX} = \frac{\Pi_h}{\Pi_{hh}} F_{XX} &&\frac{d\dot{X}}{dX} = F_X \end{bmatrix}$$

Note that stability is determined by the determinant *and* the trace of
the Jacobian matrix:

![Relationship between the Jacobian and stability, from
]({{% asseturl %}}assets/old-blog-stuff/QuickShot%202012-04-09%20at%2013.43.08.jpg)

As the time horizon increases, the longer one spends near the
equilibrium. (Known as the Catenery Turnpike theorem - Paul Samuelson
(1965)) Note that, due to discounting, a long-term horizon is equivalent
to an infinite one.

Finding the optimal path is a numeric problem - using a "shooting
algorithm" of adjusting $h_0$ until our $X_T$ comes out correctly.

#### Transversality

*Transversality* conditions are boundary conditions if there is no
$X_T$. This is driven by the shadow price at $T$, which should be zero:

$$\lambda(T) \equiv \lambda_t = 0$$

$$e^{-rt} \Pi_{h_t} - \lambda_t = 0$$

$$e^{-rT} \Pi_{h_t} = \lambda_t $$

$$\Pi_{h_t} = 0$$

In this case, the conditions correspond to the point of no profit in the
fishery.

Edelstein-Keshet, L. 1988. Mathematical Models in Biology. McGraw-Hill.
