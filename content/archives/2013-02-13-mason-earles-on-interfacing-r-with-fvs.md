---
title: "Mason Earles on interfacing R with the Forest Vegetation Simulator"
author: "Noam Ross"
tags: [R, D-RUG, FVS, forests]
date: 2013-02-13T15:06:42

--- 


[Mason Earles](http://jmearles.net/) gave a great presentation this week
at [Davis R Users'
Group](http://www.noamross.net/davis-r-users-group.html) about linking R
with the [Forest Vegetation Simulator
(FVS)](http://www.fs.fed.us/fmsc/fvs/). FVS is a model developed by the
US Forest Service to simulate forest growth over time. It's written in
FORTRAN and has been around since the 1970s.

FVS has recently gone open-source (its [repository is on google
code](http://code.google.com/p/open-fvs/)), and now has [an alpha-level
API which can be called from
R](http://code.google.com/p/open-fvs/wiki/rFVS). Mason showed us how he
used the API along with some text manipulation functions to make the
programs work together. Then he showed us how he used this to do some
Monte Carlo simulations to look at the effects of stochastic fire and
drought events.

Here are Mason's slides:

<iframe src="http://www.slideshare.net/slideshow/embed_code/16516293" width="800" height="600" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>


