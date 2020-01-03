# Pandoc Docker Image
Docker Image with Pandoc tooling. It includes Make, pandoc-crossref and ebook-tools

[![Build Status](https://dev.azure.com/joaoasrosa/joaoasrosa/_apis/build/status/joaoasrosa.pandoc-docker?branchName=master)](https://dev.azure.com/joaoasrosa/joaoasrosa/_build/latest?definitionId=1?branchName=master)

[![Known Vulnerabilities](https://snyk.io/test/github/joaoasrosa/pandoc-docker/badge.svg)](https://snyk.io/test/github/joaoasrosa/pandoc-docker)

## Usage
Supported conversion formats can be retrieved by executing the container without arguments. It will default 
execute `pandoc --help`.

```
docker run --rm joaoasrosa/pandoc

pandoc [OPTIONS] [FILES]
Input formats:  docbook, docx, epub, haddock, html, json, latex, markdown,
                markdown_github, markdown_mmd, markdown_phpextra,
                markdown_strict, mediawiki, native, opml, org, rst, t2t,
                textile, twiki
Output formats: asciidoc, beamer, context, docbook, docx, dokuwiki, dzslides,
                epub, epub3, fb2, haddock, html, html5, icml, json, latex, man,
                markdown, markdown_github, markdown_mmd, markdown_phpextra,
                markdown_strict, mediawiki, native, odt, opendocument, opml,
                org, pdf*, plain, revealjs, rst, rtf, s5, slideous, slidy,
                texinfo, textile
                [*for pdf output, use latex or beamer and -o FILENAME.pdf]
Options:
...
```
The following command shows the use of a mapped volume containing the input and output files for conversion:

```
docker run -v `pwd`:/data joaoasrosa/pandoc pandoc -f markdown -t html5 myfile.md -o myfile.html
```