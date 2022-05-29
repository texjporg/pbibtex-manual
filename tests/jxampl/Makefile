#
# Copyright 2022 TANAKA Takuji <ttk@t-lab.opal.ne.jp>
# You may freely use, modify and/or distribute this file.
#

SOURCE=somewhere/source
PBIBTEX=${SOURCE}/Work/texk/web2c/pbibtex
UPBIBTEX=${SOURCE}/Work/texk/web2c/upbibtex
UPBIBTEX_EUC=${SOURCE}/Work/texk/web2c/upbibtex\ -kanji-internal=euc
BIBTEXU=${SOURCE}/Work/texk/bibtex-x/bibtexu

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
##  $ make pbibtex-bib-wide SOURCE=somewhere/source INPUTS=anywhere
##
##  $ make bib SOURCE=somewhere/source INPUTS=anywhere
##  $ make bib-wide SOURCE=somewhere/source INPUTS=anywhere
##
##  $ make compare
##

bib: pbibtex-bib upbibtex-bib bibtexu-bib
bib-wide: pbibtex-bib-wide upbibtex-bib-wide bibtexu-bib-wide
p-bib: pbibtex-bib pbibtex-bib-wide
up-bib: upbibtex-bib upbibtex-bib-wide
bu-bib: bibtexu-bib bibtexu-bib-wide

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

pbibtex-bib-wide:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-p ;\
	  cp $$job.aux $$job-wide.aux ;\
	  max_print_line=399 ${PBIBTEX} $$job-wide ;\
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

upbibtex-bib-wide:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-up ;\
	  cp $$job.aux $$job-wide.aux ;\
	  max_print_line=399 ${UPBIBTEX} $$job-wide ;\
	done


### upLaTeX + BibTeXu

bibtexu-pre:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-bu ;\
	  ${UPLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{bibtexu}\input" jxampl ;\
	done

bibtexu-bib:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-bu ;\
	  ${BIBTEXU} $$job || test $$? = 1 ;\
	done

bibtexu-post:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-bu ;\
	  banner=`head -1 $$job.blg` ;\
	  ${UPLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{bibtexu}\def\banner{$$banner}\input" jxampl ;\
	  ${UPLATEX} -jobname=$$job "\def\bst{$$bst}\def\bibtex{bibtexu}\def\banner{$$banner}\input" jxampl ;\
	  ${DVIPDFMX} $$job ;\
	done

bibtexu-bib-wide:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  job=jxampl-$$bst-bu ;\
	  cp $$job.aux $$job-wide.aux ;\
	  max_print_line=399 ${BIBTEXU} $$job-wide || test $$? = 1 ;\
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

upbibtexe-bib-wide:
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  ref=jxampl-$$bst-p ;\
	  job=jxampl-$$bst-ue ;\
	  cp $$ref.aux $$job-wide.aux ;\
	  max_print_line=399 ${UPBIBTEX} -kanji-internal=euc $$job-wide ;\
	done
	for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do\
	  ref=jxampl-$$bst-p  ;\
	  job=jxampl-$$bst-ue ;\
	  diff -qs $$ref-wide.bbl $$job-wide.bbl ; \
	done

