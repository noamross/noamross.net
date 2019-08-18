---
title: "Debugging Tools in R with Michael Hannon"
author: "Noam Ross"
tags: [D-RUG, R, code]
date: 2013-04-18T13:44:59

--- 


*Today at [Davis R Users'
Group](http://www.noamross.net/davis-r-users-group.html), Michael Hannon
gave a great talk on how to use R's native debugging functions. Here are
his notes and code.*

Introduction
------------

This is a discussion of debugging techniques in R. It is based on a
paper by Roger Peng, now at Johns Hopkins University
(<http://www.biostat.jhsph.edu/~rpeng/docs/R-debug-tools.pdf>)

### Focus on five functions:

-   traceback
-   debug
-   browser
-   trace
-   recover

### Severity level

R mainly uses two ways of reporting a problem:

-   Warning: Does not stop execution
-   Error: More serious -- *does* stop execution

Example of warning:

~~~~ {.r}
> zzz <- log(-1)
~~~~

    ## Warning: NaNs produced

~~~~ {.r}
> zzz
~~~~

    ## [1] NaN

Example of error:

~~~~ {.r}
#### Define a function to be used/abused later on.
message <- function(x) {
  if(x > 0)
    print("Hello")
  else
    print("Goodbye")
  }
~~~~

Here's the function in action:

~~~~ {.r}
x <- 42
message(x)
~~~~

    ## [1] "Hello"

~~~~ {.r}

x <- log(-1)  #### Produces warning but does not stop
~~~~

    ## Warning: NaNs produced

~~~~ {.r}
message(x)
~~~~

    ## Error: missing value where TRUE/FALSE needed

### Debugging tools

### Print "call stack" with `traceback`

How did we get here? That is, what sequence of function calls led us to
the point where an error occurred? Answer: the `traceback` function can
tell us. Here's an example:

    >   message(log(-1))
    Error in if (x > 0) print("Hello") else print("Goodbye") : 
      missing value where TRUE/FALSE needed
    In addition: Warning message:
    In log(-1) : NaNs produced
    > 
    >   traceback()
    1: message(log(-1))

It's hard to get "lost" when you've got only one function to begin with,
but real life is more complicated. THe following isn't exactly
"real-life" either, but it better illustrates the point.

~~~~ {.r}
f <- function(x) {
    r <- x - g(x)
    r
}
g <- function(y) {
    r <- y * h(y)
    r
}
h <- function(z) {
    r <- log(z)
    if (r < 10) 
        r^2 else r^3
}
~~~~

You can probably guess that the log function is going to be the trouble
maker, but let's see what happens.

    > f(-1)
    Error in if (r < 10) r^2 else r^3 : missing value where TRUE/FALSE needed
    In addition: Warning message:
    In log(z) : NaNs produced
    > traceback()
    3: h(y) at #2
    2: g(x) at #2
    1: f(-1)
    > 

This shows that we started out with a call to f, which generated a call
to g, which generated a call to h. The error evidently occurred at
statement \#2 of h. Note, by the way, the following trick to view the
line numbers in a function:

    > as.list(body(h))
    [[1]]
    `{`

    [[2]]
    r <- log(z)

    [[3]]
    if (r < 10) r^2 else r^3

I.e., statement \#2 of h is, as expected, the one that involves the log
function.

### The `debug` function

The `traceback` function helps us to locate the error, but then what do
we do? Ideally, we could just stare at our code, then find and fix the
error. But it often helps to have some detailed information as to what
was going on in our code at the time of the error.

The `debug` function allows us to do just that. We can step through our
code, a line at a time, and examine variables along the way.

The syntax is:

    debug(function-name)

and to turn off debugging we use:

    undebug(function-name)

(I.e., we might find and fix a problem on the third pass through a loop
of 10000 iterations, after which we no longer need or want to debug for
the other 9997 times through the loop.)

Here's an example. The mathematical background is that we have N
observations of a random variable that we assume to be normally
distributed but with an unknown mean and variance. To estimate the
parameters we need to compute the sum of the squared differences from
the mean:

$$
SS = \sum_{n=1}^{N}(x_n - \mu)^2
$$

(Details at:
<http://en.wikipedia.org/wiki/Normal_distribution#Estimation_of_parameters>)

Here we'll focus on just one part of the calculation, computing the sum
of the squared differences. Here's an R function that will do that for
us:

~~~~ {.r}
SS <- function(mu, x) {
    d <- x - mu
    d2 <- d^2
    ss <- sum(d2)
    ss
}
~~~~

You can probably see that the function could be written much more
compactly, but we'll string it out for purposes of illustration.

Let's generate some points from a Normal(0,1) distribution:

~~~~ {.r}
set.seed(314159)  # Set the RNG seed so results are reproducible
xPoints <- rnorm(100)
~~~~

Let's run SS to get a feel for its behavior:

~~~~ {.r}
SS(1, xPoints)
~~~~

    ## [1] 202.5

~~~~ {.r}
muTest <- as.numeric(-5:5)
SSTest <- sapply(muTest, SS, xPoints)
plot(muTest, SSTest)
~~~~

![]({{< baseurl >}}/old-blog-stuff/exerciseSS.png)

Now suppose we want to examine in detail the behavior of the SS
function. First, we flag the function for debugging:

~~~~ {.r}
debug(SS)
~~~~

    > SS(1, xPoints)
    debugging in: SS(1, xPoints)
    debug at #1: {
        d <- x - mu
        d2 <- d^2
        ss <- sum(d2)
        ss
    }
    Browse[2]> n
    debug at #2: d <- x - mu
    Browse[2]> n
    debug at #3: d2 <- d^2
    Browse[2]> n
    debug at #4: ss <- sum(d2)
    Browse[2]> n
    debug at #5: ss
    Browse[2]> n
    exiting from: SS(1, xPoints)
    [1] 202.482

This isn't a particularly interesting use of the debugger, as all we did
was to step through the function a line at a time, using the 'n'
command, but it does illustrate some of the basic ideas:

-   First, when we enter the SS function, the function itself is
    printed, and execution **stops**.

-   The R prompt, '\>', changes to 'Browse[<number>]\>'

There are four basic commands you can use in the debugger:

-   **n**: execute the current line of code and step to the next

-   **c**: continue execution without stopping again

-   **Q**: quit debugging completely and to back to the top-level R
    prompt

-   **where**: similar to calling traceback

You can execute any R code at the "Browse" prompt, i.e., not just code
related to the function. The most important example of this is probably
the ls() command, which shows us what objects are defined in the current
environment (i.e., within a given function, for instance):

        Browse[2]> ls()
        [1] "mu" "x" 

        Browse[2]> mu
        [1] 1

        Browse[2]> head(x)
        [1] -0.79928868 -0.73009689  1.43687692  0.30502316 -0.39728401
        [6]  0.08889039

But the facility is completely general. Here's a trivial example of
defining something unrelated to the current function:

        Browse[2]> zzz <- sqrt(64)
        Browse[2]> zzz
        [1] 8

Here's another, somewhat more interesting session with SS:

        > SS(1, xPoints)
        debugging in: SS(1, xPoints)
        debug at #1: {
            d <- x - mu
            d2 <- d^2
            ss <- sum(d2)
            ss
        }
        Browse[2]> n
        debug at #2: d <- x - mu
        Browse[2]> n
        debug at #3: d2 <- d^2
        Browse[2]> d[1]  ## Print the value of the first element of d
        [1] -1.799289
        Browse[2]> n
        debug at #4: ss <- sum(d2)
        Browse[2]> hist(d2)
        Browse[2]> n
        debug at #5: ss
        Browse[2]> print(ss)
        [1] 202.482
        Browse[2]> ls()
        [1] "d"  "d2" "mu" "ss" "x" 
        Browse[2]> where
        where 1: SS(1, xPoints)
        
        Browse[2]> y <- x^2  ## Create new object
        Browse[2]> ls()
        [1] "d"  "d2" "mu" "ss" "x"  "y" 
        Browse[2]> head(y)
        [1] 0.638862388 0.533041463 2.064615286 0.093039131 0.157834589
        [6] 0.007901501
        Browse[2]> c  ## Execute the rest of the function w/o stopping
        exiting from: SS(1, xPoints)
        [1] 202.482

        > undebug(SS)  ## No need for further debugging

Note the explicit use of the `print` function in the above. At an
interactive prompt, R will "autoprint" the value of a variable when it
is used, so use of the `print` function is optional. But what if, for
instance, you had `n` as a parameter in your function? Then to examine
`n` you'd need to say explicitly:

    print(n)

One final thing: if you want to debug a function, you have to say so
**before** you call the function. This is more or less obvious.

Perhaps not so obvious is the fact that you can flag functions for
debugging "on the fly". I.e., you can turn on debugging for other
functions while you're in the process of debugging a given function.
Example later.

### Explicit Calls to Browser

Rather than flagging a function for debugging and then stepping through
the function a line at a time, it is sometimes convenient to modify your
code in such a way as to trigger debugging at the point where you
suspect the trouble lies.

Consider the following modified version of SS, for instance. We might
feel confident that the trouble occurs in our function only after `d2`
has been calculated, so we insert a call to the function `browser` at
the point where we want to start, well, browsing.

~~~~ {.r}

SS <- function(mu, x) {
    d <- x - mu
    d2 <- d^2
    browser()
    ss <- sum(d2)
    ss
}
~~~~

        > SS(2, xPoints)
        Called from: SS(2, xPoints)
        Browse[1]> ls()
        [1] "d"  "d2" "mu" "x" 
        Browse[1]> print(mu)
        [1] 2
        Browse[1]> mean(x)
        [1] -0.05553729
        Browse[1]> n
        debug at #5: ss <- sum(d2)
        Browse[2]> c
        [1] 513.5895

One drawback to this mode of operation is that you have to remember to
*remove* the call to `browser` before you put the code into production.

One real advantage of this approach is that you can use it to debug
"anonymous" functions, as:

        sapply(1:50, function_with_no_name {
            .
            .
            .
            browser()
            .
            .
            .
        })

### Inserting Code with `trace`

As with `debug`, the function `trace` allows you to debug code, but
`trace` is much more general and sophisticated. The simplest uses of
`trace` don't appear much different from the corresponding use of
`debug`, although some differences are evident.

The following example is taken from the book *Software for Data
Analysis* by John M. Chambers. Suppose we have defined three functions,
called `Fn1`, `Fn2`, `Fn3`. (The details of the function don't matter
for the purposes of this example.) Then we might use `trace` as follows:

        trace(Fn1, recover)
        trace(Fn2, exit = browser)
        trace(Fn3, browser, exit = browser)

Here, `browser` is the same function we saw above. The function
`recover` lets us examine the full sequence of calls that brought us to
a given point in our code, and then browse inside *any* of the functions
in the sequence.

After the above calls to `trace`, all future calls to `Fn1` will begin
with a call to `recover()`; calls to `Fn2` will invoke `browser()` just
before the function exits; calls to `Fn3` will invoke `browser()` on
both entry to the function and exit from the function. (In the case of
`Fn3` we might get tired of stepping through the function and hit `c`
(continue), but stop before we leave the function, juuust to make sure
everything is still OK before we lose all the local variables in the
function.)

The `trace` function works by modifying the code of the function, then
saving the modified function, and running the modified version when you
invoke the function. The original code is not touched, and you can
restore the original behavior by executing:

        untrace(Fn1)
        etc.

Here are some examples with our `SS` function:

~~~~ {.r}
trace(SS, recover)
SS(1, xPoints)
untrace(SS)

trace(SS, browser)
SS(2, xPoints)
untrace(SS)

trace(SS, exit = browser)
SS(3, xPoints)
untrace(SS)
~~~~

The paper by Roger Peng, mentioned at the beginning of this note, has an
example in which he minimizes the negative log-likelihood of a
statistical model, using an R function that he calls `nLL`. The details
of the discussion are somewhat complicated and will be omitted here.

The salient point is that the procedure in question involves many
iterations, and is plagued by the same problem that we discussed above:
the log of a negative number produces a so-called `NaN` ("not a number")
in *some* of the iterations. We would hope not to get NaN's in our
calculations, and we might, therefore, want to examine in detail the
situations in which a NaN is produced. But there might be tens or
hundreds or thousands of iterations, most of which do not generate
NaN's. Stepping through all the iterations would take a lifetime. What
to do?

The solution is to trace the function using some of its more
sophisticated options:

    trace("nLL", quote(if(any(is.nan(lz))) { browser() }), at=4, print=F)

Here:

-   `nLL` is the name of the function to be traced

-   the stuff inside the `quote` function is code to be inserted
    (dynamically) into the nLL function; it could also be just the name
    of a function (as in our introductory examples)

-   `at` is the line number at which to insert the code, which the
    author determines from `as.list(body(nLL))` (see above)

-   `print=FALSE` just suppresses the printing of a descriptive message

This is as if we had written:

        if(any(is.nan(lz))) {
            browser()
        }

at line 4 of the `nLL` function.

Here's a simpler example using the functions we mentioned at the
beginning of the discussion:

~~~~ {.r}

trace(h, quote(if (is.nan(r)) {
    browser()
}), at = 3)
f(7)
f(-3)
untrace(f)
~~~~

Finally, if using the quoted expression for the second argument of
`trace` seems too intimidating. let's note that `trace` has an `edit`
argument. If you call trace as:

        trace (someFn, ..., edit=TRUE)

you will dropped into an editor, where you can edit your code to your
heart's content before the (temporarily modified) function executes.
BTW, you can also supply the name of an editor here, as:

        trace (someFn, ..., edit="/usr/bin/vim")

### *Editor's Addendum: A quick way to enable bugging everywhere*

*One way to get in the habit of debugging is to drop this into your
`.Rprofile` file or run it at the start of your R session:*

    options(error=utils::recover)

*This will automatically invoke `recover()` every time your code gives
an error, allowing you to view the stack of function calls and enter the
browser mode in any of the functions. For instance:*

    > f("a")
    Error in log(z) : non-numeric argument to mathematical function

    Enter a frame number, or 0 to exit   

    1: f("a")
    2: #2: g(x)
    3: #2: h(y)

*Now selecting any of these will start browser mode within those
functions. If you don't need to use the browser (for instance, if the
source of the error is obvious), just enter `0` and move on.*
