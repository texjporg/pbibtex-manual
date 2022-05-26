#!/bin/sh


### platex & pbibtex

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-p
  banner=`head -1 $job.blg`
  platex -jobname=$job "\def\bst{$bst}\def\bibtex{pbibtex}\def\banner{$banner}\input" jxampl
  platex -jobname=$job "\def\bst{$bst}\def\bibtex{pbibtex}\def\banner{$banner}\input" jxampl
  dvipdfmx $job

done


### uplatex & upbibtex

for bst in jabbrv jplain jalpha junsrt jname jipsj tieice tipsj jorsj; do

  job=jxampl-$bst-up
  banner=`head -1 $job.blg`
  uplatex -jobname=$job "\def\bst{$bst}\def\bibtex{upbibtex}\def\banner{$banner}\input" jxampl
  uplatex -jobname=$job "\def\bst{$bst}\def\bibtex{upbibtex}\def\banner{$banner}\input" jxampl
  dvipdfmx $job

done

