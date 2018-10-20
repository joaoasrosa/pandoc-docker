FROM haskell:8.0

LABEL maintainer="João Rosa <joaoasrosa@gmail.com>"

RUN apt-get update -y \
  && apt-get install -y -o Acquire::Retries=7 --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern

ENV PANDOC_VERSION "2.2.1"

RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

WORKDIR /data

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]