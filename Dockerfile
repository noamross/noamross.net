FROM rocker/tidyverse:3.6.2
MAINTAINER Noam Ross noam.ross@gmail.com

COPY DESCRIPTION install.sh /pkg/

RUN cd /pkg && ./install.sh
