FROM ubuntu:18.04

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y install pandoc texlive

ENV PANDOC_VERSION "2.5"

ENTRYPOINT ["pandoc"]