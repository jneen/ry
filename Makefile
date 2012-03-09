PREFIX ?= $(HOME)/.local


INSTALLED_FILE = $(PREFIX)/bin/r
LOCAL_BIN = ./bin/r

install: $(INSTALLED_FILE)

$(INSTALLED_FILE): $(LOCAL_BIN)
	install $^ $@
