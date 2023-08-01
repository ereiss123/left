GRAPHICS=*.gif *.GIF *.svg *.png *.PNG *.jpg *.JPG *.jpeg *.JPEG

LIBGS=/usr/local/Cellar/ghostscript/9.26/lib/libgs.dylib

SRC=$(wildcard *.tex)
PNG=$(SRC:.tex=.png)
SVG=$(SRC:.tex=.svg)
DVI=$(SRC:.tex=.dvi)

all: png dvi svg

png: $(PNG)
dvi: $(DVI)
svg: $(SVG)


%.png: %.tex
	tikz2png.sh $<


%.dvi: %.tex fig_preamble.latex
	latex -jobname=$* "\input{fig_preamble.latex} \begin{document} \input{$<} \end{document}"

%.svg: %.dvi
	dvisvgm --libgs=$(LIBGS) -n -TS2,2 $<

install:
	for y in `for x in $(GRAPHICS); do find . -name $x; done`; do scp $y $(USERNAME)@$(SERVER):$(INSTALL_PATH)/$(PROJECT_NAME)/figures
