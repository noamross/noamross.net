---
title: A quick function for editing CSV files in R
author: Noam Ross
tags: [R, Rstudio, code]
date: 2012-11-19T13:47:25

--- 


I've been hunting for a lightweight CSV editor for OSX so I could to
make fixes to data files and not need to fire up Excel. While you can
edit a CSV file in any text editor, it's a pain to navigate the files
without a spreadsheet-like interface. Unfortunately [there doesn't seem
to be a good, free option out
there](http://apple.stackexchange.com/questions/66214/are-there-any-free-and-lightweight-spreadsheet-programs-for-the-mac).

Today I remembered R has a native XCode editor for editing data frames,
and I realized I could write a function that would load the CSV as a
data frame, let me edit it, then close and save it in CSV format again.
Here's the function. This is now part of my `.Rprofile` file, and makes
tweaking data files a snap:

    #' Use the data editor for a CSV file
    #' 
    #' This function loads a CSV file, lets the user edit it in the native data
    #' editor, then re-saves it, prompting the user for a new file name if 
    #' desired.
    #' 
    fix.csv <- function(file, new.name=TRUE, sep=",", comment.char="") {
      tmpframe <- read.csv(file, sep=sep,quote="", colClasses="character",
                           stringsAsFactors=FALSE, comment.char="",
                           blank.lines.skip=FALSE, na.strings="")
      tmpframe <- edit(tmpframe)
      if(is.character(new.name)) {
        out.name <- new.name
      } else if(new.name <- TRUE) {
        out.name <- readline(prompt="Enter file name to save (Hit enter to use original):")
      } else {
        out.name <- file
      }
      if(out.name=="") out.name <- file
      write.table(tmpframe, file=out.name, append=FALSE, quote=FALSE, sep=sep,
                  row.names=FALSE)
    }

Here it is [as a gist](https://gist.github.com/4114258)

This works in RStudio my Mac but unfortunately not when I'm working on
my server, because RStudio server doesn't support a data editor. (I know
it's been requested a few times - let's hope they add it in!)

**Update:**" [David Harris](https://twitter.com/davidjayharris) notes
that "if you try this on a Mountain Lion Mac without X11/XQuartz, it
will cause a fatal error."
