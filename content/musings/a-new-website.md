---
date: "2019-07-07"
title: "A New Website"
slug: a-new-website
---

For me, the task of building a personal website is fraught with so many of my technical, aesthetic,
and personal hangups that I hadn't updated mine since mid-graduate school.
Thanks to consistent pestering by [Maëlle](https://twitter.com/ma_salmon),
though, I finally got around to re-building this one using a modern toolkit.
Hopefully I can keep it up to date. 

Here are some of the pieces that I used to build it:

<!--more-->

-   The site is generated using the [Hugo](https://gohugo.io/) static site
    generator, with the R package [blogdown](https://bookdown.org/yihui/blogdown/)
    generating [R Markdown](https://rmarkdown.rstudio.com/ss) posts.
-   The [Kube](https://imperavi.com/kube/) framework by Imperavi provides basic layout and user-interaction.
-   Design inspiration is taken from Greg Restall's
    [consequently.org](https://consequently.org/) and the lovely but defunct
    [Gentle Reader](https://web.archive.org/web/20160313103811/http://thegentlereader.net/).  
-   Some design elements are inspired by Edward Tufte's handout designs{{%mn%}}Especially margin notes{{%/mn%}}, as
    implemented in the [tufte-css](https://github.com/edwardtufte/tufte-css) framework.{{%sn%}}Numbered and unnumbered, of course{{%/sn%}}
-   The site uses the fonts [Alegreya](https://huertatipografica.com/en/fonts/alegreya-ht-pro) by [Huerta Tipográfica](https://huertatipografica.com/).
    and [IM Fell English](https://iginomarini.com/fell/), extracted from John Fell's historic types by [Igino Marini](https://iginomarini.com). Fonts are served by
    [Google Fonts](https://fonts.google.com/). Icons are provided by
    [Font Awesome](https://fontawesome.com).
-   My [CV](/vitae/) is generated from data on [ORCiD](https://orcid.org) using the [*rorcid*](https://github.com/ropensci/rorcid) package.
-   The site is hosted at [nearlyfreespeech.net](http://nearlyfreespeech.net)
    and deployed using [Circle CI](https://circleci.com).

You can find source code for the site on [GitHub](https://github.com/noamross/noamross.net/).

