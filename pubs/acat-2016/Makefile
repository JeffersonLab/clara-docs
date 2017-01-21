CLARA_PAPER := acat-paper.pdf
CLARA_POSTER := acat-poster.pdf

all: paper poster

paper: $(CLARA_PAPER)

poster: $(CLARA_POSTER)

%.pdf: %.tex
	latexmk -pdf $<

clean:
	latexmk -C

.PHONY: all paper poster clean
