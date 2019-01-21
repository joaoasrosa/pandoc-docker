FROM alpine:3.8

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

ENV PATH=/usr/local/pandoc-2.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PANDOC_VERSION "2.5"

ADD https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-linux.tar.gz ./pandoc-2.5-linux.tar.gz

RUN tar xvzf ./pandoc-2.5-linux.tar.gz --strip-components 1 -C /usr/local/ \
  && rm -f ./pandoc-2.5-linux.tar.gz \
  && apk update \
  && apk upgrade \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main texlive \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main openjpeg=2.3.0-r1