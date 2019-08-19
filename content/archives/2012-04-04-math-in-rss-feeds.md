---
title: Displaying Math in RSS feeds
author: Noam Ross
tags: [rss, blog, jekyll, code, math, mathjax]
date: 2012-04-04 11:02:57

--- 


The equations in this blog are rendered using
[MathJax](http://www.mathjax.org), which creates beautiful math from
$\LaTeX$-style markup. However, the math doesn't appear in RSS feeds,
because RSS doesn't allow Javascript. While I have a total of 12 RSS
followers, this is how my closest collaborators, and my most math-y
readers, are likely to read my posts, so I've been looking for a way to
produce readable equations in the RSS feed.

Since I switched producing my website with
[Jekyll](http://github.com/mojombo/jekyll), I have access to the RSS-XML
file itself. I realized I could post-process this to make the math
readable by replacing MathJax with images.

[Codecogs](www.codecogs.com/latex/eqneditor.php) can produce image files
from $\LaTeX$-style math just by calling a URL. To use this on a
website, the format is:

~~~~ {.html}
<img src="http://latex.codecogs.com/png.latex?SOME LATEX" alt="SOME LATEX" />
~~~~

or, for inline equations

~~~~ {.html}
<img src="http://latex.codecogs.com/png.latex?\inline SOME LATEX" alt="\inline SOME LATEX" />
~~~~

The `alt=` means that the raw $\LaTeX$ should show up in the RSS feed if
images fail or are slow to render. Now, for XML, these need to be
modified slightly for forbidden characters (`<>&'"`).

~~~~ {.xml}
&lt;img src=&quot;http://latex.codecogs.com/png.latex?SOME LATEX&quot; alt=&quot;SOME LATEX1&quot; /&gt;
&lt;img src=&quot;http://latex.codecogs.com/png.latex?\inline SOME LATEX&quot; alt=&quot;SOME LATEX&quot; /&gt;
~~~~

Forbidden characters are already converted in the $\LaTeX$ equations
themselves, because they've gone through Jekyll's `xml_escape` function.
Also, I want inline equations to be vertically centered, so I add
`style="vertical-align:middle"` for the inline equations.

I now need to search the Jekyll-produce-XML file for equations, which
are contained by `\[` and `\]`, or `\(` and `\)`, and replace them with
the codecogs call. (Of course, the previous sentence will cause an error
here). Normally I'd use 'sed', but the regular expression is a bit
complicated for it, so I use perl instead:

~~~~ {.bash}
perl -pi -e 's|(\\\[)(.*?)(\\\])|&lt;img src=&quot;http://latex.codecogs.com/png.latex?\2&quot; alt=&quot;\2&quot; /&gt;|g' _site/blog/*.xml
perl -pi -e 's|(\\\()(.*?)(\\\))|&lt;img style=&quot;vertical-align:middle&quot; src=&quot;http://latex.codecogs.com/png.latex?\\inline \2&quot; alt=&quot;\2&quot; /&gt;|g' _site/blog/*.xml
~~~~

These commands do the replacement on all the XML files in the directory,
so if I have multiple RSS feeds it will handle them all.

Now equations like this: $x^2$, and below should display in RSS!:

$$\frac{dK}{dt} = \delta \left(\frac{P_t h_t - TC^I_t - \pi^I_t}{K_t}\right)$$

The only thing to remember is that display equations need to be
separated by multiple line breaks, or they will display side by side in
RSS.

This is sort an inelegant hack and only works if you are running jekyll
locally, but someone could potentially write a jekyll extension so you
could include something like
`{{ "{{post.content | xml_escape | math_in_rss "}}}}` in your RSS
template.

**Update (April 6, 2012)**: Per Christian's suggestion, I've wrapped the
display equations in `div` tags so they center and each have a separate
line. The script now looks like this:

~~~~ {.sh}
perl -pi -e 's|(\\\[)(.*?)(\\\])|&lt;div style=&quot;text-align:center;&quot;&gt;&lt;img src=&quot;http://latex.codecogs.com/png.latex?\2&quot; alt=&quot;\2&quot; /&gt;&lt;/div&gt;|g' _site/blog/*.xml
perl -pi -e 's|(\\\()(.*?)(\\\))|&lt;img style=&quot;vertical-align:middle&quot; src=&quot;http://latex.codecogs.com/png.latex?\\inline \2&quot; alt=&quot;\2&quot; /&gt;|g' _site/blog/*.xml
~~~~
