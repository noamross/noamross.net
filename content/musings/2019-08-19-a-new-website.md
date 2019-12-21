---
date: "2019-08-09"
title: "A New Website"
slug: a-new-website
categories: ["R"]
comments: true
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
    generating [R Markdown](https://rmarkdown.rstudio.com/) posts.
-   The [Kube](https://imperavi.com/kube/) framework by Imperavi provides basic layout and user-interaction.
-   Design inspiration is taken from Greg Restall's
    [consequently.org](https://consequently.org/) and the lovely but defunct
    [Gentle Reader](https://web.archive.org/web/20160313103811/http://thegentlereader.net/).  
-   Some design elements are inspired by Edward Tufte's handout designs{{%mn%}}Especially margin notes{{%/mn%}}, as
    implemented in the [tufte-css](https://github.com/edwardtufte/tufte-css) framework.{{%sn%}}Numbered and unnumbered, of course{{%/sn%}}
-   The site uses the fonts [Alegreya](https://huertatipografica.com/en/fonts/alegreya-ht-pro) by [Huerta Tipográfica](https://huertatipografica.com/)
    and [IM Fell English](https://iginomarini.com/fell/), extracted from John Fell's historic types by [Igino Marini](https://iginomarini.com). Fonts are served by
    [Google Fonts](https://fonts.google.com/). Icons are provided by
    [Font Awesome](https://fontawesome.com) and [Academicicons](https://jpswalsh.github.io/academicons/).
-   My [CV](/vitae/) is generated from data on [ORCiD](https://orcid.org) using the [**rorcid**](https://github.com/ropensci/rorcid) package.
-   The site is hosted at [nearlyfreespeech.net](http://nearlyfreespeech.net)
    and deployed using [Circle CI](https://circleci.com). Assets are delivered via the [jsDeliver](https://www.jsdelivr.com/) CDN.
-   *[Update, 2019-12-21]*: Comments are served via a self-hosted [schnack](schnack.cool) installation.

---

I made a few tweaks to the typical Blogdown setup that I think are neat and you may find useful, esoteric, or maddening:

-   To make R Markdown documents work with Hugo's native syntax highlighter, I made a [lua filter](https://github.com/noamross/noamross.net/blob/hugo/scripts/syntax-highlight-hugo.lua) that wraps code outputs in Hugo's `<highlight>` tags, and set the site to [use it for all posts](https://github.com/noamross/noamross.net/blob/hugo/_output.yml).
-   The R Markdown posts are built on CircleCI, but to improve performance [the knitr cache is saved in the CI cache](https://github.com/noamross/noamross.net/blob/hugo/.circleci/config.yml#L56).
-   Branches of the site deploy and can be viewed under the `/branch/` subdirectory.  This is done by [setting the site BaseURL to vary by branch on CircleCI](https://github.com/noamross/noamross.net/blob/hugo/.circleci/config.yml#L56) and then [pushing the branch to that subdirectory.](https://github.com/noamross/noamross.net/blob/hugo/.circleci/config.yml#L56).
-   The [**rorcid** download script](https://github.com/noamross/noamross.net/blob/hugo/scripts/get-orcid-data.R) merges ORCiD data with [custom annotations](https://github.com/noamross/noamross.net/blob/hugo/data/papers_manual.yaml) and then saves it in the Hugo [`data/`](https://github.com/noamross/noamross.net/blob/hugo/data/) folder for use in building the site.
-   Those custom annotations show up in my CV as "<i class="fas fa-angle-down fa-fw"></i>" dropdowns, using [Kube's Toggle feature](http://kube7.imperavi.com/index.php?section=modules&name=toggle) by way of [a Hugo template](https://github.com/noamross/noamross.net/blob/hugo/layouts/partials/work.html#L24-L27).


I also _think_ that I managed to port over all my old posts and have them redirect properly.  Please [let me know if you find any problems](https://github.com/noamross/noamross.net/issues)! You can find source code for the site on [GitHub](https://github.com/noamross/noamross.net/).



