---
title: "Ryan Peek on using xts and ggplot for time-series data"
author: "Noam Ross"
tags: [R, xts, ggplot, D-RUG]
date: 2013-02-06T15:44:25

--- 


At [Davis R Users'
Group](http://www.noamross.net/davis-r-users-group.html) today, [Ryan
Peek](http://watershed.ucdavis.edu/people/ryan-peek) gave a presentation
on how he takes data from his field instruments and visualizes it in R.
Here are his notes. The original \*.Rmd file and data can be found
[here](https://gist.github.com/noamross/4727029)

SHORT HOW-TO ON USING XTS AND GGPLOT FOR TIME SERIES DATA
---------------------------------------------------------

XTS is a very helpful package when working with time series data. I work
with temperature and flow data frequently, so the ability to work with
timeseries, and particularly to shift intervals (from 15 min to hourly
or daily) can be very handy. Once data has been re-worked, **ggplot2**
is a great package to plot data of all types.

First read in some data and format to POSIXlt. There are 2 types of
time, POSIXlt and POSIXct. POSIXct is generally what ggplot uses and is
based on seconds, while POSIXlt can be re-classed into individual
components quite easily, but year zero is calculated from 1900 (so 2011
would be year 111).

### Read in some data

~~~~ {.r}
## READ IN FILE
inputfile <- "Air_Water_loggers_15min_example.csv"
file <- read.csv(inputfile, stringsAsFactors = FALSE)
## FORMAT TIME COLUMN TO POSIXlt
file$time15 <- strptime(file$time15, format = "%m/%d/%Y %H:%M")
## ROUND TO NEAREST HOUR
file$time15hr <- round(file$time15, "hour")

## TO VIEW TIME CLASSES USE 'str'
str(unclass(file$time15))
~~~~

    ## List of 9
    ##  $ sec  : num [1:6096] 0 0 0 0 0 0 0 0 0 0 ...
    ##  $ min  : int [1:6096] 15 30 45 0 15 30 45 0 15 30 ...
    ##  $ hour : int [1:6096] 0 0 0 1 1 1 1 2 2 2 ...
    ##  $ mday : int [1:6096] 30 30 30 30 30 30 30 30 30 30 ...
    ##  $ mon  : int [1:6096] 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ year : int [1:6096] 112 112 112 112 112 112 112 112 112 112 ...
    ##  $ wday : int [1:6096] 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ yday : int [1:6096] 120 120 120 120 120 120 120 120 120 120 ...
    ##  $ isdst: int [1:6096] 1 1 1 1 1 1 1 1 1 1 ...

Notice that the **\$time15** column classes exist for all values even
though data only exists to minutes. Also years are "112" and "111"
instead of 2011 and 2012. Month and hour (24 hour clock) start at zero.

### Load the XTS package and make into an xts object

~~~~ {.r}
library(xts)
## MAKE XTS

## make XTS format using time column for the data columns of interest
df.xts <- xts(x = file[, c(2:7)], order.by = file[, "time15"])
head(df.xts)  # notice the row names are now the 'time15' column
~~~~

    ##                     RUB_sol MFA_sol NFA_sol NFY_sol SFY_baro_air
    ## 2012-04-30 00:15:00   11.93   12.69   11.26    8.19         9.43
    ## 2012-04-30 00:30:00   11.88   12.63   11.28    8.18         9.25
    ## 2012-04-30 00:45:00   11.83   12.57   11.26    8.21         9.03
    ## 2012-04-30 01:00:00   11.78   12.51   11.23    8.22         8.82
    ## 2012-04-30 01:15:00   11.73   12.46   11.17    8.23         8.60
    ## 2012-04-30 01:30:00   11.68   12.40   11.15    8.24         8.42
    ##                     NFA_baro_air
    ## 2012-04-30 00:15:00        13.13
    ## 2012-04-30 00:30:00        12.93
    ## 2012-04-30 00:45:00        12.74
    ## 2012-04-30 01:00:00        12.61
    ## 2012-04-30 01:15:00        12.46
    ## 2012-04-30 01:30:00        12.34

Notice that the row names exist as the time series data from the
*time15'* column.

#### Then run any function along a given time interval using XTS functions

-   apply.daily - makes daily data
-   apply.monthly - monthly
-   period.apply(data,endpoints(data,on="interval",1)) \# Using interval
    of your choice

When using Rstudio, you can hit tab at any time to view potential
options for a given command or function. Try *apply*+TAB.

~~~~ {.r}
# MAKE DAILY AVG, MEAN, AND MAX
dAvg <- apply.daily(df.xts, function(x) apply(x, 2, mean))  # daily mean
dMin <- apply.daily(df.xts, function(x) apply(x, 2, min))  # daily min
dMax <- apply.daily(df.xts, function(x) apply(x, 2, max))  # daily max

# OR MAKE HOURLY (OR PREFERRED TIME INTERVAL)
hrAvg <- period.apply(df.xts, endpoints(df.xts, on = "hours", 1), function(x) apply(x, 
    2, mean))  # avg over 1 hour period

# RENAME COLUMN NAMES TO MAKE RECOMBINING EASIER
names(dAvg) <- sub("_sol$", ".avg", names(dAvg))
names(dAvg) <- sub("_air$", ".avg", names(dAvg))
names(dMax) <- sub("_sol$", ".max", names(dMax))
names(dMax) <- sub("_air$", ".max", names(dMax))
names(dMin) <- sub("_sol$", ".min", names(dMin))
names(dMin) <- sub("_air$", ".min", names(dMin))

Day <- data.frame(datetime = index(dAvg), dAvg[, c(1:6)], dMax[, c(1:6)], dMin[, 
    c(1:6)], row.names = NULL)

# WRITE NEW FILE TO A CSV write.csv(Hour,
# file='Airwatertemps_hourly_example.csv', row.names=FALSE)
~~~~

When making a dataframe from an xts object, important to note that you
must use *index()* instead of row.names to pull the time stamp/date into
a new dataframe.

#### Make a ggplot of daily temperatures showing a max and min using *geom\_ribbon*

~~~~ {.r}
library(scales)
library(ggplot2)
~~~~

This plot is complex, and code is provided to view as you like. Main
components are: \* **ggplot**: this sets the data and x acess \*
**geom\_line**: this is to plot lines, custom colors are set by
including color *within* the aes call \* **geom\_ribbon**: this is to
plot the filled max and min ribbon in the background
\***scale\_color/fill\_manual**: this allows you to define custom colors
for each geom, must match exactly with the color="" or fill=""

~~~~ {.r}
RUB <- ggplot(Day, aes(x = datetime)) + geom_line(aes(y = NFA_baro.avg, color = "AIR"), 
    size = 1, linetype = 1, alpha = 1) + geom_ribbon(aes(ymax = NFA_baro.max, 
    ymin = NFA_baro.min, fill = "AIR Max/Min"), colour = "darkorange", linetype = 3, 
    alpha = 0.4) + geom_ribbon(aes(ymax = RUB.max, ymin = RUB.min, fill = "RUB Max/Min"), 
    colour = "darkgreen", linetype = 3, alpha = 0.7) + geom_line(aes(y = RUB.avg, 
    color = "RUB-Water"), size = 0.9, linetype = 1, alpha = 1) + geom_ribbon(aes(datetime, 
    ymax = MFA.max, ymin = MFA.min, fill = "MFA Max/Min"), colour = "gray40", 
    linetype = 3, alpha = 0.5) + geom_line(aes(y = MFA.avg, color = "MFA-Water"), 
    size = 0.9, linetype = 1, alpha = 1) + ylab(expression(paste("Daily Temperature ( ", 
    degree, "C)", sep = ""))) + xlab("") + scale_x_datetime(limits = c(as.POSIXct("2012-05-10 12:00"), 
    as.POSIXct("2012-05-30 12:00")), labels = date_format("%b-%d"), breaks = date_breaks("7 days")) + 
    scale_y_continuous(breaks = seq(0, 42, by = 4), limits = c(0, 42), labels = seq(0, 
        42, by = 4)) + theme_bw() + labs(title = "Daily Air and Water Temperature: Rubicon") + 
    scale_color_manual("Mean", breaks = c("AIR", "RUB-Water", "MFA-Water"), 
        values = c(`RUB-Water` = "darkgreen", `MFA-Water` = "darkmagenta", AIR = "orange")) + 
    scale_fill_manual(" Max/Min", breaks = c("AIR Max/Min", "RUB Max/Min", "MFA Max/Min"), 
        values = c(`AIR Max/Min` = "gold", `MFA Max/Min` = "darkmagenta", `RUB Max/Min` = "darkolivegreen3")) + 
    theme(legend.direction = "horizontal", legend.position = "bottom", legend.key = element_blank(), 
        legend.background = element_rect(fill = "white", colour = "gray30")) + 
    guides(fill = guide_legend(keywidth = 0.9, keyheight = 1))

RUB
~~~~

![]({{% asseturl %}}assets/old-blog-stuff/unnamed-chunk-1.png)
