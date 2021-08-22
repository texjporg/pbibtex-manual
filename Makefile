DOCTARGET = pbibtex-manual
# following documents are not maintained anymore:
#   jbibtex jbtxdoc jbtxhak
PDFTARGET = $(addsuffix .pdf,$(DOCTARGET))
DVITARGET = $(addsuffix .dvi,$(DOCTARGET))
KANJI = -kanji=utf8
#FONTMAP = -f ipaex.map -f ptex-ipaex.map
FONTMAP = -f haranoaji.map -f ptex-haranoaji.map -f otf-haranoaji.map
TEXMF = $(shell kpsewhich -var-value=TEXMFHOME)
LTX = platex $(KANJI)
DPX = dvipdfmx $(FONTMAP)

default: $(DVITARGET)
all: $(PDFTARGET)

.SUFFIXES: .tex .dvi .pdf
.tex.dvi:
	$(LTX) $<
	$(LTX) $<
	$(LTX) $<
	rm -f *.aux *.log *.toc
.dvi.pdf:
	$(DPX) $<

.PHONY: install clean
install:
	mkdir -p ${TEXMF}/doc/ptex/pbibtex-manual
	cp ./LICENSE ${TEXMF}/doc/ptex/pbibtex-manual/
	cp ./README* ${TEXMF}/doc/ptex/pbibtex-manual/
	cp ./*.tex ${TEXMF}/doc/ptex/pbibtex-manual/
	cp ./*.pdf ${TEXMF}/doc/ptex/pbibtex-manual/
clean:
	rm -f $(DVITARGET) $(PDFTARGET)
