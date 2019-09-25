---
title: Drake, Docker, and Gitlab-CI
author: Noam Ross
date: '2019-09-24'
slug: drake-docker-and-gitlab-ci
categories:
  - R
tags:
  - R
---

For a number of reasons I've been trying out [GitLab](https://gitlab.com) as a replacement for for both GitHub and various continuous integration systems, and have been exploring configurations useful for model-fitting pipelines.  I turned one of these into an [example repository](https://gitlab.com/ecohealthalliance/drake-gitlab-docker-example) that shows how to use GitLab together with the [Rocker](https://www.rocker-project.org/) Docker images and the [**drake**](https://docs.ropensci.org/drake/) build system to reproducibly run a project pipeline, using the cacheing functionality across all three tools to make things reasonably speedy and enable both local and remote builds.  Check it out at <https://gitlab.com/ecohealthalliance/drake-gitlab-docker-example>.
