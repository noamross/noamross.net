---
title: A New, Shiny Website!
author: Noam Ross
tags: [blog, general]
date: 2012-04-01 17:27:15

--- 


I've finally got this new website built using
[Jekyll](https://github.com/mojombo/jekyll) and migrated my old content
over. I've been looking to move to a new system for a while - one that
would fit with my workflow and help me keep a blog as an [open lab
notebook](http://www.carlboettiger.info/archives/211).
[Squarespace](http://www.squarespace.com) was a great place to start a
blog, but a Jekyll site hosted on [Github](www.github.com) is (A)
faster, (B) free, (C) more customizable.

This blog will have a somewhat different format than the last. It's
mostly an [*open lab
notebook*](http://www.carlboettiger.info/archives/211), a record of my
ongoing research efforts and a place to do collaborative research. Not
everything will be polished or generally accessible. That said, I also
plan to post items here of general interest, under the
"[general](tags.html#general-ref)" tag. I may separate that out onto a
separate page/blog/rss feed.

Feedback on both form and content is welcome.

### Notes on workflow

A few notes about the site. I'm using a
[fork](https://github.com/dsanson/jekyll/tree/pandoc-ruby) of Jekyll
that uses [Pandoc](http://johnmacfarlane.net/pandoc/) to process
markdown into HTML. I write almost everything in Pandoc-markdown and
this lets me use the same format for blog posts, lecture notes, and
papers that end up in LaTeX or MS Word format. By supplementing Pandoc,
with [Mathjax](mathjax.org), [knitr](http://yihui.github.com/knitr/) and
[Mendeley](http://www.mendeley.com/) I am able to include citations,
math, and code in my blog posts and everything else.

The design is a mix of ideas I got from the blog at
[scriptogr.am](http://scriptogr.am/) and CSS sheets from Brett
Terpstra's [Marked.app](http://markedapp.com/) . I use Brett's
[NValt](http://brettterpstra.com/project/nvalt/) with [Marked](http://markedapp.com/)
to do all of my drafting and storing of notes, and switch to
[TextMate](http://macromates.com/) when I need a more extensions. I have
a TextMate script that lets me go from composing my post in markdown to
publishing it on Github with one keystroke.
