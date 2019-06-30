FROM rocker/verse:latest
MAINTAINER Noam Ross noam.ross@gmail.com

RUN  if [ -f DESCRIPTION ]; then  Rscript -e "devtools::install_dev_deps(dependencies = TRUE, upgrade = 'always')"; fi \
  && Rscript -e "blogdown::install_hugo()"

