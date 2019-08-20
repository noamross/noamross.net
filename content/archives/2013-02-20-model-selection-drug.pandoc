---
title: "Model Selection and Multi-Model Inference"
author: "Rosemary Hartman"
tags: [R, D-RUG]
date: 2013-02-20T17:14:43

---


*At [D-RUG](http://www.noamross.net/davis-r-users-group.html) this week
[Rosemary Hartman](rosehartman@gmail.com) presented a really useful case
study in model selection, based on her work on frog habitat. Here is her
code run through 'knitr'. Original code and data are posted
[here](https://gist.github.com/noamross/5001172).*

(yes, I am just doing this for the flying monkey)

*Editor's note: we're giving away flying monkey dolls from our sponsor,
[Revolution Analytics](revolutionanalytics.com), to all our D-RUG
presenters.*

So, let's say you want to find out where things are and why they are
there. But there are a lot of reasons someone might be somewhere

Let's say these things are fishermen, And we aren't sure what the
reasons are yet.

Start by making some good guesses. Maybe they all go to the big lakes.
Maybe they all go to the lakes that CDFW stocks with fish. Maybe they go
to the lakes with lots of frogs (not likely, but hey, why not try?) Once
you have all your guesses, you need to figure out which one is right.
There are two basic methods to use (or two that I have been exploring)

Method \#1: The kitchen sink

load package "glmulti"

~~~~ {.r}
library(glmulti)
~~~~

load the data

~~~~ {.r}
lakes.df2 <- read.csv("lakes.df2.csv")
~~~~

create a model that has all the predictor variables you would like to
test

~~~~ {.r}
global.model <-  glm(fish~ # number of fishermen
                       stocked+ # CDFW fish stocking y/n
                       cows+ # cattle grazing in area y/n
                       herp.rich+ # amphibian species richness
                       fish.rich+ # fish species richness
                       visitors+ # total number of visitors
                       logsize, # log of the area
                     data=lakes.df2) # data frame we got this from
~~~~

Now we will use the "glmulti" function to find the best model; this goes
through every possible model and finds the best one.

~~~~ {.r}
fish.model <- glmulti(global.model, # use the model with built as a starting point
                      level = 1,  #  just look at main effects
                      crit="aicc") # use AICc because it works better than AIC for small sample sizes
~~~~

    ## Initialization...
    ## TASK: Exhaustive screening of candidate set.
    ## Fitting...
    ##
    ## After 50 models:
    ## Best model: fish~1+cows+herp.rich+visitors+logsize
    ## Crit= 201.820969266156
    ## Mean crit= 355.848076682524

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-4.png)

    ## Completed.

~~~~ {.r}

summary(fish.model)
~~~~

    ## $name
    ## [1] "glmulti.analysis"
    ##
    ## $method
    ## [1] "h"
    ##
    ## $fitting
    ## [1] "glm"
    ##
    ## $crit
    ## [1] "aicc"
    ##
    ## $level
    ## [1] 1
    ##
    ## $marginality
    ## [1] FALSE
    ##
    ## $confsetsize
    ## [1] 100
    ##
    ## $bestic
    ## [1] 201.8
    ##
    ## $icvalues
    ##  [1] 201.8 203.4 204.7 205.0 206.4 206.5 206.5 208.3 225.4 227.7 230.6
    ## [12] 231.2 232.7 233.2 233.5 235.1 236.0 236.4 238.2 238.3 238.4 238.8
    ## [23] 240.7 240.9 258.2 259.3 260.2 261.0 261.1 261.7 262.0 262.6 265.1
    ## [34] 267.6 268.1 270.5 276.0 277.4 278.3 279.8 310.2 311.5 313.6 314.0
    ## [45] 315.4 316.2 319.0 319.7 500.6 502.0 502.5 503.0 503.8 504.8 511.3
    ## [56] 513.2 599.7 601.4 610.5 614.9 615.3 624.1 629.2 638.6
    ##
    ## $bestmodel
    ## [1] "fish ~ 1 + cows + herp.rich + visitors + logsize"
    ##
    ## $modelweights
    ##  [1] 4.485e-01 2.024e-01 1.075e-01 9.285e-02 4.464e-02 4.343e-02 4.310e-02
    ##  [8] 1.767e-02 3.399e-06 1.065e-06 2.477e-07 1.895e-07 8.849e-08 6.754e-08
    ## [15] 6.011e-08 2.630e-08 1.704e-08 1.404e-08 5.716e-09 5.287e-09 4.990e-09
    ## [22] 4.134e-09 1.618e-09 1.436e-09 2.540e-13 1.465e-13 9.334e-14 6.306e-14
    ## [29] 5.969e-14 4.361e-14 3.790e-14 2.885e-14 8.119e-15 2.304e-15 1.837e-15
    ## [36] 5.540e-16 3.542e-17 1.739e-17 1.096e-17 5.151e-18 1.300e-24 7.003e-25
    ## [43] 2.397e-25 1.957e-25 9.964e-26 6.413e-26 1.594e-26 1.123e-26 5.852e-66
    ## [50] 2.976e-66 2.260e-66 1.801e-66 1.220e-66 7.203e-67 2.847e-68 1.069e-68
    ## [57] 1.836e-87 7.713e-88 8.222e-90 9.195e-91 7.394e-91 9.070e-93 7.028e-94
    ## [64] 6.396e-96
    ##
    ## $includeobjects
    ## [1] TRUE

That showed us the best model, now lets look at some of the others

~~~~ {.r}
weightable(fish.model)
~~~~

    ##                                                                     model
    ## 1                        fish ~ 1 + cows + herp.rich + visitors + logsize
    ## 2            fish ~ 1 + cows + herp.rich + fish.rich + visitors + logsize
    ## 3              fish ~ 1 + stocked + cows + herp.rich + visitors + logsize
    ## 4                                    fish ~ 1 + cows + visitors + logsize
    ## 5                        fish ~ 1 + cows + fish.rich + visitors + logsize
    ## 6                          fish ~ 1 + stocked + cows + visitors + logsize
    ## 7  fish ~ 1 + stocked + cows + herp.rich + fish.rich + visitors + logsize
    ## 8              fish ~ 1 + stocked + cows + fish.rich + visitors + logsize
    ## 9                         fish ~ 1 + stocked + cows + herp.rich + logsize
    ## 10            fish ~ 1 + stocked + cows + herp.rich + fish.rich + logsize
    ## 11                                  fish ~ 1 + cows + herp.rich + logsize
    ## 12                                    fish ~ 1 + stocked + cows + logsize
    ## 13                                              fish ~ 1 + cows + logsize
    ## 14                      fish ~ 1 + cows + herp.rich + fish.rich + logsize
    ## 15                        fish ~ 1 + stocked + cows + fish.rich + logsize
    ## 16                                  fish ~ 1 + cows + fish.rich + logsize
    ## 17                              fish ~ 1 + herp.rich + visitors + logsize
    ## 18                                          fish ~ 1 + visitors + logsize
    ## 19                  fish ~ 1 + herp.rich + fish.rich + visitors + logsize
    ## 20                              fish ~ 1 + fish.rich + visitors + logsize
    ## 21                    fish ~ 1 + stocked + herp.rich + visitors + logsize
    ## 22                                fish ~ 1 + stocked + visitors + logsize
    ## 23        fish ~ 1 + stocked + herp.rich + fish.rich + visitors + logsize
    ## 24                    fish ~ 1 + stocked + fish.rich + visitors + logsize
    ## 25                     fish ~ 1 + cows + herp.rich + fish.rich + visitors
    ## 26                                 fish ~ 1 + cows + herp.rich + visitors
    ## 27           fish ~ 1 + stocked + cows + herp.rich + fish.rich + visitors
    ## 28                                 fish ~ 1 + cows + fish.rich + visitors
    ## 29                       fish ~ 1 + stocked + cows + herp.rich + visitors
    ## 30                                             fish ~ 1 + cows + visitors
    ## 31                       fish ~ 1 + stocked + cows + fish.rich + visitors
    ## 32                                   fish ~ 1 + stocked + cows + visitors
    ## 33                               fish ~ 1 + stocked + herp.rich + logsize
    ## 34                   fish ~ 1 + stocked + herp.rich + fish.rich + logsize
    ## 35                                           fish ~ 1 + stocked + logsize
    ## 36                               fish ~ 1 + stocked + fish.rich + logsize
    ## 37                                                     fish ~ 1 + logsize
    ## 38                                         fish ~ 1 + herp.rich + logsize
    ## 39                                         fish ~ 1 + fish.rich + logsize
    ## 40                             fish ~ 1 + herp.rich + fish.rich + logsize
    ## 41                      fish ~ 1 + stocked + cows + herp.rich + fish.rich
    ## 42                                  fish ~ 1 + stocked + cows + fish.rich
    ## 43                                            fish ~ 1 + cows + fish.rich
    ## 44                                fish ~ 1 + cows + herp.rich + fish.rich
    ## 45                                  fish ~ 1 + stocked + cows + herp.rich
    ## 46                                              fish ~ 1 + stocked + cows
    ## 47                                                        fish ~ 1 + cows
    ## 48                                            fish ~ 1 + cows + herp.rich
    ## 49                            fish ~ 1 + herp.rich + fish.rich + visitors
    ## 50                  fish ~ 1 + stocked + herp.rich + fish.rich + visitors
    ## 51                                        fish ~ 1 + herp.rich + visitors
    ## 52                                        fish ~ 1 + fish.rich + visitors
    ## 53                              fish ~ 1 + stocked + herp.rich + visitors
    ## 54                              fish ~ 1 + stocked + fish.rich + visitors
    ## 55                                                    fish ~ 1 + visitors
    ## 56                                          fish ~ 1 + stocked + visitors
    ## 57                             fish ~ 1 + stocked + herp.rich + fish.rich
    ## 58                                         fish ~ 1 + stocked + fish.rich
    ## 59                                         fish ~ 1 + stocked + herp.rich
    ## 60                                                   fish ~ 1 + fish.rich
    ## 61                                       fish ~ 1 + herp.rich + fish.rich
    ## 62                                                     fish ~ 1 + stocked
    ## 63                                                   fish ~ 1 + herp.rich
    ## 64                                                               fish ~ 1
    ##     aicc   weights
    ## 1  201.8 4.485e-01
    ## 2  203.4 2.024e-01
    ## 3  204.7 1.075e-01
    ## 4  205.0 9.285e-02
    ## 5  206.4 4.464e-02
    ## 6  206.5 4.343e-02
    ## 7  206.5 4.310e-02
    ## 8  208.3 1.767e-02
    ## 9  225.4 3.399e-06
    ## 10 227.7 1.065e-06
    ## 11 230.6 2.477e-07
    ## 12 231.2 1.895e-07
    ## 13 232.7 8.849e-08
    ## 14 233.2 6.754e-08
    ## 15 233.5 6.011e-08
    ## 16 235.1 2.630e-08
    ## 17 236.0 1.704e-08
    ## 18 236.4 1.404e-08
    ## 19 238.2 5.716e-09
    ## 20 238.3 5.287e-09
    ## 21 238.4 4.990e-09
    ## 22 238.8 4.134e-09
    ## 23 240.7 1.618e-09
    ## 24 240.9 1.436e-09
    ## 25 258.2 2.540e-13
    ## 26 259.3 1.465e-13
    ## 27 260.2 9.334e-14
    ## 28 261.0 6.306e-14
    ## 29 261.1 5.969e-14
    ## 30 261.7 4.361e-14
    ## 31 262.0 3.790e-14
    ## 32 262.6 2.885e-14
    ## 33 265.1 8.119e-15
    ## 34 267.6 2.304e-15
    ## 35 268.1 1.837e-15
    ## 36 270.5 5.540e-16
    ## 37 276.0 3.542e-17
    ## 38 277.4 1.739e-17
    ## 39 278.3 1.096e-17
    ## 40 279.8 5.151e-18
    ## 41 310.2 1.300e-24
    ## 42 311.5 7.003e-25
    ## 43 313.6 2.397e-25
    ## 44 314.0 1.957e-25
    ## 45 315.4 9.964e-26
    ## 46 316.2 6.413e-26
    ## 47 319.0 1.594e-26
    ## 48 319.7 1.123e-26
    ## 49 500.6 5.852e-66
    ## 50 502.0 2.976e-66
    ## 51 502.5 2.260e-66
    ## 52 503.0 1.801e-66
    ## 53 503.8 1.220e-66
    ## 54 504.8 7.203e-67
    ## 55 511.3 2.847e-68
    ## 56 513.2 1.069e-68
    ## 57 599.7 1.836e-87
    ## 58 601.4 7.713e-88
    ## 59 610.5 8.222e-90
    ## 60 614.9 9.195e-91
    ## 61 615.3 7.394e-91
    ## 62 624.1 9.070e-93
    ## 63 629.2 7.028e-94
    ## 64 638.6 6.396e-96

So this is the best model

~~~~ {.r}
f <- glm(fish ~ 1 + cows + herp.rich + visitors + logsize, data = lakes.df2)
summary(f)
~~~~

    ##
    ## Call:
    ## glm(formula = fish ~ 1 + cows + herp.rich + visitors + logsize,
    ##     data = lakes.df2)
    ##
    ## Deviance Residuals:
    ##    Min      1Q  Median      3Q     Max  
    ## -4.744  -1.350  -0.243   0.986  10.483  
    ##
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  -0.5262     0.8914   -0.59    0.559    
    ## cowsy        -1.5214     1.2088   -1.26    0.217    
    ## herp.rich     0.7614     0.3219    2.37    0.024 *  
    ## visitors      0.1799     0.0277    6.49  1.8e-07 ***
    ## logsize       1.0498     1.1590    0.91    0.371    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ##
    ## (Dispersion parameter for gaussian family taken to be 7.225)
    ##
    ##     Null deviance: 791.60  on 39  degrees of freedom
    ## Residual deviance: 252.87  on 35  degrees of freedom
    ##   (79 observations deleted due to missingness)
    ## AIC: 199.3
    ##
    ## Number of Fisher Scoring iterations: 2

I hate trying to interpret models based on tables of coeficients. Let's
look at some graphs

~~~~ {.r}
library(visreg)
visreg(f)
~~~~

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-71.png)
![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-72.png)
![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-73.png)
![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-74.png)

But according to theory, models with AIC within two points of each other
are basically equal. So what about the other models? Should we totally
throw them out? Looking at the table of aicc weights, there is a pretty
big jump between model 8 and model 9. So lets try averaging the top 8
models if we want to use this to make predictions, evaluate variable
importance, etc.

~~~~ {.r}
library(MuMIn)
~~~~

run the top 8 models

~~~~ {.r}
f2 <- glm(fish ~ 1 + cows + herp.rich + fish.rich + visitors + logsize, data = lakes.df2)
f3 <- glm(fish ~ 1 + stocked + cows + herp.rich + visitors + logsize, data = lakes.df2)
f4 <- glm(fish ~ 1 + cows + visitors + logsize, data = lakes.df2)
f5 <- glm(fish ~ 1 + cows + fish.rich + visitors + logsize, data = lakes.df2)
f6 <- glm(fish ~ 1 + stocked + cows + visitors + logsize, data = lakes.df2)
f7 <- glm(fish ~ 1 + stocked + cows + herp.rich + fish.rich + visitors + logsize,
    data = lakes.df2)
f8 <- glm(fish ~ 1 + stocked + cows + fish.rich + visitors + logsize, data = lakes.df2)
~~~~

average the models together

~~~~ {.r}
f.ave <- model.avg(f, f2, f3, f4, f5, f6, f7, f8)
summary(f.ave)
~~~~

    ##
    ## Call:
    ## model.avg.default(object = f, f2, f3, f4, f5, f6, f7, f8)
    ##
    ## Component models:
    ##        df logLik  AICc Delta Weight
    ## 1346    6 -93.64 201.8  0.00   0.45
    ## 12346   7 -92.96 203.4  1.59   0.20
    ## 13456   7 -93.59 204.7  2.86   0.11
    ## 146     5 -96.60 205.0  3.15   0.09
    ## 1246    6 -95.95 206.4  4.61   0.04
    ## 1456    6 -95.97 206.5  4.67   0.04
    ## 123456  8 -92.93 206.5  4.68   0.04
    ## 12456   7 -95.39 208.3  6.47   0.02
    ##
    ## Term codes:
    ##      cows fish.rich herp.rich   logsize   stocked  visitors
    ##         1         2         3         4         5         6
    ##
    ## Model-averaged coefficients:
    ##             Estimate Std. Error Adjusted SE z value Pr(>|z|)    
    ## (Intercept)  -0.5422     1.2363      1.2673    0.43    0.669    
    ## cowsy        -1.3751     1.2596      1.3019    1.06    0.291    
    ## herp.rich     0.7523     0.3274      0.3393    2.22    0.027 *  
    ## visitors      0.1841     0.0305      0.0316    5.83   <2e-16 ***
    ## logsize       0.7763     1.2689      1.3119    0.59    0.554    
    ## fish.rich     0.7784     0.7245      0.7512    1.04    0.300    
    ## stockedy     -0.7316     1.6009      1.6539    0.44    0.658    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ##
    ## Full model-averaged coefficients (with shrinkage):
    ##  (Intercept)  cowsy herp.rich visitors logsize fish.rich stockedy
    ##       -0.542 -1.375     0.603    0.184   0.776     0.240   -0.155
    ##
    ## Relative variable importance:
    ##      cows   logsize  visitors herp.rich fish.rich   stocked
    ##      1.00      1.00      1.00      0.80      0.31      0.21

Now we know the relative variable importance, all of the avereged
coefficents, etc, and can use the "predict" funciton to predict how many
fishermen will be at the next lake. Graphing these are more difficult,
so we'll skip this for now. Ask me later if you really want to know.

Model selection method \#2: Use your brain We often can discard (or
choose) some models a priori based on our knowlege of the system. It's
usually better to do it this way if you have several hundered possible
combination of variables, or want to put in some interaction terms. I
used this method for my frog data. load package bbmle

~~~~ {.r}
library(bbmle)
~~~~

load the data

~~~~ {.r}
fishlakes <- read.csv("fishlakes.csv")
~~~~

Decide on which set of models you want to use. This is hard. A
statistician who knows a lot more than I do told me so. I spent a long
time playing around with different transformations, predictor variables,
and combinations before I came up with a set of hypotheses (models) that
I was happy with.

~~~~ {.r}
m1 <- glm(treatment ~ 1 + logveg + bank.slope, family = binomial("logit"), data = fishlakes)
m2 <- glm(treatment ~ 1 + logveg + silt.total + bank.slope, family = binomial("logit"),
    data = fishlakes)
m3 <- glm(treatment ~ 1 + raca.basin + logveg + bank.slope, family = binomial("logit"),
    data = fishlakes)
m4 <- glm(treatment ~ 1 + BUBO.breeding + logveg + bank.slope, family = binomial("logit"),
    data = fishlakes)
m5 <- glm(treatment ~ 1 + BUBO.breeding + logveg + bank.slope + raca.basin,
    family = binomial("logit"), data = fishlakes)
m6 <- glm(treatment ~ 1 + raca.basin * BUBO.breeding, family = binomial("logit"),
    data = fishlakes)
m7 <- glm(treatment ~ 1 + herbacious + raca.basin + lakes.basin, family = binomial("logit"),
    data = fishlakes)
m8 <- glm(treatment ~ 1 + BUBO.breeding, family = binomial("logit"), data = fishlakes)
m9 <- glm(treatment ~ BUBO.breeding + herbacious + bank.slope + logveg, family = binomial("logit"),
    data = fishlakes)
m10 <- glm(treatment ~ BUBO.breeding * raca.basin + herbacious + lakes.basin,
    family = binomial("logit"), data = fishlakes)
m11 <- glm(treatment ~ 1 + bank.slope + logveg + BUBO.breeding:raca.basin, family = binomial("logit"),
    data = fishlakes)
~~~~

Now let's rank them via AICc

~~~~ {.r}
AICctab(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, base = T, weights = T,
    nobs = length(fishlakes))
~~~~

    ##     AICc df dAICc weight
    ## m11 35.9 5   0.0  0.79445
    ## m4  40.5 4   4.6  0.08072
    ## m9  40.9 5   5.1  0.06336
    ## m1  42.9 3   7.0  0.02424
    ## m5  43.0 5   7.1  0.02275
    ## m2  45.3 4   9.4  0.00734
    ## m3  45.3 4   9.4  0.00708
    ## m8  56.6 2  20.7  < 0.001
    ## m10 57.1 6  21.2  < 0.001
    ## m6  57.3 4  21.4  < 0.001
    ## m7  62.1 4  26.2  < 0.001

Model m11 comes out ahead by quite a bit, but we'll average the top two
models, just to show you how its done.

~~~~ {.r}
m.ave <- model.avg(m4, m11)
summary(m.ave)
~~~~

    ##
    ## Call:
    ## model.avg.default(object = m4, m11)
    ##
    ## Component models:
    ##     df logLik  AICc Delta Weight
    ## 134  5 -12.09 35.84  0.00   0.91
    ## 123  4 -15.68 40.43  4.59   0.09
    ##
    ## Term codes:
    ##               bank.slope            BUBO.breeding                   logveg
    ##                        1                        2                        3
    ## BUBO.breeding:raca.basin
    ##                        4
    ##
    ## Model-averaged coefficients:
    ##                           Estimate Std. Error Adjusted SE z value Pr(>|z|)
    ## (Intercept)                 -1.356      3.575       3.694    0.37    0.714
    ## bank.slope                 -19.935      8.233       8.503    2.34    0.019
    ## logveg                       1.783      1.366       1.409    1.26    0.206
    ## BUBO.breedingn:raca.basin   -0.965      0.973       1.006    0.96    0.337
    ## BUBO.breedingy:raca.basin    1.313      0.699       0.722    1.82    0.069
    ## BUBO.breedingy               2.077      1.055       1.090    1.91    0.057
    ##                            
    ## (Intercept)                
    ## bank.slope                *
    ## logveg                     
    ## BUBO.breedingn:raca.basin  
    ## BUBO.breedingy:raca.basin .
    ## BUBO.breedingy            .
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ##
    ## Full model-averaged coefficients (with shrinkage):
    ##  (Intercept) bank.slope  logveg BUBO.breedingn:raca.basin
    ##       -1.356    -19.935   1.783                    -0.877
    ##  BUBO.breedingy:raca.basin BUBO.breedingy
    ##                      1.193          0.190
    ##
    ## Relative variable importance:
    ##               bank.slope                   logveg BUBO.breeding:raca.basin
    ##                     1.00                     1.00                     0.91
    ##            BUBO.breeding
    ##                     0.09

~~~~ {.r}
# OK, there is a predictive model, but how good is it?
~~~~

Let's try cross-validation first. If this was a single model, we could
try using the cv.glm function from the "boot" library like this:

~~~~ {.r}
library("boot")
cost <- function(r, pi = 0) mean(abs(r - pi) > 0.5)  ## cost function necessary for binomial data
m11.cv <- cv.glm(data = fishlakes, m11, cost, K = 42)  # use leave-one-out cross validation (can use K-fold cross validation for larger data sets)
~~~~

    ## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred

Now lets see what our error rate was:

~~~~ {.r}
m11.cv$delta
~~~~

    ## [1] 0.2381 0.2438

That's not too bad.

IF we want to check the error rate of an averaged model, you need to get
more creative. I've written some code to do this for averaged models
that only have two component models. It shouldn't be too hard to adapt
this for more models.

function for leave one out cross validation of averaged models

~~~~ {.r}
Cross <- function(model1, model2, data, cost) {
    library(MuMIn)
    nobs <- nrow(data)
    model.ave <- model.avg(model1, model2)
    values <- matrix(NA, nrow = nobs, ncol = 5)
    values[, 1] <- data$treatment
    values[, 2] <- predict(model.ave, type = "response")
    CV = 0
    for (i in 1:nobs) {
        data2 <- data[-i, ]  # leave out one observasion
        model12 <- glm(model1$formula, family = model1$family, data = data2)
        model22 <- glm(model2$formula, family = model2$family, data = data2)
        model.ave2 <- model.avg(model12, model22)
        values[i, 3] <- predict(model.ave2, newdata = data[i, ], type = "response")
        values[i, 4] <- round(values[i, 3])
        if (values[i, 4] == values[i, 1])
            (values[i, 5] = 1) else values[i, 5] = 0

    }
    cv = mean(abs(values[, 3] - values[, 1]) > 0.5)
    return(cv)
}
~~~~

Use the function on the component models

~~~~ {.r}
Cross(m11, m4, fishlakes, cost)
~~~~

    ## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred

    ## [1] 0.2381

That looks reasonable

Another method to test model accurace is Area Under the Reciever
Operater Curve (AUC) This is baisically a plot of true presences versus
false presences in a presence-absense model.

Load the library "pROC"

~~~~ {.r}
library(pROC)
~~~~

Make your reciever-operater curve

~~~~ {.r}
m.roc <- roc(fishlakes$treatment, predict(m.ave, backtransform = TRUE))
plot(m.roc)
~~~~

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-22.png)

    ##
    ## Call:
    ## roc.default(response = fishlakes$treatment, predictor = predict(m.ave,     backtransform = TRUE))
    ##
    ## Data: predict(m.ave, backtransform = TRUE) in 24 controls (fishlakes$treatment 0) < 18 cases (fishlakes$treatment 1).
    ## Area under the curve: 0.949

Looks like a pretty good fit. Not too bad for the small size of the data
set.

And that's all I got. Hopefully you will find it helpful. Let me know if
there is anything else I have forgotton or done wrong.

\~ Rosemary

rosehartman@gmail.com
