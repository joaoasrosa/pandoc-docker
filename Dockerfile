FROM alpine:3.8

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

RUN wget https://github.com/jgm/pandoc/releases/download/2.4/pandoc-2.4-linux.tar.gz \
  && tar xvzf ./pandoc-2.4-linux.tar.gz --strip-components 1 -C /usr/local/ \
  && rm -f ./pandoc-2.4-linux.tar.gz \
  && apk update \
  && apk upgrade \
  && apk add --no-cache texlive

ENV PANDOC_VERSION "2.4"

ENTRYPOINT ["/usr/local/pandoc-2.4-linux/bin/pandoc"]

CMD ["--help"]