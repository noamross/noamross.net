FROM rocker/verse:latest
MAINTAINER Noam Ross noam.ross@gmail.com

RUN  if [ -f DESCRIPTION ]; then R --quiet -e "devtools::install(dep = TRUE)"; fi \
  && Rscript -e "blogdown::install_hugo()"

