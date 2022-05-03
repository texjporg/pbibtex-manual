#!/bin/sh

#SOURCE=somewhere/source
PBIBTEX=$SOURCE/Work/texk/web2c/pbibtex
UPBIBTEX=$SOURCE/Work/texk/web2c/upbibtex
TEXMFCNF=$SOURCE/texk/kpathsea
BSTINPUTS=.:/usr/share/texlive/texmf-dist//
export TEXMFCNF BSTINPUTS

rc=0
rm -f *.bbl

### 01iskanji: is.kanji.str$

$PBIBTEX 01iskanji-p \
 && diff 01iskanji-p.bbl.base 01iskanji-p.bbl || rc=1

$UPBIBTEX 01iskanji-up \
 && diff 01iskanji-up.bbl.base 01iskanji-up.bbl || rc=2

### 01substring: substring$

$PBIBTEX 01substring-p \
 && diff 01substring-p.bbl.base 01substring-p.bbl || rc=3

$UPBIBTEX 01substring-up \
 && diff 01substring-up.bbl.base 01substring-up.bbl || rc=4

### 01textpre: text.prefix$

$PBIBTEX 01textpre-p \
 && diff 01textpre-p.bbl.base 01textpre-p.bbl || rc=5

$UPBIBTEX 01textpre-up \
 && diff 01textpre-up.bbl.base 01textpre-up.bbl || rc=6

### 02jnewline: line break in BBL output

$PBIBTEX 02jnewline \
 && diff 02jnewline.bbl.base 02jnewline.bbl || rc=7

$UPBIBTEX 02jnewline \
 && diff 02jnewline.bbl.base 02jnewline.bbl || rc=8

### 03substring: substring$

$PBIBTEX 03substring-p \
 && diff 03substring-p.bbl.base 03substring-p.bbl || rc=9

$UPBIBTEX 03substring-up \
 && diff 03substring-up.bbl.base 03substring-up.bbl || rc=10

### 03jtest: real life example of substring$

$PBIBTEX 03jtest \
 && diff 03jtest-p.bbl.base 03jtest.bbl || rc=11

$UPBIBTEX 03jtest \
 && diff 03jtest-up.bbl.base 03jtest.bbl || rc=12

### 04unibib: is.kanji.str$ (from uptexdir/)

$UPBIBTEX 04unibib \
 && diff 04unibib.bbl.base 04unibib.bbl || rc=13

if [ $rc -gt 0 ]; then
  echo ERROR in $rc
else
  echo SUCCESS
fi
exit $rc
