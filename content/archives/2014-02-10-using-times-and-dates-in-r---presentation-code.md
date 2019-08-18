---
title: "Using Dates and Times in R"
author: "Bonnie Dixon"
tags: [R, D-RUG]
date: 2014-02-10T15:09:57

--- 


*Today at the [Davis R Users'
Group](http://www.noamross.net/davis-r-users-group.html), [Bonnie
Dixon](http://ffhi.ucdavis.edu/people/directory/bmdixon) gave a tutorial
on the various ways to handle dates and times in R. Bonnie provided this
great script which walks through essential classes, functions, and
packages. Here it is piped through `knitr::spin`. The original R script
can be found as a gist
[here](https://gist.github.com/noamross/8928124).*

Date/time classes
-----------------

Three date/time classes are built-in in R, Date, POSIXct, and POSIXlt.

### Date

This is the class to use if you have only dates, but no times, in your
data.

create a date:

``` {.r}
dt1 <- as.Date("2012-07-22")
dt1
```

    ## [1] "2012-07-22"

non-standard formats must be specified:

``` {.r}
dt2 <- as.Date("04/20/2011", format = "%m/%d/%Y")
dt2
```

    ## [1] "2011-04-20"

``` {.r}
dt3 <- as.Date("October 6, 2010", format = "%B %d, %Y")
dt3
```

    ## [1] "2010-10-06"

see list of format symbols:

``` {.r}
`?`(strptime)
```

**calculations with dates:**

find the difference between dates:

``` {.r}
dt1 - dt2
```

    ## Time difference of 459 days

``` {.r}
difftime(dt1, dt2, units = "weeks")
```

    ## Time difference of 65.57 weeks

Add or subtract days:

``` {.r}
dt2 + 10
```

    ## [1] "2011-04-30"

``` {.r}
dt2 - 10
```

    ## [1] "2011-04-10"

create a vector of dates and find the intervals between them:

``` {.r}
three.dates <- as.Date(c("2010-07-22", "2011-04-20", "2012-10-06"))
three.dates
```

    ## [1] "2010-07-22" "2011-04-20" "2012-10-06"

``` {.r}
diff(three.dates)
```

    ## Time differences in days
    ## [1] 272 535

create a sequence of dates:

``` {.r}
six.weeks <- seq(dt1, length = 6, by = "week")
six.weeks
```

    ## [1] "2012-07-22" "2012-07-29" "2012-08-05" "2012-08-12" "2012-08-19"
    ## [6] "2012-08-26"

``` {.r}
six.weeks <- seq(dt1, length = 6, by = 14)
six.weeks
```

    ## [1] "2012-07-22" "2012-08-05" "2012-08-19" "2012-09-02" "2012-09-16"
    ## [6] "2012-09-30"

``` {.r}
six.weeks <- seq(dt1, length = 6, by = "2 weeks")
six.weeks
```

    ## [1] "2012-07-22" "2012-08-05" "2012-08-19" "2012-09-02" "2012-09-16"
    ## [6] "2012-09-30"

see the internal integer representation

``` {.r}
unclass(dt1)
```

    ## [1] 15543

``` {.r}
dt1 - as.Date("1970-01-01")
```

    ## Time difference of 15543 days

### POSIXct

If you have times in your data, this is usually the best class to use.

create some POSIXct objects:

``` {.r}
tm1 <- as.POSIXct("2013-07-24 23:55:26")
tm1
```

    ## [1] "2013-07-24 23:55:26 PDT"

``` {.r}
tm2 <- as.POSIXct("25072013 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2
```

    ## [1] "2013-07-25 08:32:07 PDT"

specify the time zone:

``` {.r}
tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT")
tm3
```

    ## [1] "2010-12-01 11:42:03 GMT"

**some calculations with times**

compare times:

``` {.r}
tm2 > tm1
```

    ## [1] TRUE

Add or subtract seconds:

``` {.r}
tm1 + 30
```

    ## [1] "2013-07-24 23:55:56 PDT"

``` {.r}
tm1 - 30
```

    ## [1] "2013-07-24 23:54:56 PDT"

find the difference between times:

``` {.r}
tm2 - tm1
```

    ## Time difference of 8.611 hours

automatically adjusts for daylight savings time:

``` {.r}
as.POSIXct("2013-03-10 08:32:07") - as.POSIXct("2013-03-09 23:55:26")
```

    ## Time difference of 7.611 hours

Get the current time (in POSIXct by default):

``` {.r}
Sys.time()
```

    ## [1] "2014-02-10 18:26:01 PST"

see the internal integer representation:

``` {.r}
unclass(tm1)
```

    ## [1] 1.375e+09
    ## attr(,"tzone")
    ## [1] ""

``` {.r}
difftime(tm1, as.POSIXct("1970-01-01 00:00:00", tz = "UTC"), units = "secs")
```

    ## Time difference of 1.375e+09 secs

### POSIXlt

This class enables easy extraction of specific componants of a time.
("ct" stand for calender time and "lt" stands for local time. "lt" also
helps one remember that POXIXlt objects are *lists*.)

create a time:

``` {.r}
tm1.lt <- as.POSIXlt("2013-07-24 23:55:26")
tm1.lt
```

    ## [1] "2013-07-24 23:55:26"

``` {.r}
unclass(tm1.lt)
```

    ## $sec
    ## [1] 26
    ## 
    ## $min
    ## [1] 55
    ## 
    ## $hour
    ## [1] 23
    ## 
    ## $mday
    ## [1] 24
    ## 
    ## $mon
    ## [1] 6
    ## 
    ## $year
    ## [1] 113
    ## 
    ## $wday
    ## [1] 3
    ## 
    ## $yday
    ## [1] 204
    ## 
    ## $isdst
    ## [1] 1

``` {.r}
unlist(tm1.lt)
```

    ##   sec   min  hour  mday   mon  year  wday  yday isdst 
    ##    26    55    23    24     6   113     3   204     1

extract componants of a time object:

``` {.r}
tm1.lt$sec
```

    ## [1] 26

``` {.r}
tm1.lt$wday
```

    ## [1] 3

truncate or round off the time:

``` {.r}
trunc(tm1.lt, "days")
```

    ## [1] "2013-07-24"

``` {.r}
trunc(tm1.lt, "mins")
```

    ## [1] "2013-07-24 23:55:00"

### chron

This class is a good option when you don't need to deal with timezones.
It requires the package `chron`.

``` {.r}
require(chron)
```

    ## Loading required package: chron
    ## 
    ## Attaching package: 'chron'
    ## 
    ## The following objects are masked from 'package:lubridate':
    ## 
    ##     days, hours, minutes, seconds, years

create some times:

``` {.r}
tm1.c <- as.chron("2013-07-24 23:55:26")
tm1.c
```

    ## [1] (07/24/13 23:55:26)

``` {.r}
tm2.c <- as.chron("07/25/13 08:32:07", "%m/%d/%y %H:%M:%S")
tm2.c
```

    ## [1] (07/25/13 08:32:07)

extract just the date:

``` {.r}
dates(tm1.c)
```

    ##     day  
    ## 07/24/13

compare times:

``` {.r}
tm2.c > tm1.c
```

    ## [1] TRUE

add days:

``` {.r}
tm1.c + 10
```

    ## [1] (08/03/13 23:55:26)

calculate the differene between times:

``` {.r}
tm2.c - tm1.c
```

    ## [1] 08:36:41

``` {.r}
difftime(tm2.c, tm1.c, units = "hours")
```

    ## Time difference of 8.611 hours

does not adjust for daylight savings time:

``` {.r}
as.chron("2013-03-10 08:32:07") - as.chron("2013-03-09 23:55:26")
```

    ## [1] 08:36:41

Detach the `chron` package as it will interfere with `lubridate` later
in this script.

``` {.r}
detach("package:chron", unload = TRUE)
```

### Summary of date/time classes

-   When you just have dates, use Date.
-   When you have times, POSIXct is usually the best,
-   but POSIXlt enables easy extraction of specific components
-   and chron is simplest when you don't need to deal with timezones and
    daylight savings time.

Manipulating times and dates
----------------------------

### lubridate

This package is a wrapper for POSIXct with more intuitive syntax.

``` {.r}
require(lubridate)
```

create a time:

``` {.r}
tm1.lub <- ymd_hms("2013-07-24 23:55:26")
tm1.lub
```

    ## [1] "2013-07-24 23:55:26 UTC"

``` {.r}
tm2.lub <- mdy_hm("07/25/13 08:32")
tm2.lub
```

    ## [1] "2013-07-25 08:32:00 UTC"

``` {.r}
tm3.lub <- ydm_hm("2013-25-07 4:00am")
tm3.lub
```

    ## [1] "2013-07-25 04:00:00 UTC"

``` {.r}
tm4.lub <- dmy("26072013")
tm4.lub
```

    ## [1] "2013-07-26 UTC"

some manipulations: extract or reassign componants:

``` {.r}
year(tm1.lub)
```

    ## [1] 2013

``` {.r}
week(tm1.lub)
```

    ## [1] 30

``` {.r}
wday(tm1.lub, label = TRUE)
```

    ## [1] Wed
    ## Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat

``` {.r}
hour(tm1.lub)
```

    ## [1] 23

``` {.r}
tz(tm1.lub)
```

    ## [1] "UTC"

``` {.r}
second(tm2.lub) <- 7
tm2.lub
```

    ## [1] "2013-07-25 08:32:07 UTC"

converting to decimal hours can facilitate some types of calculations:

``` {.r}
tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600
tm1.dechr
```

    ## [1] 23.92

Lubridate distinguishes between four types of objects: instants,
intervals, durations, and periods. An instant is a specific moment in
time. Intervals, durations, and periods are all ways of recording time
spans.

Dates and times parsed in lubridate are instants:

``` {.r}
is.instant(tm1.lub)
```

    ## [1] TRUE

round an instant:

``` {.r}
round_date(tm1.lub, "minute")
```

    ## [1] "2013-07-24 23:55:00 UTC"

``` {.r}
round_date(tm1.lub, "day")
```

    ## [1] "2013-07-25 UTC"

get the current time or date as an instant:

``` {.r}
now()
```

    ## [1] "2014-02-10 18:26:02 PST"

``` {.r}
today()
```

    ## [1] "2014-02-10"

Note that lubridate uses UTC time zones as default.

see an instant in a different time zone:

``` {.r}
with_tz(tm1.lub, "America/Los_Angeles")
```

    ## [1] "2013-07-24 16:55:26 PDT"

change the time zone of an instant (keeping the same clock time):

``` {.r}
force_tz(tm1.lub, "America/Los_Angeles")
```

    ## [1] "2013-07-24 23:55:26 PDT"

some calculations with instants. Note that the units are seconds:

``` {.r}
tm2.lub - tm1.lub
```

    ## Time difference of 8.611 hours

``` {.r}
tm2.lub > tm1.lub
```

    ## [1] TRUE

``` {.r}
tm1.lub + 30
```

    ## [1] "2013-07-24 23:55:56 UTC"

An interval is the span of time that occurs between two specified
instants.

``` {.r}
in.bed <- as.interval(tm1.lub, tm2.lub)
in.bed
```

    ## [1] 2013-07-24 23:55:26 UTC--2013-07-25 08:32:07 UTC

Check whether a certain instant occured with a specified interval:

``` {.r}
tm3.lub %within% in.bed
```

    ## [1] TRUE

``` {.r}
tm4.lub %within% in.bed
```

    ## [1] FALSE

determine whether two intervals overlap:

``` {.r}
daylight <- as.interval(ymd_hm("2013-07-25 06:03"), ymd_hm("2013-07-25 20:23"))
daylight
```

    ## [1] 2013-07-25 06:03:00 UTC--2013-07-25 20:23:00 UTC

``` {.r}
int_overlaps(in.bed, daylight)
```

    ## [1] TRUE

A duration is a time span not anchored to specific start and end times.
It has an exact, fixed length, and is stored internally in seconds.

create some durations:

``` {.r}
ten.minutes <- dminutes(10)
ten.minutes
```

    ## [1] "600s (~10 minutes)"

``` {.r}
five.days <- ddays(5)
five.days
```

    ## [1] "432000s (~5 days)"

``` {.r}
one.year <- dyears(1)
one.year
```

    ## [1] "31536000s (~365 days)"

``` {.r}
as.duration(in.bed)
```

    ## [1] "31001s (~8.61 hours)"

arithmatic with durations:

``` {.r}
tm1.lub - ten.minutes
```

    ## [1] "2013-07-24 23:45:26 UTC"

``` {.r}
five.days + dhours(12)
```

    ## [1] "475200s (~5.5 days)"

``` {.r}
ten.minutes/as.duration(in.bed)
```

    ## [1] 0.01935

A period is a time span not anchored to specific start and end times,
and measured in units larger than seconds with inexact lengths. create
some periods:

``` {.r}
three.weeks <- weeks(3)
three.weeks
```

    ## [1] "21d 0H 0M 0S"

``` {.r}
four.hours <- hours(4)
four.hours
```

    ## [1] "4H 0M 0S"

arithmatic with periods:

``` {.r}
tm4.lub + three.weeks
```

    ## [1] "2013-08-16 UTC"

``` {.r}
sabbatical <- months(6) + days(12)
sabbatical
```

    ## [1] "6m 12d 0H 0M 0S"

``` {.r}
three.weeks/sabbatical
```

    ## estimate only: convert to intervals for accuracy

    ## [1] 0.108

### Calculating mean clock times

Say we have a vector of clock times in decimal hours, and we want to
calculate the mean clock time.

``` {.r}
bed.times <- c(23.9, 0.5, 22.7, 0.1, 23.3, 1.2, 23.6)
bed.times
```

    ## [1] 23.9  0.5 22.7  0.1 23.3  1.2 23.6

``` {.r}
mean(bed.times)  # doesn't work
```

    ## [1] 13.61

The clock has a circular scale, which ends where it begins, so we need
to use circular statistics. (For more info on circular statistics see
<http://en.wikipedia.org/wiki/Mean_of_circular_quantities>.)

Get the package, psych.

``` {.r}
require(psych)
circadian.mean(bed.times)
```

    ## [1] 23.9

### An example of using times and dates in a data frame

Here is a data frame with a week of hypothetical times of going to bed
and getting up for one person, and the total amount of time sleep time
obtained each night according to a sleep monitoring device.

``` {.r}
sleep <- data.frame(bed.time = ymd_hms("2013-09-01 23:05:24", "2013-09-02 22:51:09", 
    "2013-09-04 00:09:16", "2013-09-04 23:43:31", "2013-09-06 00:17:41", "2013-09-06 22:42:27", 
    "2013-09-08 00:22:27"), rise.time = ymd_hms("2013-09-02 08:03:29", "2013-09-03 07:34:21", 
    "2013-09-04 07:45:06", "2013-09-05 07:07:17", "2013-09-06 08:17:13", "2013-09-07 06:52:11", 
    "2013-09-08 07:15:19"), sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34, 
    7.42, 6.45)))
sleep
```

    ##              bed.time           rise.time           sleep.time
    ## 1 2013-09-01 23:05:24 2013-09-02 08:03:29 24264s (~6.74 hours)
    ## 2 2013-09-02 22:51:09 2013-09-03 07:34:21 28512s (~7.92 hours)
    ## 3 2013-09-04 00:09:16 2013-09-04 07:45:06 25236s (~7.01 hours)
    ## 4 2013-09-04 23:43:31 2013-09-05 07:07:17 22428s (~6.23 hours)
    ## 5 2013-09-06 00:17:41 2013-09-06 08:17:13 22824s (~6.34 hours)
    ## 6 2013-09-06 22:42:27 2013-09-07 06:52:11 26712s (~7.42 hours)
    ## 7 2013-09-08 00:22:27 2013-09-08 07:15:19 23220s (~6.45 hours)

We want to calculate sleep efficiency, the percent of time in bed spent
asleep.

``` {.r}
sleep$efficiency <- round(sleep$sleep.time/(sleep$rise.time - sleep$bed.time) * 
    100, 1)
sleep
```

    ##              bed.time           rise.time           sleep.time efficiency
    ## 1 2013-09-01 23:05:24 2013-09-02 08:03:29 24264s (~6.74 hours)       75.2
    ## 2 2013-09-02 22:51:09 2013-09-03 07:34:21 28512s (~7.92 hours)       90.8
    ## 3 2013-09-04 00:09:16 2013-09-04 07:45:06 25236s (~7.01 hours)       92.3
    ## 4 2013-09-04 23:43:31 2013-09-05 07:07:17 22428s (~6.23 hours)       84.2
    ## 5 2013-09-06 00:17:41 2013-09-06 08:17:13 22824s (~6.34 hours)       79.3
    ## 6 2013-09-06 22:42:27 2013-09-07 06:52:11 26712s (~7.42 hours)       90.9
    ## 7 2013-09-08 00:22:27 2013-09-08 07:15:19 23220s (~6.45 hours)       93.7

Now let's calculate the mean of each column:

``` {.r}
colMeans(sleep)  # doesn't work
```

    ## Error: 'x' must be numeric

``` {.r}
circadian.mean(hour(sleep$bed.time) + minute(sleep$bed.time)/60 + second(sleep$bed.time)/3600)
```

    ## [1] 23.6

``` {.r}
circadian.mean(hour(sleep$rise.time) + minute(sleep$rise.time)/60 + second(sleep$rise.time)/3600)
```

    ## [1] 7.559

``` {.r}
mean(sleep$sleep.time)/3600
```

    ## [1] 6.873

``` {.r}
mean(sleep$efficiency)
```

    ## [1] 86.63

We can also plot sleep duration and efficiency across the week:

``` {.r}
par(mar = c(5, 4, 4, 4))
plot(round_date(sleep$rise.time, "day"), sleep$efficiency, type = "o", col = "blue", 
    xlab = "Morning", ylab = NA)
par(new = TRUE)
plot(round_date(sleep$rise.time, "day"), sleep$sleep.time/3600, type = "o", 
    col = "red", axes = FALSE, ylab = NA, xlab = NA)
axis(side = 4)
mtext(side = 4, line = 2.5, col = "red", "Sleep duration")
mtext(side = 2, line = 2.5, col = "blue", "Sleep efficiency")
```

![plot of chunk
unnamed-chunk-50]({{< baseurl >}}/old-blog-stuff/dixondates.png)

More resources on times and dates
---------------------------------

date and time tutorials for R:

-   <http://www.stat.berkeley.edu/classes/s133/dates.html>
-   <http://science.nature.nps.gov/im/datamgmt/statistics/r/fundamentals/dates.cfm>
-   <http://en.wikibooks.org/wiki/R_Programming/Times_and_Dates>

lubridate:

-   <http://www.jstatsoft.org/v40/i03/paper>

time zone and daylight saving time info:

-   <http://www.timeanddate.com/>
-   <http://en.wikipedia.org/wiki/List_of_tz_database_time_zones>
-   <http://www.twinsun.com/tz/tz-link.htm>
-   Also see the R help file at ?Sys.timezone
