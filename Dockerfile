FROM rocker/verse:latest
MAINTAINER Noam Ross noam.ross@gmail.com

COPY DESCRIPTION /pkg/DESCRIPTION

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  rsync
RUN if [ -f /pkg/DESCRIPTION ]; then \
      Rscript -e --vanilla "devtools::install_dev_deps('/pkg', dependencies = TRUE, upgrade = 'always')"; \
    fi
RUN Rscript -e --vanilla "blogdown::install_hugo()"

