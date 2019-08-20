---
title: Jo Albers on Invasive Species in a River Network
author: Noam Ross
tags: [economics, invasive-species, lectures]
date: 2012-05-15

--- 


*[Jo Albers of
OSU](http://fes.forestry.oregonstate.edu/faculty/albers-heidi-j) visited
UC Davis' Agricultural and Resource Economics department to speak about
her work on optimal management on invasive species management. The work
is also part of [Kim
Hall's](http://fes.forestry.oregonstate.edu/grad-students/hall-kim)
dissertation research and was completed in conjunction Majid Taleghan,
Tom Dietterich, and Mark Crowley from OSU Engineering.*

*These are my rough notes from Dr. Albers' talk talk. Any errors or
misrepresentations are my own.*

Economics of invasive species
-----------------------------

Need to bring the biology back into bioeconomic modeling.

-   Invasives are economically costly
-   Ecologically costly
-   Most previous literature has been on
    -   Dispersal via trade
    -   Stochastic-dynamic programming looking at timing of control of
        species
    -   Steady-state spatial work

-   Recent ecological work in species competition, and non-trade
    dispersal pathways

-   Invasion as spatial and dynamic process
    -   Management of the frontier
    -   Deterministic or steady state analyses typical

Computational issues
--------------------

-   Analytical solutions for stochastic systems in space and time are
    difficult or not useful
-   But dimensional issues make computing difficulty

Overview
--------

-   Economic optimization decision framework
-   Spatial representation in a river network
-   Ecological model of species dispersal and competition
-   Computational methods

Ecological model
----------------

-   Metapopulation
-   Each reach of a river is native, invasive, or empty
-   In each time period
    -   Natural death
    -   Propogule production
    -   Dispersal
    -   Site-competition, colonization, establishment
    -   Death, dispersal, and competition is stochastic
    -   Propogules compete to establish, and then just one species
        establishes

Economic model
--------------

-   Minimize expected discounted costs
    -   sum of cost of invasive and cost of management
    -   choose timing and location of
        -   doing nothing
        -   eradication
        -   eradication and restoration

-   Subject to an *annual* dispersal rate

\# Dispersal model

Propogules flow up and down stream, but more likely downstream:

$$K_{ij} = Cu^{NU_{ij}}d^{ND_{ij}}$$

-   $C$: constant
-   $u$: upstream propogule survival rate
-   $d$: downstream propogule survival rate
-   $NU_{ij}$: number of reaches between $i$ and $j$

This follows @MekirioXXXX ecology paper on river dispersal.

$$ p_{wins} = \frac{\beta g_k}{\beta g_k + g_0}$$

-   $p_k$: probability species $k$ wins
-   $\beta$: "competitive advantage of invader over the native
-   $g_k$: number of propogules of species $k$
-   $g_0$: number of propogules of other species (not $k$)

Solution method
---------------

-   Markov decision process - no state variable representing the
    condition of the habitat
-   But even with this, there are *14 billion* different combinations
-   Estimate transition probabilities matrix by drawing samples from
    stochastic ecological simulation model

Results
-------

-   Native species
    -   Provide propogules to compete with invaders
    -   Make habitat sites unavailable for invasives

-   So, if you have more native species in the system, then eradication
    is better, because it's likely that natives will regrow
-   If you have fewer native species, you should restore
-   As directionality of flow is stronger, optimum is to eradicate and
    restore downstream

Dispersal mechanisms
--------------------

If there is no long-distance dispersal, you eradicate more than restore,
focusing on the center connected reach. But if there is long distance
dispersal, you do more restoration, and do it farther upstream.

Ecology
-------

When invasives are good site competitors, treat upstream and mostly
eradicate

When invasives are swamping with propogules, restore to get more
propogules of natives, and block invasion of a reach. Restore in the
central reaches.

Rule of thumb v. optimal
------------------------

Some traditional rules of thumb:

-   Triage - treat the most invaded reach
-   Treat leading edge
-   Treat the most connected

These are all somewhat more costly than optimal
