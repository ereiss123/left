NAME = slides
INSTALL_PATH_PDF = ~/ownCloud/slides/
INSTALL_PATH_HTML = left.engr.usu.edu:/var/www/slides/template

all: $(NAME).pdf $(NAME).html

MAKE=/usr/bin/make
PANDOC=/usr/local/bin/pandoc
MATHLIB=--katex

FLAGS = -s \
	-f markdown+implicit_figures+link_attributes+citations \
	--filter pandoc-xnos\
	-M xnos-capitalise=true\
	--bibliography=bibliography.bib\
	--csl=bibliography.csl\
	--citeproc


FLAGS_SLIDES_PDF = -s \
	-f markdown+implicit_figures+link_attributes+raw_tex \
	-t beamer -i\
	--template=beamer_template.latex\
	--lua-filter left_slide_filter.lua

FLAGS_SLIDES_HTML = -s \
	-f markdown+implicit_figures+link_attributes+raw_tex \
	--columns=10 -t slidy -i --css=slides.css -s $(MATHLIB)\
	--template=slide_template.html\
	--lua-filter left_slide_filter.lua



$(NAME).pdf: $(sources) $(NAME).md
	$(PANDOC) $(FLAGS_SLIDES_PDF) $(NAME).md -o $@

$(NAME).tex: $(sources) $(NAME).md
	$(PANDOC) $(FLAGS_SLIDES_PDF) $(NAME).md -o $@

$(NAME).html: $(sources) $(NAME).md
	$(PANDOC) $(FLAGS_SLIDES_HTML)  $(NAME).md -o $@

install: 
	scp -r ./* $(INSTALL_PATH_HTML)
	scp $(NAME).pdf $(INSTALL_PATH_PDF)

figures:
	$(MAKE) -C figures
