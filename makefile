DEST_DIR :=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRC_DIR = themes/beamercolorthemeapertus.sty themes/beamerfontthemeapertus.sty themes/beamerinnerthemeapertus.sty themes/beamerthemeapertus.sty

all:	axiom_presentation.pdf

axiom_presentation.pdf: 
	cp -f $(SRC_DIR) $(DEST_DIR)
	pdflatex axiom_presentation.tex

clean:
	rm -r beamer* axiom_presentation.pdf


			
