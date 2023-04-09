#!/bin/sh
#
# Copyright 2022-2023 TANAKA Takuji <ttk@t-lab.opal.ne.jp>
# You may freely use, modify and/or distribute this file.

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

### bibtexu

for job in widthu; do

max_print_line=79 $BIBTEXU $job \
  && diff $job.bbl.ubase $job.bbl || { rc=4 ; bv=$bv,$job ; }

done

for job in caseu periodu substru txtprfxu nameu isknju charu; do

max_print_line=119 $BIBTEXU $job \
  && diff $job.bbl.ubase $job.bbl || { rc=4 ; bv=$bv,$job ; }

done




### wrap up

if [ $rc -gt 0 ]; then
  if [ -n "$bp" ]; then
    echo ERROR in pbibtex $bp
  fi
  if [ -n "$bu" ]; then
    echo ERROR in upbibtex $bu
  fi
  if [ -n "$be" ]; then
    echo ERROR in \"upbibtex -kanji-internal=euc\" $be
  fi
  if [ -n "$bv" ]; then
    echo ERROR in bibtexu $bv
  fi
else
  echo SUCCESS
fi
exit $rc

