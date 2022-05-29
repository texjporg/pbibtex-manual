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
${BSTINPUTS:=.:/usr/share/texlive/texmf-dist//}
${BIBINPUTS:=.:/usr/share/texlive/texmf-dist//}
export TEXMFCNF BSTINPUTS BIBINPUTS

##
## example ::
##  $ SOURCE=somewhere/source BSTINPUTS=anywhere// BIBINPUTS=anywhere// ./test-bib.sh
##

rc=0
bp=
bu=
be=
bv=
rm -f *.bbl *.blg

### platex & pbibtex

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-p
  $PBIBTEX $job \
   && diff output/$job.bbl $job.bbl || { rc=1 ; bp=$bp,$bst ; }

done


### uplatex & upbibtex

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-up
  $UPBIBTEX $job \
   && diff output/$job.bbl $job.bbl || { rc=2 ; bu=$bu,$bst ; }

done


### platex & upbibtex -kanji-internal=euc

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-p
  echo $UPBIBTEX_EUC
  $UPBIBTEX_EUC $job \
   && diff output/$job.bbl $job.bbl || { rc=3 ; be=$be,$bst ; }

done


### uplatex & bibtexu

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do
#for bst in junsrt jname; do

  job=jxampl-$bst-bu
  $BIBTEXU $job  || test $? = 1 \
   && diff output/$job.bbl $job.bbl || { rc=4 ; bv=$bv,$bst ; }

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

