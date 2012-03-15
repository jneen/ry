PREFIX ?= $(HOME)/.local

INSTALLED_FILE = $(PREFIX)/bin/ry
LOCAL_BIN = ./bin/ry

install:
	install -d $(PREFIX)/bin $(PREFIX)/lib
	install -C -m 0755 ./bin/ry $(PREFIX)/bin/ry
	install -C -m 0644 ./lib/ry.bash_completion $(PREFIX)/lib/ry.bash_completion
