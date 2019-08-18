FROM rocker/geospatial:latest
MAINTAINER Noam Ross noam.ross@gmail.com

COPY DESCRIPTION /pkg/DESCRIPTION

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      rsync \
      hugo \
 && if [ -f /pkg/DESCRIPTION ]; then \
      Rscript --vanilla -e "devtools::install_dev_deps('/pkg', dependencies = NA, upgrade = 'never')"; \
    fi \
 && Rscript --vanilla -e "blogdown::install_hugo()"

