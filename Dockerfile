FROM alpine:3.8

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

RUN wget https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-linux.tar.gz \
  && tar xvzf ./pandoc-2.5-linux.tar.gz --strip-components 1 -C /usr/local/ \
  && rm -f ./pandoc-2.5-linux.tar.gz \
  && apk update \
  && apk upgrade \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main texlive=20170524-r6 \
  && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main openjpeg=2.3.0-r1

ENV PANDOC_VERSION "2.5"

ENTRYPOINT ["/usr/local/pandoc-2.5-linux/bin/pandoc"]

CMD ["--help"]