---
title: "Setting up Automated Reprint Requests in Gmail"
author: "Noam Ross"
tags: [open-access, hackery]
date: 2013-04-24T17:37:22

--- 


I recently wrote about [my first peer-reviewed
publication](http://www.noamross.net/blog/2013/4/24/my-first-publication.html)
and lamented that it's behind a \$1500 paywall. I am not allowed to post
the file to my website, but I am able to distribute the paper by e-mail,
so I've set up a system to automate requests for the paper.

[Michael McCarthy wrote a similar
post](http://mickresearch.wordpress.com/2012/10/18/automating-reprint-requests/)
this fall for people using Outlook e-mail. My method is similar but is
meant for Gmail. Here's how to do it:

1.  **Generate a custom `mailto` link**

    I used [this website](http://www.cha4mot.com/t_mailto.html) to
    generate a custom `mailto` link that would open the users' mail
    client and send a pre-formatted e-mail to me. The email template is:

    > To: noam.ross@gmail.com
    >
    > Subject: Reprint Request: Economics and Ecology of Open-Access
    > Fisheries
    >
    > Body:
    >
    > Dear Noam,
    >
    > Please send me a reprint of:
    >
    > Fuller, Kate, David Kling, Kaeilin Kroetz, Noam Ross, and James N.
    > Sanchirico (2013) Economics and Ecology of Open-Access Fisheries.
    > In *Encyclopedia of Energy, Natural Resource, and Environmental
    > Economics*, Ed. Jason Shogren, p.39-49. Amsterdam: Elsevier.
    > http://dx.doi.org/10.1016/B978-0-12-375067-9.00114-5

    This generates the link:

        mailto:noam.ross@gmail.com?Subject=Preprint%20Request%3A%20Economics%20and%20Ecology%20of%20Open-Access%20Fisheries&Body=Dear%20Noam%2C%0A%0APlease%20send%20me%20a%20reprint%20of%3A%0A%0AFuller%2C%20Kate%2C%20David%20Kling%2C%20Kaeilin%20Kroetz%2C%20Noam%20Ross%2C%20and%20James%20N.%20Sanchirico%20%282013%29%20Economics%20and%20Ecology%20of%20Open-Access%20Fisheries.%20In%20%20*Encyclopedia%20of%20Energy%2C%20Natural%20Resource%2C%20and%20Environmental%20Economics*%2C%20Ed.%20Jason%20Shogren%2C%20p.39-49.%20Amsterdam%3A%20Elsevier.%20http%3A//dx.doi.org/10.1016/B978-0-12-375067-9.00114-5

2.  **Put the link on your webpage in lieu of a link to a PDF**

Here it is on my site:

![]({{< baseurl >}}/old-blog-stuff/emaillink.png)

3.  **Put the PDF in your Dropbox and get a link to the file**

Unfortunately Gmail won't created automated responses with file
attachments[^1], so you still need to create a link where the file can
be downloaded, even if it's not public. I use Dropbox:

![]({{< baseurl >}}/old-blog-stuff/sharelink.png)

3.  **Create a Gmail template**

a.  Gmail has an experimental feature in "labs" that creates templates.
    Turn it on:

![]({{< baseurl >}}/old-blog-stuff/canned.png)

b.  Then write an email without a recipient and save it as a canned
    response:

![]({{< baseurl >}}/old-blog-stuff/cannedtxt.png)

![]({{< baseurl >}}/old-blog-stuff/cannedresp.png)

4.  **Create an email filter**

Create a filter specific to the custom `mailto` link you created (e.g.,
the same subject line). With canned responses enabled, you can choose
"Send canned response" as an option on gmail filters. Select the canned
response you saved. I also add a tag so I can track these requests
easily.

![]({{< baseurl >}}/old-blog-stuff/openaccessfilter.png)

That's it! Thanks to Michael McCarthy for the idea.

[^1]: I tried to get automated attachments working with this [IFTTT
    recipe](https://ifttt.com/recipes/90984), but the reply always had
    mangled text. If someone gets it working, let me know.
