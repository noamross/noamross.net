---
title: ARE277 - Transversality and Linear Optimal Control
author: Noam Ross
published: false
tags: [ARE277, ecomomics, fisheries]
date: 2012-04-11 12:11:27

--- 


Transversality Conditions
-------------------------

(See Leonard and Long (1992), Chapter 7)

Our optimization problem is:

$$J\{u\} = \int_o^T g(x_t,t,u_t) dt$$

$$\dot{x} = f(x_t, t, u_t)$$

$$x_0, x_T$$

$x_t$ is our state variable, and $u_t$ is our control function.
$g(\cdot)$ is the utility function. Discounting isn't explicit, but is
part of our $g(\cdot)$. Transversality conditions allow us to solve for
different $x_0$ and $x_T$ conditions.

### Case 1: No explicit time point.

If we have no defined stop point for using the resources $x_T$ is free.
In this case, we harvest until there is no more value, or so
$x^*(T) = 0$. Here is the proof:

For any given $x_T$, let $J^*(x_T)$ denote the optimal value of $J$ at
$x_T$. The optimal choice of $x_T$ must maximize $J^*(x_T)$, so
$\frac{dJ^*}{dt} = 0$. $J^*$ occurs at optimal $x^*$ and $u^*$:

$$\begin{aligned} 
   J^* &= \int_0^T \left[g(\cdot)\bigg|_{x^*,u^*} + \lambda(t)(f(\cdot)\bigg|_{x^*,u^*} - \dot{x})\right] dt \\
   &= \underbrace{\int_0^T g(\cdot) dt + \int_0^T \lambda(t) f(\cdot) dt}_{\text{The Hamiltonian } H} - \underbrace{\int_0^T \lambda(t) \dot{x} dt}_{\lambda x^* - \int \dot{\lambda} x^* dt} \\
   \frac{dJ^*}{dx_t} &= \int_0^T \left[H_x \frac{d\dot{x}}{dt} + H_u + \frac{du^*}{dx_T} + H_{\lambda} \frac{d\dot{x}}{dt} + \dot{\lambda} \frac{dx^*}{dx_T} + x^* \frac{d\lambda}{dx_T} \right]    dt - \lambda(T)
  \end{aligned}$$

$\lambda(t)$ is an arbitrary function, so we set its derivatives with
respect to $x_T$ to zero, and we select the optimal path
$H_x = -\dot{\lambda}$. We get:

$$   \frac{dJ^*}{dx_T} =  -\lambda(T)$$

Thus, the marginal value from requiring an addition unit of $x$ at time
$T$ deducts $\lambda^*(T)$ per unit of $J^*$. Since
$\dot{\lambda}(T) = 0$, at time $T$ there is no additional value from
harvesting.

### Case 2

$$\frac{dJ^*}{dx_0} = \lambda(0) = 0 $$

### Case 3: Scrap value

*Scrap value* is additional value left in the system at the end of use.
It's function of both the state variable and the finish time:
$$\phi(x_T, T)$$

$$\lambda(T) = \frac{d\phi(x_T,T)}{dx_T}$$

This is the marginal cost. $dx_T$ is the marginal benefit of leaving
behind an additional unit of $x_T$.

### Case 4

$T$ is free, with $x_0$ an $x_T$ given, and no scrap value.

$$H^*(x_T^*, u_T^*, \lambda_T^*, T^*) = 0\, \text{ (provided a finite period)}$$

$$\frac{dJ^*}{dT} = H^*$$

Suppose we increase $T$ by $\Delta T$, $J^*$ will increase or decrease
depending whether $H$ is positive or negative at $T$.

(Optimal $T^*$, $\frac{dH}{dT} = 0$), $H_T > 0\, \forall\, T$, then
$T^* = \infty$.

### Case 5

$T$ is free, with scrap value

$$H^*(T^*) = - \frac{d\phi}{dT}$$

Current vs. Present-Value Hamiltonian
-------------------------------------

$$H = e^{-rt} \Pi(h(t)) + \lambda_t \left[ F(x_t) - h(t) \right]$$

This is the *present value* Hamiltonian. All cases are discounted back
to time zero. $\lambda(t)$ is the marginal value of the state discounted
to time zero.

In a *current value* hamiltonian, values/dollars are measured at time
*t*.

$$ H = e^{-rt} \left[\Pi(h_t) + e^{rt} \lambda_t \left[ F(x_t) - h(t) \right]\right] $$

We define $m_t \equiv e^{rt} \lambda$. $m_t$ is the *current value
multiplier*.

$$\mathcal{H} = e^{rt} H = \Pi(h_t) + m_t\left[F(x_t) - h_t\right] $$

As $H = e^{-rt} \mathcal{H}$, we show that

$\dot{m} = rm_t - \mathcal{H}_x$

Our marginal value at time $t$ is $\dot{m} = rm_t - F(x)$, and we use
this different adjoint.

Linear Optimal Control
----------------------

The fishery model in current value:

$$H = \Pi(h_t) + \lambda(t) \left[(F(x_t) - h_t\right]$$

This leads to two ODEs:

$$\dot{h} = \frac{\Pi_{h}}{\Pi_{hh}} [r - F_x]$$

$$\dot{x} = F(x) - h $$

What happens as $\Pi_{hh}$ approaches zero at some points?

$$\frac{dh}{dx} = \frac{\Pi_h [r - F_x] }{\Pi_{hh} [F(x) - h]}  $$

As the adjustment cost goes to zero, you spend more time near the steady
state. Away from the steady state, the adjustment cost prevents you from
getting there. With lower adjustment costs, you will approach the
optimum faster, stay longer, and then leave quickly as $t$ approaches
the final $T$.

If $\Pi_{hh} = 0$, you get *linear optimal control*.

$$\max_{E_t} \int_0^\infty e^{-rt} [ph_t - cE_t ] dt$$

$$\dot{x} = F(x_t) - h_t$$

$$\underbrace{h_t = qE_tx_t}_{\text{(the Schaefer production function)}}$$

$$x_0, x_T$$

With the Scaefer function, effort is interchangeable with harvest:

$$\max_{h_t} \int_0^\infty e^{-rt} \left[p - \frac{c}{qx_t}\right] h_t dt$$

Or, more generally,

$$ \max_{h_t} \int_0^\infty e^{-rt} [p - c(x)] h_t dt$$

We set up the problem:

$$\begin{aligned} 
   H &= (p-c(x))h_t + \lambda[F(x) - h_t] \\
     &= (p-c(x) - \lambda)h_t + \lambda F(x)
  \end{aligned}$$

$\frac{dH}{dh_t} = 0$ at the maximum

Without a bound, the solution would be to harvest at an infinite rate
immediately, so we impost $h_t \leq h^\max$.

If $p -c(x) -\lambda > 0$, harvest $h^\max$.

If $p -c(x) - \lambda < 0$, harvest 0.

$$h_t = \begin{cases} h^\max& r(t) > 0 \\ ?&  r(t) = 0 \\ 0& r(t) < 0 \end{cases}$$

For $r(t) = 0$, $\lambda = p-c(x)$ for some $t$.

On these $t$ it follows that $\frac{d\sigma}{dt} = \dot{\sigma} = 0$

$$\dot{\lambda} = - \dot{x} c'(x)$$

Adjoint equation:

$$\dot{\lambda}_t  - r\lambda_t = \frac{dH}{dx} = -c'(x) h_t + \lambda F'(x_t)$$

$$\dot{x} = F(x) - h_t$$

We remove $\dot{\lambda}_t$

$$\lambda_t = p-c(x)$$

$$ r = F'(x(t)) - \frac{c'(x_t) F(x_t)}{p-c(x_t)}$$

This assumes $p \neq c(x_t)$. It is an implicit equation of $x_t^*$
along the path r(t) = 0 (called the *singular path*, or the *golden
rule* of renewable resources). The singular solution $x_t^*$ is
constant.

This means that in an actual fishery, the optimal approach is to harvest
at the target rate infinitely. If you are below the right stock level,
the optimum policy to to impose a moratorium. If you are above that
level, the optimum is to harvest at the maximum rate until you hit the
target stock level.

![The singular path, or *most rapid approach path*
(MRAP)]({{% asseturl %}}assets/old-blog-stuff/singpath.png)

Showing that the singular path/MRAP was the economic optimum was shown
by Spence and Starrett (1975). This approach means that all you need to
solve for the solution is $t^*$:

$$\int_0^t (p-c(x)) h^\max + \int_t^\infty (p-c(x^*))h^*$$

### Comparing to MSY

$$ r = F'(x) - \frac{c'(x)F(x)}{p-c(x)}$$

#### Case 1: Stock-independent costs

Assume $c'(x) = 0$ (no stock dependent costs)

$$ r = F'(x) $$

$r$ is the social rate of return. $F'(x)$ is the *biological rate of
return*. Since $r$ is positive, and $F(x)$ is peaked, we must be on the
upslope of the growth curve. Thus, $x^* < x^\text{MSY}$

#### Case 2: Costs Increase as stock gets scarcer

$$c'(x) \neq 0, \, c'(x) < 0$$

In this case, $F'(x)$ could be positive or negative, so if the stock
effect ($c'(x)F(x)/(p-c(x)$) is large, the optimum could be above the
MSY level.

#### Case 3: No discounting

$$r=0$$

$$F'(x) = \frac{c'(x)F(x)}{p-c(x)}$$

Here $x^* > x^\text{MSY}$

#### Case 4:

$$r=0, \, c'(x) = 0$$

$$F'(x) = 0$$

Here $x^* = x^\text{MSY}$

#### Case 5

$$r \rightarrow \infty$$

$$p-c(x) \rightarrow 0, \, p=c(x)$$

This is the same as the open-access case, when prices are equal to costs
and profits are zero.

Here $x^\text{OA} < x^*$. Remember $r(t) = p-c(x) -\lambda = 0$. The
optimum relative to MSY is unknown.

If we tax open-access fisherman at the shadow price, then they will act
at sole owners. It should also be the cost for a period fishing rights.
The *asset* price of a license should be the future discounted value of
the shadow price.

References
----------

Leonard, D., and N. G. V. Long. 1992. Optimal Control Theory and Static
Optimization in Economics. Cambridge University Press, Cambridge.

Spence, M., and D. Starrett. 1975. Most rapid approach paths in
accumulation problems. International Economic Review 16:388–403.
Retrieved from
[http://www.jstor.org/stable/10.2307/2525821](http://www.jstor.org/stable/10.2307/2525821 "http://www.jstor.org/stable/10.2307/2525821").
