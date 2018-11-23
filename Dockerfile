FROM alpine:3.8

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

RUN apk add --no-cache \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern \
    pandoc

ENV PANDOC_VERSION "2.2.1"