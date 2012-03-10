PREFIX ?= $(HOME)/.local

INSTALLED_FILE = $(PREFIX)/bin/r
LOCAL_BIN = ./bin/r

install:
	cp ./bin/r $(PREFIX)/bin/r
	cp ./lib/r.bash_completion $(PREFIX)/lib/r.bash_completion
