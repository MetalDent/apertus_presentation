DEST_DIR :=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRC_DIR = themes/beamercolorthemeapertus.sty themes/beamerfontthemeapertus.sty themes/beamerinnerthemeapertus.sty themes/beamerthemeapertus.sty

all:
	cp -f $(SRC_DIR) $(DEST_DIR)
	rubber -d axiom_presentation.tex

clean:
	rm -rf beamer* axiom_presentation.pdf *.aux *.log *.nav *.out *.snm *.toc
