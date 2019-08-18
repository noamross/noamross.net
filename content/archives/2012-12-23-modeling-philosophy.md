---
title: "Quals Reading: Modeling Philosophy"
author: "Noam Ross"
tags: [quals, modeling]
date: 2012-12-23T07:44:27

--- 


My examiner on theoretical ecology, [Marissa
Baskett](http://www.des.ucdavis.edu/faculty/baskett/), suggested that I
return to some basic literature on the *why* of mathematical modeling in
ecology. Here are notes on three papers:

Summary
-------

-   Modeling *purpose* must be clearly defined, as this determines
    whether to focus on generality, realisms, and/or precision
-   Complexity is as often obfuscating as illuminating
-   When prediction is a desired goal, separating calibration from
    validation is essential
-   Must test robustness of models against different mathematical
    assumptions, structures, and parameters
-   Many of these assumptions relate to the need to model at a simpler
    level than reality
-   Disclosure, clarity, and reproducibility in publication are required
    to justify model use for prediction and policy
-   Model precision is irrelevant if the model fails to address a
    question of relevance.

Notes on Readings
-----------------

-   [Levins (1966) - Modeling
    Strategies](#levins1966---modeling-strategies)
    -   [Summary](#summary-1)
    -   [Strategies](#strategies)
    -   [Robust and Non-robust
        Theorems](#robust-and-non-robust-theorems)
    -   [Sufficient parameters](#sufficient-parameters)
    -   [Clusters of models](#clusters-of-models)

-   [Aber (1997) - WhyDon't We Believe the
    Models?](#aber1997---whydont-we-believe-the-models)
-   [May (2004) - Uses and Abuses of Mathematics in
    Biology](#may2004---uses-and-abuses-of-mathematics-in-biology)
-   [Some Notes on My Approach](#some-notes-on-my-approach)
-   [References](#references)

[Levins (1966) - Modeling Strategies](#TOC)
-------------------------------------------

### [Summary](#TOC)

-   Need to sacrifice at least one of generality, realism, and precision
    in a model, usually choosing as a results of goals of prediction,
    inference, and management
-   All models have hidden assumptions and testing different structures
    is neccessary to establish robustness of results
-   Models are simplifications of many-parameter systems, which
    introduces precision through loss of information and unknown
    relations between the finer-scale processes
-   Models are not hypotheses or theories. A theory is supported by a
    group of related models that cover different phenomena and
    approaches.

### [Strategies](#TOC)

-   Population biology models complex systems, but truly accurate models
    of these process would have too many parameters, be intractable,
    computationally infeasible, and lack easily interpretable parameters
-   One cannot maximize generality, realism, and precision
    simultaneously, as they aim towards different goals of
    understanding, prediction, and management. As such, three
    strategies:
    1.  Sacrifice generality, reducing parameters to those relevant for
        short-term prediction, solve numerically, and then test
        predictions in narrow situations. (e.g. fisheries models)

    2.  Sacrifice realism, expect many unrealistic assumptions will
        cancel each other out, and build in realism piece by piece to
        understand relevant complicatons (e.g., Lotka-Volterra)

    3.  Sacrifice precision. Focus on qualitative over quantitative and
        comparative results. Use abstract, general mathematical forms.
        (e.g. MacArthur and Levins)

-   It's important to remember which parts of the model are thought to
    be realistic, and which are not
-   Test model robustness to changes in assumptions, keeping essential
    components

### [Robust and Non-robust Theorems](#TOC)

-   The MacArthur and Levins (1962) paper on optimal fitness in
    heterogenous environments is an example of strategy 3.
-   Three versions of the model have very different assumptions but
    arrive at similar results, contributing to its robustness.
-   On the other hand, the proposition that increased rate of growth
    leads to lower populations size (as in the logistic and L-V models),
    is not robust to the addition of extraneous predation, or different
    growth and decline rates. Thus, it is non-robust

### [Sufficient parameters](#TOC)

-   The many parameters of a real system are generally abstracted to a
    few, but this does not mean that the underlying fine-grained
    parameters are independent or additive
-   These may or may not have intuitive biological interpretations
-   They may be formalizations of ecological concepts, such as measures
    of niche breadth, diversity, etc. These may not have "true" forms
    and should be tested for robustness
-   They may represent variables found to be important in other studies
-   The generalization of parameters leads to imprecision in three ways:
    1.  Omit factors with small or rare efects
    2.  Are only qualitative because the exact form of functions is
        unknown
    3.  Information is lost in generalization

### [Clusters of models](#TOC)

-   Models are not hypotheses, in that they are not verifiable or
    falsifiable in a meaningful way
-   Models are limited in scope and complexity
-   A satisfactory theory is a cluster of inter-related models
-   Multiplicity of models is inevitable and primarily due to a conflict
    of methods and goals.

[Aber (1997) - WhyDon't We Believe the Models?](#TOC)
-----------------------------------------------------

-   Modeling papers aren't usually held to a set of standards, and as
    such are usually doubted. They should contain the following:

-   The structure of the model with both equations and a schematic, with
    a literature review justifying all the structure
-   All parameters and their values, their method of selection.
-   Even when the model is theoretical, empirically-justified parameters
-   Validation against *independent* data. This is distinct from
    calibration, and this must be clear.
-   Sensitivity to parameters, as well as comparison to other (simpler,
    null) model structures. This justifies the complexity of the model
-   Prediction (though this isn't always the point)
-   Calibration process is important because it reveals over-fitting
-   "Failed" models that do not validate well are useful in illuminating
    areas for future research

[May (2004) - Uses and Abuses of Mathematics in Biology](#TOC)
--------------------------------------------------------------

-   Mathematics plays different roles at different stages of the
    development of scientific knowledge. Statistical models are more
    common at observational stages, theoretical models at stages when
    patterns are being explained
-   At the latter stages, theoretical models are meant to force clarity
    on thinking, and in many cases "less is more". The relationship
    between inuitive understanding and the models should be preserved.
-   Complex computer simulation may give us less understanding than
    analytical toy models. In the case of May's work on HIV, a simple
    SIR model has outperformed a much more demographically detailed one.
-   Confidence intervals and probibalistic values lend credence to
    results from aribitray assumptions/parameters, or ignore other
    important factors. In the case of Mad Cow disease, a model suggested
    banning T-bone stake because it could save a life, despite the fact
    that 100,000 cases would be due to other factors.
-   Mathematical models in ecology only took off when authors such as
    Hutchison and MacArthur started asking testable, general questions
    in the line of physics, e.g., "How can similar species persist?"
-   Most common, but difficult to idenity, abuses of mathematics "are
    situations where mathematical models are constructed with an
    excruciating abundance of detail in some aspects, whilst other
    important facets of the problem are misty or a vital parameter is
    uncertain"

[Some Notes on My Approach](#TOC)
---------------------------------

-   Interested in prediction and inference, but generality only as much
    as required for scenario-building.
-   Best to mix model structure that improves prediction and allows for
    inference with non-parametric components (splines, S-maps)
-   Choose structural components based on (a) inferential question, (b)
    management options, (c) data availability. e.g., include population
    structure when this is what managers can modify. Exclude genetic
    information because of inability to collect.
-   Test nonparametric components against pure stochasticity
-   Include observation as a model component
-   Parse out sources of uncertainty when possible
-   (More to come on this after reading the model selection literature
    provided by [Andrew
    Latimer](http://www.plantsciences.ucdavis.edu/faculty/latimer/index.htm))

[References](#TOC)
------------------

Aber, J. D. 1997. Why Don’t We Believe the Models?. Bulletin of the
Ecological Society of America 78:232–233.

Levins, R. 1966. The strategy of model building in population biology.
American Scientist 54:421–431.

May, R. M. 2004. Uses and abuses of mathematics in biology. Science
303:790–3.
