FROM ubuntu:20.04

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PANDOC_VERSION "2.9.1"
ENV PANDOC_CROSSREF_VERSION "0.3.6.1a"
ENV MAKE_VERSION "4.2.1"

ADD https://github.com/jgm/pandoc/releases/download/2.9.1/pandoc-2.9.1-1-amd64.deb ./pandoc-amd64.deb
ADD https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.6.1a/linux-pandoc_2_9_1.tar.gz ./pandoc-crossref-linux.tar.gz

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && dpkg -i ./pandoc-amd64.deb \
  && tar xvzf ./pandoc-crossref-linux.tar.gz --strip-components 1 -C /usr/bin/ \
  && rm -f ./pandoc-crossref-linux.tar.gz \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y texlive make 

WORKDIR /data