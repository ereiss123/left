PROJECT_NAME=template

MATHLIB=--katex
PANDOC_OPTIONS=-f markdown+implicit_figures+pipe_tables --columns=10

INSTALL_PATH=/var/www/courses/5420/
SERVER=left.engr.usu.edu
UNAME=winstead

all: html

pdf: $(PROJECT_NAME).pdf
html: $(PROJECT_NAME).html 


$(PROJECT_NAME).pdf: $(PROJECT_NAME).md metadata.yaml
	pandoc $(PANDOC_OPTIONS) -t beamer -o $@ metadata.yaml $<

$(PROJECT_NAME).html: $(PROJECT_NAME).md  metadata.yaml
	pandoc $(PANDOC_OPTIONS)  -t slidy -s $(MATHLIB) -o $@ metadata.yaml $<

install: html
	export PROJECT_NAME
	export SERVER
	export UNAME
	export INSTALL_PATH
	scp $(PROJECT_NAME).html $(UNAME)@$(SERVER):$(INSTALL_PATH)/$(PROJECT_NAME)/
	make -C figures install
