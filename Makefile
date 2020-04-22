DEST_DIR :=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRC_DIR = themes/beamercolorthemeapertus.sty themes/beamerfontthemeapertus.sty themes/beamerinnerthemeapertus.sty themes/beamerthemeapertus.sty

all:
	cp -f $(SRC_DIR) $(DEST_DIR)
	rubber -d axiom_beta.tex
	rubber -d axiom_remote.tex

clean:
	rm -rf beamer* *.aux *.log *.nav *.out *.snm *.toc
