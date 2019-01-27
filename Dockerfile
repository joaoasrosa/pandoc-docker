FROM alpine:3.8

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

ENV PATH=/usr/local/pandoc-2.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PANDOC_VERSION "2.5"

ADD https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-linux.tar.gz ./pandoc-2.5-linux.tar.gz
ADD https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.4.0b/linux-pandoc_2_5.tar.gz ./pandoc-crossref-2.5-linux.tar.gz

RUN tar xvzf ./pandoc-2.5-linux.tar.gz --strip-components 1 -C /usr/local/ \
  && rm -f ./pandoc-2.5-linux.tar.gz \
  && tar xvzf ./pandoc-crossref-2.5-linux.tar.gz --strip-components 1 -C /usr/local/bin/ \
  && rm -f ./pandoc-crossref-2.5-linux.tar.gz \
  && apk update \
  && apk upgrade \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main texlive \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main openjpeg=2.3.0-r1 \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main make

WORKDIR /data