FROM rocker/tidyverse:latest
MAINTAINER Noam Ross noam.ross@gmail.com

COPY DESCRIPTION install.sh /pkg/

RUN cd /pkg && ./install.sh
