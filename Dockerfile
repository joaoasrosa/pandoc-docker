FROM ubuntu:18.04

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PANDOC_VERSION "2.5"
ENV PANDOC_CROSSREF_VERSION "0.3.4"
ENV MAKE_VERSION "4.2.1"

ADD https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb ./pandoc-2.5-1-amd64.deb
ADD https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.4.0b/linux-pandoc_2_5.tar.gz ./pandoc-crossref-2.5-linux.tar.gz

RUN dpkg -i ./pandoc-2.5-1-amd64.deb \
  && rm -f ./pandoc-2.5-linux.tar.gz \
  && tar xvzf ./pandoc-crossref-2.5-linux.tar.gz --strip-components 1 -C /usr/bin/ \
  && rm -f ./pandoc-crossref-2.5-linux.tar.gz \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y texlive make 

WORKDIR /data