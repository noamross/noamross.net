---
title: "Some analytics: Does age structure matter for disease spread?"
author: "Noam Ross"
tags: [SOD]
date: 2013-06-21T13:58:39

--- 


My [first crack at an age-structured disease model with multiple
infections](http://www.noamross.net/blog/2013/6/11/multi-infection-tests.html)
yielded the interesting result that one could observe differences in
disease rates across age without any actual differences in the biology
between old and young individuals. Today I'm trying to answer a
different question analytically: does age structure matter for the
course of the disease in the whole population?

Here's the model. There are two minor changes: I no longer scale $J$ and
$A$ with $K$ in the third and fourth equations; there's no reason the
encounter rate should be tied to carrying capacity. Also, I've put
stage-specific values for all the parameters (now including $\alpha$,
$\mu$, and $\lambda$).

$$\begin{aligned}
  \frac{dJ}{dt}  &= A f_A \left(1 - \frac{J+A}{K} \right) + J  
                    \left(f_J \left(1 - \frac{J+A}{K} \right) - 
                          d_J - g\right) - \alpha_J P_J \\
  \frac{dA}{dt}  &= J g - A d_A - \alpha_A P_A \\
  \frac{dP_J}{dt}  &= \lambda_J J (P_J + P_A)  - 
                      P_J \left(d_J + \mu_J + g + \alpha_J 
                                \left(1 + \frac{P_J}{J} \right) \right) \\
  \frac{dP_A}{dt}  &= \lambda_A A (P_J + P_A)  + P_J  g - 
                      P_A \left(d_A + \mu_A + \alpha_A 
                                \left(1 + \frac{P_A}{A}  \right) \right)
\end{aligned}$$

To examine whether the age structure matters, I try to collapse this
down to a model of just one aggregated population. Let

$$\begin{aligned}
  N = J + A, && P = P_J + P_A
\end{aligned}$$

The parameters then become the population-weighted means of their
components:

$$\begin{aligned}
   d = (J d_J + A d_A)/N, && f = (J f_J + A d_A)/N \\
   \mu = (P_J \mu_J + P_A \mu_A)/P, && \alpha = (P_J \alpha_J + P_A \alpha_A)/P
\end{aligned}$$

The first two equations sum easily:

$$\frac{dN}{dt} = Nf\left(1 - \frac{N}{K}\right) - dN - \alpha P$$

The second two equations don't do quite the same thing:

$$\begin{aligned}
  \frac{dP}{dt} & = \lambda NP - \mu P - \left(d_J P_J + d_A P_A\right) - 
                     \alpha P - \left(\alpha_J \frac{P_J^2}{J} + 
                                       \alpha_A \frac{P_A^2}{A}\right) 
\end{aligned}$$

To compare this equation to a model with no age structure, I define two
terms, $\psi$ and $\phi$ which represent the differences between the
terms in parentheses in the equation above and the equivalent term in a
model without age structure. For ease of later calculations, I scale
these by $P$:

$$\begin{aligned}
    \psi P &= (d_J P_J + d_A P_A) - dP \\
           &= (d_J P_J + d_A P_A) - \frac{d_J J + d_A A}{J + A} (P_J + P_A) \\
           &= \frac{(d_J - d_A)P_J A + (d_A - d_J)P_A J}{J+A} \\
           &= \frac{(d_J - d_A)(P_J A - P_A J)}{J+A} 
  \end{aligned}$$

$$\begin{aligned}
    \phi P &= \left(\alpha_J \frac{P_J^2}{J} + \alpha_A \frac{P_A^2}{A}\right) - 
              \alpha \frac{P^2}{N}  \\
           &= \left(\alpha_J \frac{P_J^2}{J} + \alpha_A \frac{P_A^2}{A}\right) - 
              \frac{(\alpha_J P_J + \alpha_A P_A)(P_J + P_A)}{(J+A)} \\
           &=  \frac{(\alpha_J P_J A - \alpha_A P_A J)(P_J A - P_A J)}{JA(J+A)} 
  \end{aligned}$$

I substitute these into $\frac{dP}{dt}$ above to get

$$\frac{dP}{dt} = \lambda N P - (\mu + d) P - 
  \alpha P \left(1 + \frac{P}{N}\right) - (\psi + \phi)P$$

How to $\phi$ and $\psi$ modify the dynamics? $\psi$ is zero at
$d_A=d_J$ or $\frac{P_J}{J} = \frac{P_A}{A}$. It will be positive if the
class with higher infection rate also has a higher base mortality rate,
and negative otherwise. A positive $\psi$ value will decrease the growth
of the parasite population, as more-infected individuals will die at a
faster rate, removing more parasites from the population.

$\phi$ is zero at at $\frac{P_J}{J} = \frac{P_A}{A}$, but not at
$\alpha_J = \alpha_A$, meaning that dynamics should deviate from an a
model without age structure even if there is no difference in
disease-driven mortality between age classes. For $\phi$ to be positive
either both or neither of the terms in parenthesis must be greater than
zero, or

$$\left(\frac{P_J}{J} > \frac{P_A}{A}\right) \Leftrightarrow 
  \left(\alpha_J \frac{P_J}{J} > \alpha_A \frac{P_A}{A}\right)$$

Note that if $\alpha_J = \alpha_A$, this is always true. So if the
disease has an identical effect on both age classes, $\phi$ will be
positive. A positive value of $\phi$ will slow growth of the parasite
population by increasing the death rate of the more infected population,
more rapidly removing parasites. The reverse will happen when $\phi$ is
negative. The more infected population will lose fewer individuals to
disease because of a low relative $\alpha$ value, and the rate of
parasite growth will increase because these individuals will remain to
reproduce. Essentially, the value of $\phi$ represents whether the ratio
$\alpha_J/\alpha_A$ enhances or offsets the non-linear relationship
between parasite load and parasite loss caused by aggregation of
parasites.

Now the system of equations is:

$$
\begin{aligned}
  \frac{dN}{dt} &= Nf \left(1 - \frac{N}{K}\right) - dN - \alpha P \\
  \frac{dP}{dt} &= \lambda N P - (\mu + d) P - 
                   \alpha P \left(1 + \frac{P}{N}\right) - P(\psi + \phi) 
\end{aligned}
$$

Since all terms in $\psi$ and $\phi$ contain $P_X$ values in the
numerators but not denominators, as $P \rightarrow 0$, so do $\psi$ and
$\phi$. This means that the growth rate of the parasites is unaffected
by the population structure when numbers are small. We can calculate
this rate, which is the same as it would be with no population
structure:

$$\frac{dP/dt}{P}\bigg|_{P\rightarrow 0} = \lambda N - \mu - d - \alpha$$

$$N_{\text{threshold}} = \frac{\mu + d + \alpha}{\lambda}$$

(A reminder here that reducing $\alpha$ but not $\lambda$ in the tanoak
population is a losing strategy)

Setting $dN/dt = 0$, we can solve for $\frac{P}{N}$.

$$
  \frac{P}{N} = \frac{f\left(1-\frac{N}{K}\right) -d }{\alpha}
$$

Under disease-free conditions, this is easily solved for $N$:

$$N_{eq}\big|_{P=0} = {K\left(1-\frac{d}{f}\right)}$$

If the population was unstructured, we would get:

$$N_{eq}\big|_{P_{eq} > 0} = \frac{\mu + \alpha + f}{\lambda + \frac{f}{K} } $$

With the age structure, $$
\begin{aligned}
  \frac{dP}{dt} &= 0 = P\left(\lambda N - \mu - d - \alpha - 
                              \alpha \frac{P}{N}\right) -  P(\psi + \phi)\\
  N &= \frac{\mu + \alpha + f + \psi + \phi}{\lambda + \frac{f}{K}} 
\end{aligned} 
$$

Positive values of $\psi$ and $\phi$ increase the overall host
population, and following the expression for $P/N$ above, reduce the
mean infection level.
