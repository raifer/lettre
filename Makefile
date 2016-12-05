SHELL=/bin/bash

LATEX=pdflatex
EDITOR ?= xdg-open

all : lettre.pdf lettre.txt
text : lettre.txt




# pdf
lettre.pdf : lettre.tex
	$(LATEX) lettre.tex

# text file
lettre.txt : lettre.pdf
	pdftotext -layout lettre.pdf

view:
	evince lettre.pdf &

read :
	$(EDITOR) lettre.txt &

clean clear:
	rm -rf auto *tns *-blx.bib *run.xml *.bcf *.aux *.bbl *.blg *.dvi *.toc *.log *.ps *.out *.lot *.lof *.glg *.glo *.gls *.xdy *.ist *~ $(TMPFILES)

clobber: clean
	rm -rf *.pdf *.txt
