PREFIX ?= $(HOME)/.local

INSTALLED_FILE = $(PREFIX)/bin/ry
LOCAL_BIN = ./bin/ry

install:
	cp -p ./bin/ry $(PREFIX)/bin/ry
	cp -p ./lib/ry.bash_completion $(PREFIX)/lib/ry.bash_completion
