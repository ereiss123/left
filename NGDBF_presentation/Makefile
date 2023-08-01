PROJECT_NAME=NGDBF_Presentation

MATHLIB=--katex
PANDOC_OPTIONS=-f markdown+implicit_figures+pipe_tables --columns=10

INSTALL_PATH=~/public_html
SERVER=genesys.bluezone.usu.edu
UNAME=err470

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
