prog := hardph
DESTDIR ?=
PREFIX ?= $(HOME)/.local
bindir := $(PREFIX)/bin
mandir := $(PREFIX)/share/man
bash_compdir := $(PREFIX)/share/bash-completion/completions

CFGPATH ?= $(HOME)
cfg_filename := $(prog).cfg

.PHONY: all
all:
	@printf '%s\n' \
		'Usage:' \
		'  make lint         lint the scripts' \
		'  make install-cfg  install the config file' \
		'  make install      install the package' \
		'  make uninstall    uninstall the package' \
		'' \
		'Examples:' \
		'  $$ sudo make PREFIX=/usr/local install' \
		'    install $(prog) system-wide'  \
		'' \
		'  $$ make CFGPATH=/path install-cfg' \
		'    install $(cfg_filename) in custom path' \
		'' \
		'Note:' \
		'  The PREFIX and CFGPATH environment variables can be exported in' \
		'  the shell, hence set on the install and uninstall targets invocation.'


.PHONY: lint
lint:
	shellcheck --shell=bash "$(prog)" "$(prog).bashcomp"

.PHONY: test
test:
	make -C test

.PHONY: install-cfg
install-cfg:
	@install -m 0755 -v $(cfg_filename) "$(CFGPATH)/.$(cfg_filename)"

.PHONY: install
install: install-cfg
	@install -v -d "$(DESTDIR)$(mandir)/man1" && install -m 0644 -v $(prog).1 "$(DESTDIR)$(mandir)/man1/$(prog).1"
	@install -v -d "$(DESTDIR)$(bash_compdir)" && install -m 0644 -v $(prog).bashcomp "$(DESTDIR)$(bash_compdir)/$(prog)"
	@install -v -d "$(DESTDIR)$(bindir)" && install -m 0755 -v $(prog) "$(DESTDIR)$(bindir)/$(prog)"

.PHONY: uninstall
uninstall:
	@rm -vrf \
		"$(CFGPATH)/.$(cfg_filename)" \
		"$(DESTDIR)$(bindir)/$(prog)" \
		"$(DESTDIR)$(mandir)/man1/$(prog).1" \
		"$(DESTDIR)$(bash_compdir)/$(prog)"
