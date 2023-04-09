#!/bin/sh
#
# Copyright 2022-2023 TANAKA Takuji <ttk@t-lab.opal.ne.jp>
# You may freely use, modify and/or distribute this file.

##
## Note: test substrp failes
## https://github.com/texjporg/tex-jp-build/issues/157
##

#SOURCE=somewhere/source
PBIBTEX=$SOURCE/Work/texk/web2c/pbibtex
UPBIBTEX=$SOURCE/Work/texk/web2c/upbibtex
UPBIBTEX_EUC=$SOURCE/Work/texk/web2c/upbibtex\ -kanji-internal=euc
BIBTEXU=$SOURCE/Work/texk/bibtex-x/bibtexu

TEXMFCNF=$SOURCE/texk/kpathsea
export TEXMFCNF

rc=0
bp=
bu=
be=
bv=
rm -f *.bbl *.blg

### pbibtex

for job in widthp; do

max_print_line=79 $PBIBTEX $job \
  && diff $job.bbl.base $job.bbl || { rc=1 ; bp=$bp,$job ; }

done

for job in casep periodp substrp txtprfxp namep isknjp charp; do

max_print_line=119 $PBIBTEX $job \
  && diff $job.bbl.base $job.bbl || { rc=1 ; bp=$bp,$job ; }

done



### wrap up

if [ $rc -gt 0 ]; then
  if [ -n "$bp" ]; then
    echo ERROR in pbibtex $bp
  fi
else
  echo SUCCESS
fi
exit $rc

