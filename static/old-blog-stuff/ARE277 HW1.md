% ARE277 Homework 1 - Population Dynamics and Open-Access
% Noam Ross
% 2012-04-03 19:41:31

# Problem 1: Generalized Logistic #

*The generalized logistic population growth model is:*

$$\frac{dN}{dt} = F(N) = rN^{\alpha} - \frac{r}{K} N^{1+\alpha}$$

***(a)** Plot the growth function with varying values of $\alpha$, and discuss the differences with special attention as $N$ goes to zero.*

<!-- begin.rcode general, caption=Generalized logistic with varying $\alpha$
  gen.logit <- function(N, r, K, alpha) {
    dNdt = r*N^alpha - (r/K)*N^(1+alpha)
  }
  K <- 1
  r <- 1
  alphas <- seq(from=0.2, to=2, by=0.2)
  plot(0,0,pch="", xlim=c(0,1.2), ylim=c(-0.2,0.7), xlab="Population (N)", ylab="Population growth rate (dN/dt)", main="The Generalized Logistic Model with r=K=1" )
  for (alpha in alphas) {
    curve(gen.logit(x,r,K,alpha), add=TRUE)
  }
  text(0.2,0.6,expression(alpha==0.2))
  text(0.5, 0.265, expression(alpha==1))
  text(0.7, 0.125, expression(alpha==2))
  end.rcode -->
  
For $\alpha=1$, the generalized logistic is the normal logistic, which exhibits zero growth at 0 and $K$ maximum growth at $K/2$, negative growth above $K$, and has a symmetric form.  As $\alpha$ goes below 1, zero growth still occurs at 0 and $K$, but maximum growth occurs at lower population levels and the curve is no longer symmetric.  For $\alpha$ values above 1, maximum growth occurs at higher values, and the population exhibits a weak Allee effect (depensation) as $N$ approaches zero.
  
***(b)** Solve for the stock level that corresponds to maximum sustainable yield as a function of the parameters.*

MSY corresponds to the population level with maximum growth rate.  We find the maximum by taking the next derivative and setting it to zero:

$$\frac{d^2N}{dt^2} = 0 = \alpha r N^{\alpha-1} - (1+\alpha) \frac{r}{K} N^{\alpha}$$

$$N_{MSY} = \frac{\alpha K}{1 + \alpha}$$

***(c)** Using the following parameters, plot in $(t,N)$ space the transitional dynamics of the generalized logistic and compare paths that result from different values of $\alpha$.*

<!-- begin.rcode paths
  require(deSolve)
  gen.logit2 <- function(t, N, parms) {
    with(parms, {
      dNdt = r*N^(alpha) - (r/K)*N^(1+alpha)
      return(list(dNdt))
    })
  }
  r <- 1.2
  K <- 10
  times <- seq(from=0, to=50, by=1)
  alphas <- c(0.5, 1, 2)
  N = 1
  Npath=list()
  for (i in 1:3) {
  Npath[[i]] <- lsoda(N, times, gen.logit2, parms=list(r=r, K=K, alpha=alphas[i]))
  }
  plot(0,0,pch="",xlim=c(0,50), ylim=c(0,11), xlab="Time", ylab="Population", main="Dynamics of the General Logistic")
  for (i in 1:3) {
    lines(times, Npath[[i]][,2])
  }
  text(3,10.2,expression(alpha==2))
  text(7, 9.5, expression(alpha==1))
  text(12, 9, expression(alpha==0.5))
  end.rcode -->  

As $\alpha$ increases, the population growth rate and rate at which the population approaches the equilibrium $K$ increases

# Problem 2: Open Access #

$$\begin{aligned} 
   \frac{dN}{dt} &= rN^{\alpha} - \frac{r}{K}N^{1+\alpha} - qEN \\
   \frac{dE}{dt} &= \delta E [pqN - (c + \theta)]    
  \end{aligned}$$
  
***(a)** For $\alpha=2$, plot the phase diagram and determine the directional/velocity vectors in each quadrant

$$\begin{aligned} 
   0 &= rN^2 - \frac{r}{K}N^3 - qEN \\
   &= rN - \frac{r}{K}N^2 - qE \\
   E &= \frac{r}{q} N - \frac{r}{qK} N^2  
  \end{aligned}$$

This is a parabola with roots at 0 and $K$ and a maximum at $(\frac{1}{2} K, \, \frac{rK}{4q})$. If fishing effort is above this level, the stock will decrease. Below it, stock will increase

$$\begin{aligned} 
   0 = \delta E[pqN - (c+\theta)] \\
   N = \frac{c+\theta}{pq}
  \end{aligned}$$

This is a vertical line at $\frac{c+\theta}{pq}$.  At higher stock levels, there will be entry.  At lower stock levels, effort will decrease. 

![]({{< baseurl >}}/old-blog-stuff/generallogisticphase.png)

***(b)** Determine the trajectories at the $E$ and $N$ axes

$$\begin{aligned} 
   \frac{dN}{dt}\bigg|_{N=0} &= 0 \\
   \frac{dE}{dt}\bigg|_{N=0} &= -\delta E (c+\theta) \\
   \frac{dE}{dN}\bigg|_{N=0} &= -\infty
  \end{aligned}$$

As the fish stock approaches zero, the trajectory goes down vertically.  The species can not go extinct in this case.

$$\begin{aligned} 
   \frac{dN}{dt}\bigg|_{E=0} &= rN^2 - \frac{r}{K}N^3 \\
   \frac{dE}{dt}\bigg|_{E=0} &= 0 \\
   \frac{dE}{dN}\bigg|_{E=0} &= 0
  \end{aligned}$$
  
As the fishing effort approaches zero, the trajectory is horizontal.  The industry does not crash to zero.

***(c)** Solve for the steady state of $E$ and $N$

$$\begin{aligned} 
   0 &= rN^{\alpha} - \frac{r}{K}N^{\alpha+1} - qEN  \\
   N &= \frac{c+\theta}{pq} \\
   E &= \frac{r}{q} \left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left(1 - \frac{c+\theta}{Kpq}\right)   
  \end{aligned}$$
  
The equilibrium stock level $N$ is independent of $\alpha$.

***(d)** Determine the stability conditions of the steady state.

$$\begin{aligned} 
   \frac{d\dot{N}}{dN} &= \alpha rN^{\alpha-1} - (\alpha +1) \frac{r}{K} N - qE \\
   \frac{d\dot{N}}{dE} &= -qN \\
   \frac{d\dot{E}}{dN} &= \delta pq E \\
   \frac{d\dot{E}}{dE} &= pqN - (c+\theta)
  \end{aligned}$$

  $$\begin{aligned} 
     \frac{d\dot{N}}{dN}\big|_{N_0,E_0} &= \alpha rN^{\alpha-1} - (\alpha +1) \frac{r}{K} N - rN^{\alpha-1}(1-N) \\
     &= rN^{\alpha-1} \left(\alpha - \alpha \frac{N}{K} - \frac{N}{K} + 1 - N\right)  \\
     &= r\left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left[\left(\frac{c+\theta}{pq}\right)\left(1 - \frac{\alpha - 1 }{K}\right) + \alpha + 1\right] \\
     \frac{d\dot{N}}{dE}\big|_{N_0,E_0} &= -\frac{c+\theta}{p}  \\
     \frac{d\dot{E}}{dN}\big|_{N_0,E_0} &= \delta pr \left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left(1 - \frac{c+\theta}{Kpq}\right)\\
     \frac{d\dot{E}}{dE}\big|_{N_0,E_0} &= 0
    \end{aligned}$$

$$\begin{aligned} 
  0 &= \det \begin{bmatrix} r\left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left[\left(\frac{c+\theta}{pq}\right)\left(1 - \frac{\alpha - 1}{K}\right) + \alpha + 1\right] - \lambda && -\frac{c+\theta}{p} \\
\delta pr \left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left(1 - \frac{c+\theta}{Kpq}\right) && -\lambda
 \end{bmatrix} \\
 &= \lambda r\left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left[\left(\frac{c+\theta}{pq}\right)\left(1 - \frac{\alpha - 1}{K}\right) + \alpha + 1\right] - \lambda^2 + \delta r (c +\theta) \left(\frac{c+\theta}{pq}\right)^{\alpha-1} \left(1 - \frac{c+\theta}{Kpq}\right)
\end{aligned}$$

It might make more sense to leave things in terms of $N_0$ here, as it's a constant anyway:

$$0 = \lambda rN_0^{\alpha-1}\left[N_0\left(1- \frac{\alpha - 1}{K}\right) + \alpha + 1 \right] - \lambda^2 + \delta pqr N_0^{\alpha} \left(1- \frac{N_0}{K} \right)$$
