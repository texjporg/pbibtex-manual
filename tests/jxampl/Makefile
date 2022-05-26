#
# Copyright 2022 TANAKA Takuji <ttk@t-lab.opal.ne.jp>
# You may freely use, modify and/or distribute this file.
#

SOURCE=somewhere/source
PBIBTEX=${SOURCE}/Work/texk/web2c/pbibtex
UPBIBTEX=${SOURCE}/Work/texk/web2c/upbibtex
UPBIBTEX_EUC=${SOURCE}/Work/texk/web2c/upbibtex\ -kanji-internal=euc

PLATEX=platex
UPLATEX=uplatex
DVIPDFMX=dvipdfmx

TEXMFCNF=${SOURCE}/texk/kpathsea

INPUTS=anywhere
BSTINPUTS=.:${INPUTS}
BIBINPUTS=.:${INPUTS}

export TEXMFCNF BSTINPUTS BIBINPUTS

##
## example ::
##  $ make pbibtex-pre TEXMFCNF=/usr/share/texmf-dist/web2c DVIPDFMX="dvipdfmx -f ../../haranoaji.map"
##  $ make pbibtex-bib SOURCE=somewhere/source INPUTS=anywhere
##  $ make pbibtex-post TEXMFCNF=/usr/share/texmf-dist/web2c DVIPDFMX="dvipdfmx -f ../../haranoaji.map"
##
##  $ make bib SOURCE=somewhere/source INPUTS=anywhere
##
##  $ make compare
##

bib: pbibtex-bib upbibtex-bib
p-bib: pbibtex-bib
up-bib: upbibtex-bib

compare:
	for bbl in $(wildcard *.bbl); do \
	  diff -qs $$bbl output/$$bbl ; \
	done

clean:
	rm -f *.bbl *.blg *.log


### pLaTeX + pBibTeX

pbibtex-pre:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-p ;\
	  ${PLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{pbibtex}\input" jxampl ;\
	done

pbibtex-bib:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-p ;\
	  ${PBIBTEX} $$job ;\
	done

pbibtex-post:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-p ;\
	  banner=`head -1 $$job.blg` ;\
	  ${PLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{pbibtex}\def\banner{$$banner}\input" jxampl ;\
	  ${PLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{pbibtex}\def\banner{$$banner}\input" jxampl ;\
	  ${DVIPDFMX} $$job ;\
	done


### upLaTeX + upBibTeX

upbibtex-pre:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-up ;\
	  ${UPLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{upbibtex}\input" jxampl ;\
	done

upbibtex-bib:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-up ;\
	  ${UPBIBTEX} $$job ;\
	done

upbibtex-post:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-up ;\
	  banner=`head -1 $$job.blg` ;\
	  ${UPLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{upbibtex}\def\banner{$$banner}\input" jxampl ;\
	  ${UPLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{upbibtex}\def\banner{$$banner}\input" jxampl ;\
	  ${DVIPDFMX} $$job ;\
	done


### pLaTeX + upBibTeX-euc and compare with pBibTeX

upbibtexe-bib:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  ref=jxampl-$$bst-p  ;\
	  job=jxampl-$$bst-ue ;\
	  cp $$ref.aux $$job.aux ;\
	  ${UPBIBTEX} -kanji-internal=euc $$job ;\
	done
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  ref=jxampl-$$bst-p  ;\
	  job=jxampl-$$bst-ue ;\
	  diff -qs $$ref.bbl $$job.bbl ; \
	done

