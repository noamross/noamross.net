---
title: ARE277 - Linear Optimal Control
author: Noam Ross
published: false
tags: [ARE277, class-notes, fisheries, economics]
date: 2012-04-16 20:09:36

--- 


*(Definitely some gaps in the notes today. Contributions welcome in any
form)*

Linear Optimal Control Solutions
--------------------------------

Last time we derived $x^*$, derived from the [*golden
rule*](http://noamross.net/blog/2012/4/11/are277---transversality-and-linear-optimal-control.html)
and compared the results to MSY:

$$r = 0 = F'(x) - \frac{c'(x)F(x)}{p-c(x)} \Rightarrow x^*$$

$$F'(x) = 0 \Rightarrow x^{\text{MSY}}$$

Define steady-state rents

$$R(h,x)\big|_{\dot{x} = 0} = h(p-c(hx))$$

At steady stae, $F(x) = h$, so $$R(h,x) = (p-c(x))F(x)$$

The present value of $R$ is:

$$\begin{aligned} 
   PV(R) &= \int_0^\infty e^{-rt} [p-c(x)] F(x) dt \\
   &= \frac{[p-c(x)]F(x)}{r} 
  \end{aligned}$$

If we liquidate the stock $(\tilde{x})$ by a little bit, what do we
gain, and what do we lose?

The gain is $p-c(x)$, and the cost is:

$$\frac{dPV}{dx} \Delta x = \frac{1}{r} \frac{dR}{dx} \Delta x$$

$$\frac{dR}{dx} = -c'(x)F(x) + (p-c(x))F'(x)$$

$$r[p-c(x)] = -c'(x)F(x) + (p-c(x))F'(x)$$

If we re-arrange the equation, we get the golden rule equation again.
This means that $\tilde{x} = x^*$. This is a useful intuition - the
optimal harvest is a balance between what you take out now, how much the
resource will yield later.

Let's look at this graphically. Assume $c(x) = w/x$:

$$\text{Sustained revenues} = pF(x)$$

$$\text{Sustained costs} = c(x)dF(x)$$

![]({{% asseturl %}}assets/old-blog-stuff/rent3.png)

![]({{% asseturl %}}assets/old-blog-stuff/rent2.png)

![Graphical demonstration of the relationship between $x^\text{MSY}$,
$x^*$, and $\hat{x}$
(incomplete)]({{% asseturl %}}assets/old-blog-stuff/rent1.png)

$\hat{x}$ is where rents are maximum. Note that $x^* < \hat{x}$

### Linear control with $T < \infty$

$$\int_0^T e^{-rt} (p-c(x))h(t) dt$$ $$\dot{x} = F(x) - h$$
$$x(0), x(T)$$ $$0 \leq h \leq h^\max$$

![]({{% asseturl %}}assets/old-blog-stuff/linconlessinft.png)

Suppose that $x(T)$ is free. Then $\lambda(T)$ = 0. Thus,
$p-c(x_T) = 0$.

Other permutations of this problem could include requirements for
salvage value or absolute stock levels at $x_T$.

Non-autonomous Problems
-----------------------

Now assume that $p=p(t)$ (non-autonomous, not independent of time).

$$H = (p(t) - c(x_t))h(t) + \lambda[F(x_t) - h(t)]$$

$$0 \leq h \leq h^\max$$

$$h = \begin{cases} h^\max &r>0 \\ h^*_t &r=0 \\ h^\min(0) &r<0 \end{cases} \tag{Switching function}$$

$$F'(x) - \frac{c'(x)F(x)}{p(t) - c(x)} = r - \frac{\dot{p}}{p(t) - c(x)}$$

What is the effect of increasing prices $(p(t))$ on stock levels
$(x^*(t))$?

2 effects:

1.  $$F'(x) - \frac{c'(x)F(x)}{p(t) - c(x)}$$

    As $p(t)$ increases, there is a reduction in $x(t)$

2.  $$r - \frac{\dot{p}}{p(t) - c(x)}$$

    As $p(t)$ increases (that is, $\dot{p}(t)$ becomes larger), it acts
    "as if" you are reducing the discount rate. Since future revenues
    are now more valuable, we leave more in stock in place to grow for
    future use, and $x$ increases.

Assume $c(x)$ = 0

$$H = p(t) h_t + \lambda_t [F(x_t) - h_t]$$

$$\max H \Rightarrow h^x_t = \begin{cases} h^\max &r>0 \\ \tilde{h} &r=0 \\ 0  &r<0 \end{cases}$$

$$\dot{\lambda} - r\lambda = - \lambda F(x) $$ $$\dot{x} = F(x) - h$$

$$r=p(t) - \lambda$$

$$\underbrace{F'(x)}_{\substack{ \text{biological rate of} \\ \text{return (dividend)}}} + \underbrace{\frac{\dot{p}}{p}}_{\text{capital gain}} = \underbrace{r}_{\text{social discount rate}}$$

This makes sense *if*

1.  Capital markets are efficient
2.  Natural resources are just capital assets

This latter point is one of the key contributions of the field.

Assume that $F(x) = 0$, or no growth or non-renewable resources. Now
$\dot{p}/p = r$. Hotelling (1931) showed that optimal extraction path of
non-renewable resource must be such that prices rise at the rate of
interest.

Now, if we define $F(x)$,

$$F(x) = ax - bx^2$$

$$F'(x) = a - 2bx$$

We plug this in to $F'(x) = r - \frac{\dot{p}}{p}$ and get
$$\tilde{x}_t = \frac{1}{2b}\left[ (a-r) + \frac{\dot{p}}{p}\right]$$

If $F'(x) = r$, then $x^*_t = \frac{a-r}{2b}$. Therefore:

$$\tilde{x}_t = x^* + \frac{1}{2b} \frac{\dot{p}}{p}$$

$$\tilde{h}_t = F(\tilde{x}) - \dot{\tilde{x}}$$

$$\tilde{h}_t = [ax^* - bx^*] + \frac{\dot{p}}{p} \left[ \frac{a}{2b} - x^*\right] - \left( \frac{\dot{p}}{p} \right)^2 \left[- \frac{1}{4b} \right] - \frac{1}{2b} \frac{\ddot{p}}{\dot{p}}$$

There is a single path of $\tilde{h}_t$ if we have $p$, $\dot{p}$, and
$\ddot{p}$.

![]({{% asseturl %}}assets/old-blog-stuff/p1.png)
![]({{% asseturl %}}assets/old-blog-stuff/p2.png)
![]({{% asseturl %}}assets/old-blog-stuff/p3.png) ![Trajectories
through time under a temporary rise in
prices]({{% asseturl %}}assets/old-blog-stuff/p4.png)

Note how, with a temporary rise in prices, we get a a period of
investment, followed by a period of disinvestment. This is because at
first we let stock build up, then we get the rest out before time is up.

### Blocked Intervals

The previous problem assumed that that harvest is inside of of the
bounds of zero and $h^\max$.

We have *blocked intervals* if for some $t$ there are constraints on the
control such that one can not follow the optimal path.

This problem as addressed by Arrow (1968), which explored investment
problems where net investment had to be positive. Around the same time,
Krutilla (1967) published "Conservation Reconsidered."

Under such conditions, our problem becomes:

$$\max_{I_t} \int_0^\infty (\underbrace{p(F(K_t)}_{\substack{\text{production} \\ \text{function}}} - c(I_t))e^{-rt} dt$$

subject to:

$$\dot{K} = I_t - \underbrace{\delta K_t}_{\text{depreciation}}$$

$$I_t \geq 0$$

We have a period of time where price rises:

![]({{% asseturl %}}assets/old-blog-stuff/steppedprice.png)

$$F'(\tilde{x}_t) = r - \frac{\dot{p}}{p}$$

$$P(t) \bigg|_{\tau_1 \leq t \leq \tau_2} = P_0 e^{\beta(t-\tau_1)}$$

$$P(t) = \int_{\tau_1}^{\tau_2} p(s) \, ds$$

![]({{% asseturl %}}assets/old-blog-stuff/steppedprice2.png)

The optimal solution would be to cause the stock to jump to optimal
levels as price changes. However, typically our harvest rates are
bounded, and the stock has a finite growth rate, so we can't change the
stock level fast enough to get that. What do we do?

For $\tau_1$, there must be some time $t_1$ in advance of of $\tau_1$
where we stop harvesting to let the stock grow so that it hits the
optimal value. However, optimally we hit this level *after* $\tau_1$.
Note that this case requires foreknowledge - you can't just myopically
follow the optimal path. Similarly, we set $h$ to $h^\max$ prior to
$\tau_2$ and hit the optimal, lower stock level some time after.

To find these switch points:

$$t_2 = t_1+ \underline{\Delta}$$ $$t_4 = t_3 + \bar{\Delta}$$

We maximize

$$\begin{aligned} 
   PV = &\int_0^{t_1} e^{-rt} + P_0 F(x^*) \, dt
     + \int_{t_1}^{t_1 + \underline{\Delta}} 0\,  dt 
     + \int_{t_1 + \underline{\Delta}}^{t_3} e^{-rt} F(x^{**}) P_0 e^{\beta(t - \tau_1)} \, dt \\
     &+ \int_{t_3}^{\tau_2} e^{-rt} h^\max P_0 e^{\beta(t - \tau_3)} \, dt 
     + \int_{\tau_3}^{t_3 + \bar{\Delta}} e^{-rt} h^{\max} P_1 \, dt 
     + \int_{t_3 + \bar{\Delta}}^{\infty} e^{-rt} P_1 F(x^*) \, dt
  \end{aligned}$$

Coming Up:
----------

-   4/18: Numerical Methods
-   4/20: Bioeconomic modeling. Read Kellner et al. (2010) and
    Sanchirico and Springborn (2010)
-   4/23: Guest lecture: Jim Wilen on real-world fishery management.
    Read Homans and Wilen (1997).
-   4/30: Uncertainty. Read Reed (1979) and, Sethi et al. (2004)
-   5/2: Guest Lecture: Mike Springborn on adaptive management

References
----------

Arrow, K. J. 1968. Optimal Capital Policy with Irreversible Investment.
Pages 1–19 *in* J. N. Wolfe, editor & translator. Value, Capital, and
Growth: Papers in Honour of Sir John Hicks.. Edinburg University Press,
Edinburg.

Homans, F. R., and J. E. Wilen. 1997. A model of regulated open access
resource use. Journal of Environmental Economics and Management 32:1–21.
Retrieved from
[http://www.sciencedirect.com/science/article/pii/S009506969690947X](http://www.sciencedirect.com/science/article/pii/S009506969690947X "http://www.sciencedirect.com/science/article/pii/S009506969690947X").

Hotelling, H. 1931. The Economics of Exhaustible Resources. Journal of
Political Economy 39:137–175. Retrieved from
[http://www.jstor.org/stable/info/1822328](http://www.jstor.org/stable/info/1822328 "http://www.jstor.org/stable/info/1822328").

Kellner, J. B., J. N. Sanchirico, A. Hastings, and P. J. Mumby. 2010.
Optimizing for multiple species and multiple values: tradeoffs inherent
in ecosystem-based fisheries management. Conservation Letters 00:1–10.
doi: 10.1111/j.1755-263X.2010.00132.x.

Krutilla, J. V. 1967. Conservation Reconsidered. The American Economic
Review 57:777–786. Retrieved from
[http://www.jstor.org/stable/1815368](http://www.jstor.org/stable/1815368 "http://www.jstor.org/stable/1815368").

Reed, W. J. 1979. Optimal escapement levels in stochastic and
deterministic harvesting models. Journal of Environmental Economics and
Management 6:350–363. doi: 10.1016/0095-0696(79)90014-7.

Sanchirico, J. N., and M. Springborn. 2010. How to Get There From Here:
Ecological and Economic Dynamics of Ecosystem Service Provision.
Environmental and Resource Economics 48:243–267. doi:
10.1007/s10640-010-9410-5.

Sethi, G., C. Costello, A. C. Fisher, W. M. Hanneman, and L. Karp. 2004.
Fishery Management Under Multiple Uncertainty. Retrieved from
[http://escholarship.org/uc/item/8122f9d2](http://escholarship.org/uc/item/8122f9d2 "http://escholarship.org/uc/item/8122f9d2").
