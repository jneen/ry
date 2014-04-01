RY_PREFIX ?= $(HOME)/.local
PREFIX ?= $(RY_PREFIX)

BASH_COMPLETIONS_DIR ?= $(PREFIX)/share/bash-completion/completions
ZSH_COMPLETIONS_DIR ?= $(PREFIX)/share/zsh/site-functions

INSTALLED_FILE = $(PREFIX)/bin/ry
LOCAL_BIN = ./bin/ry

.PHONY: install install-bin install-completions
install: install-bin install-completions

install-bin:
	install -d $(PREFIX)/bin $(PREFIX)/lib
	install -C -m 0755 ./bin/ry $(PREFIX)/bin/ry

install-completions:
	install -d $(BASH_COMPLETIONS_DIR)
	install -C -m 0644 ./share/ry.bash_completion $(BASH_COMPLETIONS_DIR)/_ry
	install -d $(ZSH_COMPLETIONS_DIR)
	install -C -m 0644 ./share/ry.zsh_completion $(ZSH_COMPLETIONS_DIR)/_ry
