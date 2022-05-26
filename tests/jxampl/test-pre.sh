#!/bin/sh


### platex & pbibtex

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-p
  platex -jobname=$job "\def\bst{$bst}\def\bibtex{pbibtex}\input" jxampl

done


### uplatex & upbibtex

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-up
  uplatex -jobname=$job "\def\bst{$bst}\def\bibtex{upbibtex}\input" jxampl

done

