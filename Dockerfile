FROM rocker/tidyverse:latest
MAINTAINER Noam Ross noam.ross@gmail.com

COPY DESCRIPTION /pkg/DESCRIPTION

RUN apt-get update -qq && apt-get install -y --no-install-recommends --no-upgrade \
      rsync wget git ssh \
 && wget -q https://github.com/gohugoio/hugo/releases/download/v0.57.2/hugo_0.57.2_Linux-64bit.deb \
 && dpkg -i hugo_0.57.2_Linux-64bit.deb \
 && installGithub.r noamross/noamtools \
 && if [ -f /pkg/DESCRIPTION ]; then \
      Rscript --vanilla -e "devtools::install_dev_deps('/pkg', dependencies = NA, upgrade = 'never')"; \
    fi
