---
title: "Demographic analysis using the `popbio` library and some other fun stuff"
author: "Kara Moore O'Leary"
tags: [D-RUG, R, matrix-models]
date: 2013-04-04T11:16:55

---


*This week at the [Davis R Users'
Group](http://www.noamross.net/davis-r-users-group.html) we had a great
presentation by Kara Moore O'Leary on using the [`popbio`
package](http://cran.r-project.org/web/packages/popbio/) to examine rare
plant demographics. The following is her script run through `knitr`. You
can download the original script and associated data
[here](https://gist.github.com/noamross/bf8ebdcf42fd2e0851a8). Find out
more about Kara and her work at her website
[here](http://dynamicecosciences.wordpress.com/)*

Demographic analysis using the popbio library and some other fun stuff
----------------------------------------------------------------------

**A population viability type analysis for a rare herbacious perennial
plant, *Penstemon albomarginatus*, for its only remaining California
population**

Objectives:

1)  Estimating the population growth rate - deterministic and stochastic
    methods
2)  Sensitivity and elasticity analysis - which transitions/rate are
    most variable, sensitive to change
3)  Projecting the population stochastically for different scenarios,
    observing variation in growth rate
4)  Quasi extinction probability
5)  Estimating vital rates from real data, which will never be as
    good/much the data that you would like to have for a PVA - some
    therapy for me, and maybe you too

Load popbio and some other helpful libraries. I use the dropdown menu in
RStudio to install libraries, it seems to work more consistently for my
mac than scripting the installs, sorry.\
Am I missing something basic about installing packages?

~~~~ {.r}
library(popbio)
library(plyr)
library(reshape)
~~~~

I have already done a bit of magic on my data get here, most or all of
which is suggested in the Morris and Doak 2005 book Quantitative
population biology. That book was an excellent guide to this kind of
analysis. If you want to go deep (and deeper) into this kind of analysis
you should get borrow or steal Morris and Doak 2005 and Caswell 2002
from the start! They are both really excellent and straightforward and
you'll be able to answer a lot of the questions that you have along the
way. Most of the functions in popbio are based on functions in these two
books. Many of the popbio examples are on their data and generate the
same graphs etc.

What you need for a class/stage structured demographic model:

-   a bunch of individuals (maybe in different populations)
-   annual survival rates
-   annual class or stage transition rates
-   annual fecundity, ie. probability of contribution to the juvenile
    class in the next year
-   these data for a lot of years, preferably 10 or more (but we do what
    we can with less)

The crux for plants is that its challenging to 1) count all seeds
produced annually and 2) know how many seeds really yeilds a juvenile in
any year. I am doing a bit of work on these issues from limited field
data. If you have a well behaved penguin that you can collar and track
and you know produces 2 live juveniles each season, your PVA might be a
bit simpler.

Our field data had surivival for each year, mean plant diameter, and
inflorescence count classes. From this I found the median inflorescence
number for each class MEDIAN\_INLF I assigned each plant to CLASS based
on its xDIAM\_cm. I convinced myself that this had biological meaning by
looking at the relationship between size class and survival. Whatever
classes or stages you use, you should be confident that they are
meaningful for your study species. OR use an integral projection model
(IPM) instead. These allow you to use continuous variables like size or
age rather than classes. nice abbreviated dataset

~~~~ {.r}
andre <- read.csv("karadat.csv")
str(andre)
~~~~

    ## 'data.frame':    1221 obs. of  4 variables:
    ##  $ PLANT_UNQ: Factor w/ 395 levels "1_703","1_704",..: 238 240 249 253 258 263 250 255 259 239 ...
    ##  $ YEAR     : int  1994 1994 1994 1994 1994 1994 1994 1994 1994 1994 ...
    ##  $ CLASS    : Factor w/ 6 levels "A1","A2","A3",..: 1 1 1 1 1 1 2 2 2 3 ...
    ##  $ SEEDS    : num  71.8 0 71.8 0 71.8 ...

~~~~ {.r}
head2(andre)
~~~~

    ##      PLANT_UNQ YEAR CLASS SEEDS
    ## 1          A_1 1994    A1 71.75
    ## 2          A_3 1994    A1  0.00
    ## 3         B_13 1994    A1 71.75
    ## .            .    .     .     .
    ## 1221    6_772A 2012     J  0.00

Let's look at the stages/classes

~~~~ {.r}
levels(andre$CLASS)
~~~~

    ## [1] "A1"   "A2"   "A3"   "A4"   "dead" "J"

~~~~ {.r}
# dead. After that it can be omitted.
~~~~

1. ESTIMATING FECUNDITY
-----------------------

The big challenge for plants = estimating seeds/indiv --\> juveniles
produced the next year based on a few fruit and seed counts and a lot of
inflorescence class data

### Part 1: How to estimate seed production per plant?

Multiply seeds/infl from field observations by inflorescence number.
Ideally you would have seed counts for each plant, but in the absence of
those nearly impossible data, I'm using a few seeds/fruit counts \*
fruits/infl counts from 2011 and 2012.

### Part 2: How many seeds makes an emergent juvenile?

I'll add some notes on how I made these estimates at the end of this
script, but let's start today with a dataset ready to go for popbio I'm
sure that every PVA has a hurdle or five to leap before you have the
vital rate data ready to go. I've added estimated seeds produced per
individual per year as a column in this simple dataset more on how I
generated that later if we are interested

~~~~ {.r}
str(andre)
~~~~

    ## 'data.frame':    1221 obs. of  4 variables:
    ##  $ PLANT_UNQ: Factor w/ 395 levels "1_703","1_704",..: 238 240 249 253 258 263 250 255 259 239 ...
    ##  $ YEAR     : int  1994 1994 1994 1994 1994 1994 1994 1994 1994 1994 ...
    ##  $ CLASS    : Factor w/ 6 levels "A1","A2","A3",..: 1 1 1 1 1 1 2 2 2 3 ...
    ##  $ SEEDS    : num  71.8 0 71.8 0 71.8 ...

2. PICK A STARTING POPULATION VECTOR
------------------------------------

this is the \# of individuals in each class/stage at the start of your
model. you should play around with this to see how it effects the
outcome. My model is insensitive to realistic changes in this vector.
Here are the "options", the number in each class observed annually

~~~~ {.r}
n_options <- ddply(andre, c("YEAR"), function(df) return(table(df$CLASS)))
n_options
~~~~

    ##    YEAR A1 A2 A3 A4 dead   J
    ## 1  1994  6  3  2  2    0  13
    ## 2  1995 31 17 13 11    5  81
    ## 3  1996 49 15 14  6   52  16
    ## 4  1997 36 19 10  4   30   2
    ## 5  1998 10 22 13 17    9   0
    ## 6  1999  8 16 24 11    3   0
    ## 7  2000  6 17 17  8   11   0
    ## 8  2001  1 11 16 14    6   0
    ## 9  2002 13 14  6  0    9   0
    ## 10 2003  4  8  6  0   14   1
    ## 11 2004  0  0  0  0   19   0
    ## 12 2011 22 23 12  6    0 173
    ## 13 2012  6  1  0  1  172  34

picked starting population vector from 1995, the first year with 9
observed populations

~~~~ {.r}
n95 <- c(81, 31, 17, 13, 11)
n = n95
~~~~

you can also see that I only have J class individuals for a subset of
the years. Check your data for missing bits like this. Perhaps your
collaborator is forgetting to tell you that they didn't survey for new
juveniles from 1996-2003. It happens!

3. GENERATE A TRANSITION MATRIX
-------------------------------

this matrix links each individual to its fate in the next
year/cycle/season this is why you need each individual to be "dead" for
a year, but no longer. If your raw data is like mine and only taken on
live plants, "dead" might be something you have to add. make columns for
year2, fate, and seeds2 for the whole census

~~~~ {.r}
trans <- subset(merge(andre, andre, by = "PLANT_UNQ", sort = FALSE), YEAR.x ==
    YEAR.y - 1)
head2(trans)
~~~~

    ##      PLANT_UNQ YEAR.x CLASS.x SEEDS.x YEAR.y CLASS.y SEEDS.y
    ## 3          A_1   1994      A1   71.75   1995      A2   258.3
    ## 8          A_1   1995      A2  258.30   1996    dead     0.0
    ## 13         A_3   1996      A1   71.75   1997      A2   258.3
    ## .            .      .       .       .      .       .       .
    ## 6117     9_317   2011       J   71.75   2012       J     0.0

rename rows and columns to improve clarity (I use the names used by
popbio, which are similar to Morris and Doak) I think I worked out
somewhat painfully that you need these particular column names.

~~~~ {.r}
rownames(trans) <- 1:nrow(trans)
colnames(trans)[1:7] <- c("plant", "year", "stage", "seeds", "year2", "fate",
    "seeds2")
head2(trans)
~~~~

    ##     plant year stage  seeds year2 fate seeds2
    ## 1     A_1 1994    A1  71.75  1995   A2  258.3
    ## 2     A_1 1995    A2 258.30  1996 dead    0.0
    ## 3     A_3 1996    A1  71.75  1997   A2  258.3
    ## .       .    .     .      .     .    .      .
    ## 825 9_317 2011     J  71.75  2012    J    0.0

add individual fertility estimates from the calculations above

~~~~ {.r}
seedlingtrans <- 0.00305  # This is the rate at which a seed becomes a J individual (I estimated this elsewhere, see Appendix below)
~~~~

adding in the number of J individuals produced by each individual

~~~~ {.r}
trans$J <- trans$seeds * seedlingtrans  # note that J is not an integer, which is totally fine, its a rate of J production
head2(trans)
~~~~

    ##     plant year stage  seeds year2 fate seeds2      J
    ## 1     A_1 1994    A1  71.75  1995   A2  258.3 0.2188
    ## 2     A_1 1995    A2 258.30  1996 dead    0.0 0.7878
    ## 3     A_3 1996    A1  71.75  1997   A2  258.3 0.2188
    ## .       .    .     .      .     .    .      .      .
    ## 825 9_317 2011     J  71.75  2012    J    0.0 0.2188

4. GENERATE ANNUAL MATRICES --- THE SIMPLE WAY for 3 easy years
---------------------------------------------------------------

### NAME STAGES

~~~~ {.r}
stages <- c("J", "A1", "A2", "A3", "A4")
~~~~

you must have a vector named stages in this way for your own clases or
stages used in the "stage" vector of your data frame

### SET ITERATIONS

~~~~ {.r}
it <- 100  # set the number of time steps for a deterministic model
~~~~

Make a demographic projection matrix for each year like so: 1994

~~~~ {.r}
trans94 <- subset(trans, year == 1994, c(plant, stage, fate, J))
(proj94 <- projection.matrix(trans94, stage, fate, J, sort = stages))  #this gives you a projection matrix for 1994
~~~~

    ##     
    ##            J     A1     A2     A3    A4
    ##   J  0.07692 0.1459 0.7878 0.7878 4.355
    ##   A1 0.53846 0.3333 0.3333 0.0000 0.000
    ##   A2 0.07692 0.3333 0.0000 0.0000 0.000
    ##   A3 0.00000 0.1667 0.3333 0.5000 0.000
    ##   A4 0.00000 0.0000 0.3333 0.5000 1.000

you can do a simple deterministic projection of the matrix for just this
year

~~~~ {.r}
(p94 <- pop.projection(proj94, n, it))
~~~~

    ## $lambda
    ## [1] 1.496
    ##
    ## $stable.stage
    ##       J      A1      A2      A3      A4
    ## 0.48307 0.24671 0.07983 0.06803 0.12235
    ##
    ## $stage.vectors
    ##     0     1      2      3      4      5     6      7      8      9     10
    ## J  81 82.29 142.62 223.46 338.78 502.17 745.4 1112.5 1665.3 2493.0 3729.6
    ## A1 31 59.62  69.70 108.76 167.98 256.23 383.2  570.4  850.9 1272.2 1903.7
    ## A2 17 16.56  26.20  34.21  53.44  82.05 124.0  185.1  275.7  411.7  615.8
    ## A3 13 17.33  24.12  32.41  45.74  68.68 104.4  157.4  235.5  351.4  525.0
    ## A4 11 23.17  37.35  58.15  85.76 126.44 188.1  281.7  422.1  631.7  944.7
    ##        11   12    13    14    15    16    17    18     19     20     21
    ## J  5577.3 8340 12472 18653 27896 41720 62394 93313 139553 208707 312129
    ## A1 2848.1 4260  6370  9526 14247 21307 31865 47656  71271 106588 159407
    ## A2  921.5 1378  2061  3083  4610  6895 10311 15421  23063  34492  51584
    ## A3  785.1 1174  1757  2627  3929  5876  8787 13142  19654  29393  43959
    ## A4 1412.4 2112  3159  4724  7065 10567 15803 23633  35345  52859  79053
    ##        22     23      24      25      26      27      28      29       30
    ## J  466801 698120 1044066 1561441 2335197 3492380 5222992 7811190 11681943
    ## A1 238400 356536  533214  797443 1192607 1783591 2667431 3989249  5966079
    ## A2  77146 115374  172547  258051  385925  577166  863175 1290912  1930610
    ## A3  65742  98319  147041  219905  328877  491848  735578 1100086  1645222
    ## A4 118227 176813  264431  395467  591436  884516 1322829 1978343  2958690
    ##          31       32       33       34       35        36        37
    ## J  17470807 26128282 39075876 58439515 87398601 130708056 195479056
    ## A1  8922507 13343961 19956421 29845615 44635295  66753845  99833010
    ## A2  2887304  4318077  6457855  9657977 14443886  21601401  32305748
    ## A3  2460494  3679766  5503236  8230306 12308748  18408218  27530217
    ## A4  4424838  6617520  9896762 14800999 22135477  33104480  49509056
    ##           38        39        40        41        42        43        44
    ## J  292346643 437215941 653873694 977893912 1.462e+09 2.187e+09 3.271e+09
    ## A1 149304206 223290332 333939503 499419705 7.469e+08 1.117e+09 1.671e+09
    ## A2  48314520  72256272 108062106 161611144 2.417e+08 3.615e+08 5.406e+08
    ## A3  41172526  61575137  92088048 137721310 2.060e+08 3.080e+08 4.607e+08
    ## A4  74042747 110733850 165606843 247671569 3.704e+08 5.540e+08 8.285e+08
    ##           45        46        47        48        49        50        51
    ## J  4.892e+09 7.316e+09 1.094e+10 1.636e+10 2.447e+10 3.660e+10 5.474e+10
    ## A1 2.498e+09 3.736e+09 5.588e+09 8.357e+09 1.250e+10 1.869e+10 2.795e+10
    ## A2 8.085e+08 1.209e+09 1.808e+09 2.704e+09 4.044e+09 6.049e+09 9.046e+09
    ## A3 6.890e+08 1.030e+09 1.541e+09 2.305e+09 3.447e+09 5.154e+09 7.709e+09
    ## A4 1.239e+09 1.853e+09 2.771e+09 4.144e+09 6.198e+09 9.270e+09 1.386e+10
    ##           52        53        54        55        56        57        58
    ## J  8.186e+10 1.224e+11 1.831e+11 2.738e+11 4.095e+11 6.124e+11 9.159e+11
    ## A1 4.181e+10 6.252e+10 9.351e+10 1.398e+11 2.091e+11 3.128e+11 4.678e+11
    ## A2 1.353e+10 2.023e+10 3.026e+10 4.525e+10 6.768e+10 1.012e+11 1.514e+11
    ## A3 1.153e+10 1.724e+10 2.579e+10 3.856e+10 5.767e+10 8.625e+10 1.290e+11
    ## A4 2.073e+10 3.101e+10 4.637e+10 6.935e+10 1.037e+11 1.551e+11 2.320e+11
    ##           59        60        61        62        63        64        65
    ## J  1.370e+12 2.049e+12 3.064e+12 4.582e+12 6.852e+12 1.025e+13 1.533e+13
    ## A1 6.996e+11 1.046e+12 1.565e+12 2.340e+12 3.500e+12 5.234e+12 7.827e+12
    ## A2 2.264e+11 3.386e+11 5.063e+11 7.572e+11 1.132e+12 1.694e+12 2.533e+12
    ## A3 1.929e+11 2.885e+11 4.315e+11 6.453e+11 9.651e+11 1.443e+12 2.158e+12
    ## A4 3.469e+11 5.188e+11 7.759e+11 1.160e+12 1.736e+12 2.596e+12 3.882e+12
    ##           66        67        68        69        70        71        72
    ## J  2.292e+13 3.428e+13 5.127e+13 7.667e+13 1.147e+14 1.715e+14 2.565e+14
    ## A1 1.171e+13 1.751e+13 2.618e+13 3.916e+13 5.856e+13 8.758e+13 1.310e+14
    ## A2 3.788e+12 5.665e+12 8.473e+12 1.267e+13 1.895e+13 2.834e+13 4.238e+13
    ## A3 3.228e+12 4.828e+12 7.220e+12 1.080e+13 1.615e+13 2.415e+13 3.612e+13
    ## A4 5.805e+12 8.682e+12 1.298e+13 1.942e+13 2.904e+13 4.343e+13 6.495e+13
    ##           73        74        75        76        77        78        79
    ## J  3.836e+14 5.736e+14 8.579e+14 1.283e+15 1.919e+15 2.870e+15 4.292e+15
    ## A1 1.959e+14 2.930e+14 4.381e+14 6.552e+14 9.799e+14 1.466e+15 2.192e+15
    ## A2 6.339e+13 9.480e+13 1.418e+14 2.120e+14 3.171e+14 4.742e+14 7.092e+14
    ## A3 5.402e+13 8.079e+13 1.208e+14 1.807e+14 2.702e+14 4.041e+14 6.044e+14
    ## A4 9.714e+13 1.453e+14 2.173e+14 3.249e+14 4.860e+14 7.268e+14 1.087e+15
    ##           80        81        82        83        84        85        86
    ## J  6.418e+15 9.599e+15 1.436e+16 2.147e+16 3.211e+16 4.802e+16 7.181e+16
    ## A1 3.278e+15 4.902e+15 7.331e+15 1.096e+16 1.640e+16 2.452e+16 3.668e+16
    ## A2 1.061e+15 1.586e+15 2.372e+15 3.548e+15 5.306e+15 7.936e+15 1.187e+16
    ## A3 9.039e+14 1.352e+15 2.022e+15 3.024e+15 4.522e+15 6.763e+15 1.011e+16
    ## A4 1.626e+15 2.431e+15 3.636e+15 5.437e+15 8.132e+15 1.216e+16 1.819e+16
    ##           87        88        89        90        91        92        93
    ## J  1.074e+17 1.606e+17 2.402e+17 3.592e+17 5.373e+17 8.035e+17 1.202e+18
    ## A1 5.485e+16 8.203e+16 1.227e+17 1.835e+17 2.744e+17 4.104e+17 6.137e+17
    ## A2 1.775e+16 2.654e+16 3.970e+16 5.937e+16 8.879e+16 1.328e+17 1.986e+17
    ## A3 1.513e+16 2.262e+16 3.383e+16 5.059e+16 7.566e+16 1.132e+17 1.692e+17
    ## A4 2.720e+16 4.068e+16 6.084e+16 9.099e+16 1.361e+17 2.035e+17 3.043e+17
    ##           94        95        96        97        98        99
    ## J  1.797e+18 2.688e+18 4.020e+18 6.011e+18 8.990e+18 1.345e+19
    ## A1 9.178e+17 1.373e+18 2.053e+18 3.070e+18 4.591e+18 6.867e+18
    ## A2 2.970e+17 4.442e+17 6.643e+17 9.935e+17 1.486e+18 2.222e+18
    ## A3 2.531e+17 3.785e+17 5.661e+17 8.466e+17 1.266e+18 1.894e+18
    ## A4 4.552e+17 6.807e+17 1.018e+18 1.522e+18 2.277e+18 3.405e+18
    ##
    ## $pop.sizes
    ##   [1] 1.530e+02 1.990e+02 3.000e+02 4.570e+02 6.917e+02 1.036e+03 1.545e+03
    ##   [8] 2.307e+03 3.449e+03 5.160e+03 7.719e+03 1.154e+04 1.726e+04 2.582e+04
    ##  [15] 3.861e+04 5.775e+04 8.636e+04 1.292e+05 1.932e+05 2.889e+05 4.320e+05
    ##  [22] 6.461e+05 9.663e+05 1.445e+06 2.161e+06 3.232e+06 4.834e+06 7.230e+06
    ##  [29] 1.081e+07 1.617e+07 2.418e+07 3.617e+07 5.409e+07 8.089e+07 1.210e+08
    ##  [36] 1.809e+08 2.706e+08 4.047e+08 6.052e+08 9.051e+08 1.354e+09 2.024e+09
    ##  [43] 3.027e+09 4.528e+09 6.771e+09 1.013e+10 1.514e+10 2.265e+10 3.387e+10
    ##  [50] 5.066e+10 7.576e+10 1.133e+11 1.695e+11 2.534e+11 3.790e+11 5.668e+11
    ##  [57] 8.477e+11 1.268e+12 1.896e+12 2.836e+12 4.241e+12 6.342e+12 9.485e+12
    ##  [64] 1.419e+13 2.121e+13 3.173e+13 4.745e+13 7.096e+13 1.061e+14 1.587e+14
    ##  [71] 2.374e+14 3.550e+14 5.309e+14 7.940e+14 1.187e+15 1.776e+15 2.656e+15
    ##  [78] 3.972e+15 5.940e+15 8.884e+15 1.329e+16 1.987e+16 2.972e+16 4.444e+16
    ##  [85] 6.646e+16 9.940e+16 1.487e+17 2.223e+17 3.325e+17 4.973e+17 7.437e+17
    ##  [92] 1.112e+18 1.663e+18 2.488e+18 3.720e+18 5.564e+18 8.321e+18 1.244e+19
    ##  [99] 1.861e+19 2.783e+19
    ##
    ## $pop.changes
    ##  [1] 1.300 1.508 1.523 1.514 1.497 1.492 1.493 1.495 1.496 1.496 1.496
    ## [12] 1.495 1.495 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [23] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [34] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [45] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [56] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [67] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [78] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496
    ## [89] 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496 1.496

~~~~ {.r}
(l94 <- p94$lambda)  # wow! if we looked only at 1994 based on these estimates the population would be booming!
~~~~

    ## [1] 1.496

stable.stage shows the proportion of the population in each stage class
at the mythical equilibrium, 48% of plants are juveniles in 100 years
note that the population has gone from around 200 individuals in 1994 to
2.8e+19 in 100 years, nice!

Now make some matrices for other years 1995

~~~~ {.r}
trans95 <- subset(trans, year == 1995, c(plant, stage, fate, J))
(proj95 <- projection.matrix(trans95, stage, fate, J, sort = stages))
~~~~

    ##     
    ##           J     A1     A2      A3      A4
    ##   J  0.2000 0.2626 1.0298 3.52160 6.21499
    ##   A1 0.2125 0.7419 0.4706 0.07692 0.00000
    ##   A2 0.0000 0.1290 0.4706 0.15385 0.09091
    ##   A3 0.0000 0.0000 0.0000 0.76923 0.36364
    ##   A4 0.0000 0.0000 0.0000 0.00000 0.54545

2011

~~~~ {.r}
trans11 <- subset(trans, year == 2011, c(plant, stage, fate, J))
(proj11 <- projection.matrix(trans11, stage, fate, J, sort = stages))
~~~~

    ##     
    ##           J      A1     A2     A3    A4
    ##   J  0.1573 0.98329 4.5710 8.0648 7.922
    ##   A1 0.0000 0.05556 0.3077 0.1429 0.000
    ##   A2 0.0000 0.00000 0.0000 0.0000 0.500
    ##   A3 0.0000 0.00000 0.0000 0.0000 0.000
    ##   A4 0.0000 0.00000 0.0000 0.1429 0.000

~~~~ {.r}

p95 <- pop.projection(proj95, n, it)
(l95 <- p95$lambda)  # lambda is much lower in 1995
~~~~

    ## [1] 0.9954

~~~~ {.r}

(p11 <- pop.projection(proj11, n, pi))
~~~~

    ## $lambda
    ## [1] 0.3065
    ##
    ## $stable.stage
    ##        J       A1       A2       A3       A4
    ## 0.969161 0.021632 0.009207 0.000000 0.000000
    ##
    ## $stage.vectors
    ##     0       1       2
    ## J  81 312.916 97.7480
    ## A1 31   8.810  2.1818
    ## A2 17   5.500  0.9286
    ## A3 13   0.000  0.0000
    ## A4 11   1.857  0.0000
    ##
    ## $pop.sizes
    ## [1] 153.0 329.1 100.9
    ##
    ## $pop.changes
    ## [1] 2.1509 0.3065

~~~~ {.r}
(l11 <- p11$lambda)  # and based on 2011 alone extinction is eminent. The gist here is we need lots of years of data to make any decent estimation
~~~~

    ## [1] 0.3065

~~~~ {.r}
# of what the population is really likely to do (ie more than the three
# here)
~~~~

5. DETERMINISTIC ANALAYSIS OF THESE 3 WELL BEHAVED YEARS - basic non-stochastic PVA
-----------------------------------------------------------------------------------

~~~~ {.r}
thesearethemeanprojmats <- list(proj94, proj95, proj11)  # make a list of the three matrices
(meanxprojmat <- mean(thesearethemeanprojmats))  # make a mean of the three projection matrices for deterministic analysis
~~~~

    ##     
    ##            J      A1     A2      A3     A4
    ##   J  0.14475 0.46393 2.1295 4.12473 6.1639
    ##   A1 0.25032 0.37694 0.3705 0.07326 0.0000
    ##   A2 0.02564 0.15412 0.1569 0.05128 0.1970
    ##   A3 0.00000 0.05556 0.1111 0.42308 0.1212
    ##   A4 0.00000 0.00000 0.1111 0.21429 0.5152

~~~~ {.r}

n  # recall what n is, our starting population vector, ie the # of individuals in each class at the start of the projection
~~~~

    ## [1] 81 31 17 13 11

~~~~ {.r}
(pprojme <- pop.projection(meanxprojmat, n))  # do the deterministic projection, lambda is the dominant left eigenvalue
~~~~

    ## $lambda
    ## [1] 1.089
    ##
    ## $stable.stage
    ##       J      A1      A2      A3      A4
    ## 0.61436 0.25469 0.06677 0.03730 0.02688
    ##
    ## $stage.vectors
    ##     0      1       2       3       4       5      6      7      8      9
    ## J  81 183.73 177.921 182.074 196.519 214.113 233.26 253.98 276.50 301.01
    ## A1 31  39.21  66.116  75.791  82.085  88.980  96.75 105.30 114.63 124.79
    ## A2 17  12.35  15.265  19.380  21.551  23.374  25.38  27.61  30.05  32.71
    ## A3 13  10.44   9.224  10.355  11.748  12.972  14.16  15.42  16.79  18.28
    ## A4 11  10.34   8.938   8.277   8.636   9.361  10.20  11.11  12.10  13.17
    ##        10     11     12     13     14     15     16     17     18     19
    ## J  327.68 356.72 388.33 422.74 460.21 500.99 545.38 593.72 646.33 703.61
    ## A1 135.85 147.88 160.99 175.26 190.79 207.69 226.10 246.14 267.95 291.69
    ## A2  35.61  38.77  42.20  45.94  50.02  54.45  59.27  64.53  70.24  76.47
    ## A3  19.90  21.66  23.58  25.67  27.94  30.42  33.11  36.05  39.24  42.72
    ## A4  14.33  15.60  16.99  18.49  20.13  21.92  23.86  25.97  28.27  30.78
    ##
    ## $pop.sizes
    ##  [1]  153.0  256.1  277.5  295.9  320.5  348.8  379.7  413.4  450.1  490.0
    ## [11]  533.4  580.6  632.1  688.1  749.1  815.5  887.7  966.4 1052.0 1145.3
    ##
    ## $pop.changes
    ##  [1] 1.674 1.083 1.066 1.083 1.088 1.089 1.089 1.089 1.089 1.089 1.089
    ## [12] 1.089 1.089 1.089 1.089 1.089 1.089 1.089 1.089

~~~~ {.r}
(DetLamb <- pprojme$lambda)
~~~~

    ## [1] 1.089

6. RUN STOCHASTIC ANALYSES ON THESE 3 WELL BEHAVED YEARS
--------------------------------------------------------

For a stochastic analysis, include all of the annual matrices, then make
a random draw with replacement

For a series of time step, or until stable stage distribution is
reached.

~~~~ {.r}
thesearethemeanprojmats  # our list of projection matrices
~~~~

    ## [[1]]
    ##     
    ##            J     A1     A2     A3    A4
    ##   J  0.07692 0.1459 0.7878 0.7878 4.355
    ##   A1 0.53846 0.3333 0.3333 0.0000 0.000
    ##   A2 0.07692 0.3333 0.0000 0.0000 0.000
    ##   A3 0.00000 0.1667 0.3333 0.5000 0.000
    ##   A4 0.00000 0.0000 0.3333 0.5000 1.000
    ##
    ## [[2]]
    ##     
    ##           J     A1     A2      A3      A4
    ##   J  0.2000 0.2626 1.0298 3.52160 6.21499
    ##   A1 0.2125 0.7419 0.4706 0.07692 0.00000
    ##   A2 0.0000 0.1290 0.4706 0.15385 0.09091
    ##   A3 0.0000 0.0000 0.0000 0.76923 0.36364
    ##   A4 0.0000 0.0000 0.0000 0.00000 0.54545
    ##
    ## [[3]]
    ##     
    ##           J      A1     A2     A3    A4
    ##   J  0.1573 0.98329 4.5710 8.0648 7.922
    ##   A1 0.0000 0.05556 0.3077 0.1429 0.000
    ##   A2 0.0000 0.00000 0.0000 0.0000 0.500
    ##   A3 0.0000 0.00000 0.0000 0.0000 0.000
    ##   A4 0.0000 0.00000 0.0000 0.1429 0.000

~~~~ {.r}

stochme <- stoch.growth.rate(thesearethemeanprojmats, prob = NULL, maxt = 50000,
    verbose = TRUE)
~~~~

    ## [1] Calculating stochastic growth at time 1
    ## [1] Calculating stochastic growth at time 10000
    ## [1] Calculating stochastic growth at time 20000
    ## [1] Calculating stochastic growth at time 30000
    ## [1] Calculating stochastic growth at time 40000
    ## [1] Calculating stochastic growth at time 50000

note that these stochastic approximations of lambda are in log form (not
immediately comparable to pop.project\$lambda)

~~~~ {.r}
exp(stochme$approx)  # is the analytic approximation of lambda via Tuljapakar's method
~~~~

    ## [1] 0.946

~~~~ {.r}
stochme$approx  # this is more accurate (perhaps) when there is a lot of covariation in matrix elements
~~~~

    ## [1] -0.05556

~~~~ {.r}
exp(stochme$sim)  # gives stochastic growth rate by simulation, random draws of whole
~~~~

    ## [1] 0.8884

~~~~ {.r}
stochme$sim
~~~~

    ## [1] -0.1183

Tuljapurkar’s approximation takes into account how stochastic variation
in the matrix elements affects the long-term stochastic growth rate
(Caswell 2001). It can be more accurate in cases where there is
covariation between matrix elements within the same year but may not be
as accurate when there is a high level of temporal variation (Morris and
Doak 2002, Stubben et al. 2012).

### Fun with stochastic analyses!

Its easy to give years "weights" in the stochastic model. For example,
you can increase the drought rate by weighting drought years (2011)

~~~~ {.r}
yearweight <- c(1, 1, 2)
moredrought <- stoch.projection(thesearethemeanprojmats, n, tmax = 50, prob = yearweight,
    nreps = 500)
~~~~

the output is population sizes, which are fun to graph when comparing
models

~~~~ {.r}
yearweight <- c(1, 1, 0)
nodrought <- stoch.projection(thesearethemeanprojmats, n, tmax = 50, prob = yearweight,
    nreps = 500)

par(mfrow = c(2, 1))
hist(log(apply(moredrought, 1, sum)), col = "blue", density = 50, ylim = c(0,
    150), xlim = c(-1.3, 25), xlab = "", main = "More drought")
abline(v = log10(200), lty = 3)  # puts a line at the starting population size for reference
hist(log(apply(nodrought, 1, sum)), col = "green3", density = 50, ylim = c(0,
    150), xlim = c(-1.3, 25), xlab = "", main = "No drought")
abline(v = log10(200), lty = 3)
~~~~

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-21.png)

you can get fancy and put these on the same graph too to compare
outcomes. y axis is frequency of final population size at tmax.

7. QUASI EXTINCTION BASED ON THESE 3 WELL BEHAVED YEARS
-------------------------------------------------------

Another useful way to think about populations. Since our ability to
really estimate lambda is based on the assumption of equilibrium at
stable stage, it might be more realistic to think about comparing
extinction probabilities for different scenarios that comparing lambdas.
these are based on stochastic runs

~~~~ {.r}

obsd <- stoch.quasi.ext(thesearethemeanprojmats, n, prob = c(1, 1, 1), Nx = 10,
    tmax = 50, maxruns = 10, nreps = 500, sumweight = c(1, 1, 1), verbose = FALSE)

drt <- stoch.quasi.ext(thesearethemeanprojmats, n, prob = c(1, 1, 2), Nx = 10,
    tmax = 50, maxruns = 10, nreps = 500, sumweight = c(1, 1, 1), verbose = FALSE)

par(mfrow = c(2, 1))
matplot(obsd, ylab = "Quasi-extinction probability", ylim = c(0, 1.1), type = "l",
    lty = 1, col = rainbow(10), las = 1, main = "Observed climate", xlab = "Years")
matplot(drt, ylab = "Quasi-extinction probability", ylim = c(0, 1.1), type = "l",
    lty = 1, col = rainbow(10), las = 1, main = "Double drought", xlab = "Years")
~~~~

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-22.png)

8. SENSITIVITY AND ELASTICITY
-----------------------------

SENSITIVITY is a measure of the amount of change is lambda give a small
change in a matrix element.

ELASTICITY is a measure of \`\`proportional'' effect, i.e., the effect
that a change in a given matrix element has as a proportional to the
change in that element

~~~~ {.r}
meanxprojmat
~~~~

    ##     
    ##            J      A1     A2      A3     A4
    ##   J  0.14475 0.46393 2.1295 4.12473 6.1639
    ##   A1 0.25032 0.37694 0.3705 0.07326 0.0000
    ##   A2 0.02564 0.15412 0.1569 0.05128 0.1970
    ##   A3 0.00000 0.05556 0.1111 0.42308 0.1212
    ##   A4 0.00000 0.00000 0.1111 0.21429 0.5152

for an overall look at sensitivity and elasticity use the mean
projection matrix you could do separate analyses by year or type of year
too to examine how sensitivity and elasticity vary among years

~~~~ {.r}
(eigout <- eigen.analysis(meanxprojmat))  # do the associated sensitivity analysis
~~~~

    ## $lambda1
    ## [1] 1.089
    ##
    ## $stable.stage
    ##       J      A1      A2      A3      A4
    ## 0.61436 0.25469 0.06677 0.03730 0.02688
    ##
    ## $sensitivities
    ##     
    ##           J      A1      A2      A3       A4
    ##   J  0.2255 0.09351 0.02451 0.01369 0.009867
    ##   A1 0.6930 0.28729 0.07532 0.04208 0.000000
    ##   A2 1.5373 0.63734 0.16708 0.09334 0.067253
    ##   A3 0.0000 1.13131 0.29658 0.16569 0.119377
    ##   A4 0.0000 0.00000 0.38356 0.21428 0.154386
    ##
    ## $elasticities
    ##     
    ##            J      A1      A2       A3      A4
    ##   J  0.02999 0.03985 0.04795 0.051889 0.05587
    ##   A1 0.15935 0.09948 0.02564 0.002832 0.00000
    ##   A2 0.03621 0.09023 0.02408 0.004397 0.01217
    ##   A3 0.00000 0.05773 0.03027 0.064394 0.01329
    ##   A4 0.00000 0.00000 0.03915 0.042180 0.07306
    ##
    ## $repro.value
    ##      J     A1     A2     A3     A4
    ##  1.000  3.072  6.816 12.099 15.647
    ##
    ## $damping.ratio
    ## [1] 4.215

~~~~ {.r}

colSums(eigout$sensitivities)  # this gives the cumulative sensitivity of each stage/class, fun to graph
~~~~

    ##      J     A1     A2     A3     A4
    ## 2.4559 2.1494 0.9471 0.5291 0.3509

calculate fertility and survival sums

~~~~ {.r}
(projsums <- colSums(meanxprojmat))
~~~~

    ##      J     A1     A2     A3     A4
    ## 0.4207 1.0505 2.8792 4.8866 6.9973

~~~~ {.r}
(fert_row <- meanxprojmat[1, ])
~~~~

    ##      J     A1     A2     A3     A4
    ## 0.1448 0.4639 2.1295 4.1247 6.1639

~~~~ {.r}
(surv_row <- projsums - fert_row)
~~~~

    ##      J     A1     A2     A3     A4
    ## 0.2760 0.5866 0.7496 0.7619 0.8333

can do this for sens and elas too to make a bar chart

make x where columes are name, sens and elas

for my data I'm summing elasticity and sensitivity for each class. You
could also pick the vital rates that are most meaningful in your own
analysis

~~~~ {.r}
(eigout <- eigen.analysis(meanxprojmat))
~~~~

    ## $lambda1
    ## [1] 1.089
    ##
    ## $stable.stage
    ##       J      A1      A2      A3      A4
    ## 0.61436 0.25469 0.06677 0.03730 0.02688
    ##
    ## $sensitivities
    ##     
    ##           J      A1      A2      A3       A4
    ##   J  0.2255 0.09351 0.02451 0.01369 0.009867
    ##   A1 0.6930 0.28729 0.07532 0.04208 0.000000
    ##   A2 1.5373 0.63734 0.16708 0.09334 0.067253
    ##   A3 0.0000 1.13131 0.29658 0.16569 0.119377
    ##   A4 0.0000 0.00000 0.38356 0.21428 0.154386
    ##
    ## $elasticities
    ##     
    ##            J      A1      A2       A3      A4
    ##   J  0.02999 0.03985 0.04795 0.051889 0.05587
    ##   A1 0.15935 0.09948 0.02564 0.002832 0.00000
    ##   A2 0.03621 0.09023 0.02408 0.004397 0.01217
    ##   A3 0.00000 0.05773 0.03027 0.064394 0.01329
    ##   A4 0.00000 0.00000 0.03915 0.042180 0.07306
    ##
    ## $repro.value
    ##      J     A1     A2     A3     A4
    ##  1.000  3.072  6.816 12.099 15.647
    ##
    ## $damping.ratio
    ## [1] 4.215

~~~~ {.r}
eigout$sensitivities
~~~~

    ##     
    ##           J      A1      A2      A3       A4
    ##   J  0.2255 0.09351 0.02451 0.01369 0.009867
    ##   A1 0.6930 0.28729 0.07532 0.04208 0.000000
    ##   A2 1.5373 0.63734 0.16708 0.09334 0.067253
    ##   A3 0.0000 1.13131 0.29658 0.16569 0.119377
    ##   A4 0.0000 0.00000 0.38356 0.21428 0.154386

~~~~ {.r}

(fert_row_s <- eigout$sensitivities[1, ])
~~~~

    ##        J       A1       A2       A3       A4
    ## 0.225549 0.093506 0.024513 0.013695 0.009867

~~~~ {.r}
(surv_row_s <- eigout$sensitivities[2, ] + eigout$sensitivities[3, ] + eigout$sensitivities[4,
    ] + eigout$sensitivities[5, ])
~~~~

    ##      J     A1     A2     A3     A4
    ## 2.2303 2.0559 0.9225 0.5154 0.3410

~~~~ {.r}
sensme <- t(cbind(fert_row_s, surv_row_s))


(fert_row_e <- eigout$elasticities[1, ])
~~~~

    ##       J      A1      A2      A3      A4
    ## 0.02999 0.03985 0.04795 0.05189 0.05587

~~~~ {.r}
(surv_row_e <- eigout$elasticities[2, ] + eigout$elasticities[3, ] + eigout$elasticities[4,
    ] + eigout$elasticities[5, ])
~~~~

    ##       J      A1      A2      A3      A4
    ## 0.19556 0.24744 0.11913 0.11380 0.09852

~~~~ {.r}
(survtable <- t(rbind(surv_row_s, surv_row_e)))
~~~~

    ##    surv_row_s surv_row_e
    ## J      2.2303    0.19556
    ## A1     2.0559    0.24744
    ## A2     0.9225    0.11913
    ## A3     0.5154    0.11380
    ## A4     0.3410    0.09852

~~~~ {.r}
(ferttable <- t(rbind(fert_row_s, fert_row_e)))
~~~~

    ##    fert_row_s fert_row_e
    ## J    0.225549    0.02999
    ## A1   0.093506    0.03985
    ## A2   0.024513    0.04795
    ## A3   0.013695    0.05189
    ## A4   0.009867    0.05587

~~~~ {.r}

par(mfrow = c(2, 2))
mynames <- c("Sensitivity", "Elasticity")
barplot(t(survtable[, 1:2]), beside = TRUE, las = 1, ylim = c(0, 3.5), xlab = "Stage class",
    main = "Growth and survival")
abline(h = 0)
barplot(t(ferttable[, 1:2]), beside = TRUE, las = 1, ylim = c(0, 0.25), xlab = "Stage class",
    main = "Fertility")
abline(h = 0)
legend("topright", mynames, fill = grey.colors(2))
~~~~

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-25.png)

APPENDIX A. HOW I GENERATED A FECUNDITY ESTIMATE
------------------------------------------------

I'm including this for plant folks who might like to see how I made
fecundity estimates from real data I also have developed a script to
simulate juvenile numbers and transition rates for the years in my
dataset that are missing these data, and bootstraps of the whole model.

Load up the raw-ish data

~~~~ {.r}
andre <- read.csv("D__composite9_13_2012.csv")
str(andre)
~~~~

    ## 'data.frame':    1693 obs. of  15 variables:
    ##  $ PLANT_UNQ   : Factor w/ 619 levels "1_701","1_702",..: 462 464 473 477 482 487 474 479 483 463 ...
    ##  $ YEAR        : int  1994 1994 1994 1994 1994 1994 1994 1994 1994 1994 ...
    ##  $ CLASS       : Factor w/ 6 levels "A1","A2","A3",..: 1 1 1 1 1 1 2 2 2 3 ...
    ##  $ OBS_ID      : int  1 3 20 24 11 16 21 26 12 2 ...
    ##  $ COHORT      : Factor w/ 18 levels "1","2","3","4",..: 10 10 11 11 11 11 11 11 11 10 ...
    ##  $ PLANT.NUM   : Factor w/ 460 levels "1","10","11",..: 1 23 5 9 41 168 6 11 42 12 ...
    ##  $ xDIAM_cm    : num  12 11 17 12 18 12 23 22 29 32 ...
    ##  $ SEEDS_DC    : num  26.7 26.7 26.7 26.7 26.7 ...
    ##  $ MEDIAN_INFL : int  5 0 5 0 5 5 18 18 18 18 ...
    ##  $ INFL_CLASS  : int  1 0 1 0 1 1 2 2 2 2 ...
    ##  $ MAX_INFL    : int  111 0 111 0 111 111 123 123 123 123 ...
    ##  $ OBS_INLF    : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ SEEDS_YR_INF: num  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ CAGED       : Factor w/ 2 levels "N","Y": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ WATERED     : Factor w/ 2 levels "N","Y": 1 1 1 1 1 1 1 1 1 1 ...

BEST ESTIMATE OF SEED PRODUCTION: average of seeds/fruit, weighed
average of fruits/infl where 0.14 is 1/8 drought years

~~~~ {.r}
andre$SEEDS <- andre$MEDIAN_INFL * 14.35  # = 14.35 seeds/infl
~~~~

The big crux Part 2: How many seeds makes a J plant the next year? ie
what is the transition rate or fecundity rate? observed juveniles in
each year (sadly not all years have the same \# of cohorts, so I adjust
for that below)

~~~~ {.r}
seedling_yr <- ddply(andre, c("YEAR"), function(df) return(c(sdlgs = sum(df$CLASS ==
    "J"))))  # shows the OBSERVED # of J plants each year,
~~~~

and some of these are not observation years and are omitted below

~~~~ {.r}
seedling_yr
~~~~

    ##    YEAR sdlgs
    ## 1  1994    13
    ## 2  1995    81
    ## 3  1996    16
    ## 4  1997     2
    ## 5  1998     0
    ## 6  1999     0
    ## 7  2000     0
    ## 8  2001     0
    ## 9  2002     0
    ## 10 2003     1
    ## 11 2004     0
    ## 12 2011   362
    ## 13 2012    57

seedlings for 9 cohorts based on census from each year

~~~~ {.r}
sdl94 = seedling_yr$sdlgs[(seedling_yr$YEAR == "1994")] * 9/2  # this year had only 2 cohorts
sdl95 = seedling_yr$sdlgs[(seedling_yr$YEAR == "1995")]
sdl11 = seedling_yr$sdlgs[(seedling_yr$YEAR == "2011")]
sdl12 = 0  # in 2012 observed seedlings were 0

seedling_pick = c(sdl94, sdl95, sdl11, sdl12)
seedling_pick
~~~~

    ## [1]  58.5  81.0 362.0   0.0

estimate seedlings as the mean of the 4 OBSERVED years: in the other
years seedlings where not surveyed for

~~~~ {.r}
(seedlings = mean(seedling_pick))  # = 125.375 seedlings/year on average
~~~~

    ## [1] 125.4

what's the annual total seed production rate? add up all the seeds
estimated to be produced in each year

~~~~ {.r}
seed_yr <- ddply(andre, c("YEAR"), function(df) return(c(sumseeds = sum(df$SEEDS))))
seed_yr
~~~~

    ##    YEAR sumseeds
    ## 1  1994     4434
    ## 2  1995    45834
    ## 3  1996    13302
    ## 4  1997    15426
    ## 5  1998    51976
    ## 6  1999    45030
    ## 7  2000    18913
    ## 8  2001    45576
    ## 9  2002     2597
    ## 10 2003     6257
    ## 11 2004        0
    ## 12 2011   158065
    ## 13 2012     3071

adjust so that 1994 has an estimate of all cohorts based on the observed
2 cohorts

~~~~ {.r}
seed_yr$sumseeds[(seedling_yr$YEAR == "1994")] <- (seed_yr$sumseeds[(seedling_yr$YEAR ==
    "1994")] * 9/2)
~~~~

get mean seeds/year

~~~~ {.r}
avg_seeds_p_yr <- mean(seed_yr$sumseeds)
~~~~

for each of the 4 years in which seedlings were observed, calculate an
estimate of the transition rate from seed --\> J

~~~~ {.r}
str(sdl.trans94 <- sdl94/avg_seeds_p_yr)
~~~~

    ##  num 0.00179

~~~~ {.r}
str(sdl.trans95 <- sdl95/avg_seeds_p_yr)
~~~~

    ##  num 0.00247

~~~~ {.r}
str(sdl.trans11 <- sdl11/avg_seeds_p_yr)
~~~~

    ##  num 0.011

~~~~ {.r}
sdl.trans12 <- 0  # no seedlings observed this year
~~~~

looks at the options for transition rate

~~~~ {.r}
str(seedlingtrans_pick <- c(sdl.trans94, sdl.trans95, sdl.trans11, sdl.trans12))
~~~~

    ##  num [1:4] 0.00179 0.00247 0.01105 0

pick the mean for this analysis

~~~~ {.r}
(seedlingtrans <- mean(seedlingtrans_pick))  # mean seedling transition rate  0.00305
~~~~

    ## [1] 0.003826

Now remove watered and caged plants from main dataset, these have
different survival and transition rates. I included them thus far
because we needed to get seed production estimates for them. Since they
might have contributed to the observed juveniles

~~~~ {.r}
andre <- andre[(andre$CAGED == "N"), ]
andre <- andre[(andre$WATERED == "N"), ]
head2(andre)
~~~~

    ##      PLANT_UNQ YEAR CLASS OBS_ID COHORT PLANT.NUM xDIAM_cm SEEDS_DC
    ## 1          A_1 1994    A1      1      A         1     12.0     26.7
    ## 2          A_3 1994    A1      3      A         3     11.0     26.7
    ## 3         B_13 1994    A1     20      B        13     17.0     26.7
    ## .            .    .     .      .      .         .        .        .
    ## 1675    6_772A 2012     J    608      6      772A      4.7      0.0
    ##      MEDIAN_INFL INFL_CLASS MAX_INFL OBS_INLF SEEDS_YR_INF CAGED WATERED
    ## 1              5          1      111       NA           NA     N       N
    ## 2              0          0        0       NA           NA     N       N
    ## 3              5          1      111       NA           NA     N       N
    ## .              .          .        .        .            .     .       .
    ## 1675           0          0        0        0            0     N       N
    ##      SEEDS
    ## 1    71.75
    ## 2     0.00
    ## 3    71.75
    ## .        .
    ## 1675  0.00

reduce datafile to include only PLANT\_UNQ, YEAR, CLASS and SEEDS

~~~~ {.r}
str(andre)
~~~~

    ## 'data.frame':    1221 obs. of  16 variables:
    ##  $ PLANT_UNQ   : Factor w/ 619 levels "1_701","1_702",..: 462 464 473 477 482 487 474 479 483 463 ...
    ##  $ YEAR        : int  1994 1994 1994 1994 1994 1994 1994 1994 1994 1994 ...
    ##  $ CLASS       : Factor w/ 6 levels "A1","A2","A3",..: 1 1 1 1 1 1 2 2 2 3 ...
    ##  $ OBS_ID      : int  1 3 20 24 11 16 21 26 12 2 ...
    ##  $ COHORT      : Factor w/ 18 levels "1","2","3","4",..: 10 10 11 11 11 11 11 11 11 10 ...
    ##  $ PLANT.NUM   : Factor w/ 460 levels "1","10","11",..: 1 23 5 9 41 168 6 11 42 12 ...
    ##  $ xDIAM_cm    : num  12 11 17 12 18 12 23 22 29 32 ...
    ##  $ SEEDS_DC    : num  26.7 26.7 26.7 26.7 26.7 ...
    ##  $ MEDIAN_INFL : int  5 0 5 0 5 5 18 18 18 18 ...
    ##  $ INFL_CLASS  : int  1 0 1 0 1 1 2 2 2 2 ...
    ##  $ MAX_INFL    : int  111 0 111 0 111 111 123 123 123 123 ...
    ##  $ OBS_INLF    : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ SEEDS_YR_INF: num  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ CAGED       : Factor w/ 2 levels "N","Y": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ WATERED     : Factor w/ 2 levels "N","Y": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ SEEDS       : num  71.8 0 71.8 0 71.8 ...

~~~~ {.r}
str(andre[, c(1:3, 16)])
~~~~

    ## 'data.frame':    1221 obs. of  4 variables:
    ##  $ PLANT_UNQ: Factor w/ 619 levels "1_701","1_702",..: 462 464 473 477 482 487 474 479 483 463 ...
    ##  $ YEAR     : int  1994 1994 1994 1994 1994 1994 1994 1994 1994 1994 ...
    ##  $ CLASS    : Factor w/ 6 levels "A1","A2","A3",..: 1 1 1 1 1 1 2 2 2 3 ...
    ##  $ SEEDS    : num  71.8 0 71.8 0 71.8 ...

Go back to step 2.
