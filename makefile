# Makefile for compiling LaTeX documents

# Main LaTeX file
MAIN=main

# Output PDF
OUTPUT=the-pragmatic-programmer

# LaTeX command
LATEX=pdflatex

# BibTeX command
BIBTEX=bibtex

# Clean-up command
CLEAN=rm -f

# List of LaTeX auxiliary files to delete for 'make clean'
AUXFILES=*.aux *.log *.toc *.lof *.lot *.out *.bbl *.blg *.brf *.idx *.ilg *.ind *.thm

# Target 'all' will compile the document
all: $(OUTPUT).pdf

$(OUTPUT).pdf: $(MAIN).tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	mv $(MAIN).pdf $(OUTPUT).pdf

clean:
	$(CLEAN) $(AUXFILES)

distclean: clean
	$(CLEAN) $(OUTPUT).pdf

.PHONY: all clean distclean
