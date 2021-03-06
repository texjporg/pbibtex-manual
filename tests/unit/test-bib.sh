#!/bin/sh
#
# Copyright 2022 TANAKA Takuji <ttk@t-lab.opal.ne.jp>
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

### pbibtex

for job in charp; do

max_print_line=79 $PBIBTEX $job \
  ; diff $job.bbl.base $job.bbl || { rc=1 ; bp=$bp,$job ; }

done

for job in widthp casep periodp substrp txtprfxp namep isknjp; do

max_print_line=79 $PBIBTEX $job \
  && diff $job.bbl.base $job.bbl || { rc=1 ; bp=$bp,$job ; }

done


### upbibtex

for job in charu; do

max_print_line=79 $UPBIBTEX $job \
  ; diff $job.bbl.base $job.bbl || { rc=2 ; bu=$bu,$job ; }

done

for job in widthu caseu periodu substru txtprfxu nameu isknju; do

max_print_line=79 $UPBIBTEX $job \
  && diff $job.bbl.base $job.bbl || { rc=2 ; bu=$bu,$job ; }

done


### upbibtex -kanji-internal=euc

for job in charp; do

max_print_line=79 $UPBIBTEX_EUC $job \
  ; diff $job.bbl.base $job.bbl || { rc=3 ; be=$be,$job ; }

done

for job in widthp casep periodp substrp txtprfxp namep isknjp; do

max_print_line=79 $UPBIBTEX_EUC $job \
  && diff $job.bbl.base $job.bbl || { rc=3 ; be=$be,$job ; }

done






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

