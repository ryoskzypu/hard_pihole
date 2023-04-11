DESTDIR ?=
PREFIX ?= $(HOME)/.local
CFGPATH ?= $(HOME)

prog := hardph
cfgname := $(prog).cfg

bindir := $(PREFIX)/bin
mandir := $(PREFIX)/share/man
bash_compdir := $(PREFIX)/share/bash-completion/completions


.PHONY: all
all:
	@printf '%s\n' \
		'Usage:' \
		'  make install     install the package' \
		'  make install-cfg install the config file' \
		'  make lint        lint the scripts' \
		'  make uninstall   uninstall the package' \
		'' \
		'Examples:' \
		'  $$ sudo make PREFIX=/usr/local install' \
		'    install $(prog) system-wide'  \
		'' \
		'  $$ make CFGPATH=/path install-cfg' \
		'    install $(cfgname) in custom path' \
		'' \
		'Note:' \
		'  The PREFIX and CFGPATH environment variables can be exported in' \
		'  the shell, hence set on the install/uninstall targets invocation.'


.PHONY: lint
lint:
	shellcheck --shell=bash "$(prog)" "$(prog).bashcomp"

.PHONY: test
test:
	make -C test

.PHONY: install-cfg
install-cfg:
	@install -m 0755 -v $(cfgname) "$(CFGPATH)/.$(cfgname)"

.PHONY: install
install: install-cfg
	@install -v -d "$(DESTDIR)$(bindir)" \
		&& install -m 0755 -v $(prog) "$(DESTDIR)$(bindir)/$(prog)"
	@install -v -d "$(DESTDIR)$(mandir)/man5" \
		&& install -m 0644 -v $(cfgname).5 "$(DESTDIR)$(mandir)/man5/$(cfgname).5" \
		&& gzip "$(DESTDIR)$(mandir)/man5/$(cfgname).5"
	@install -v -d "$(DESTDIR)$(mandir)/man8" \
		&& install -m 0644 -v $(prog).8 "$(DESTDIR)$(mandir)/man8/$(prog).8" \
		&& gzip "$(DESTDIR)$(mandir)/man8/$(prog).8"
	@install -v -d "$(DESTDIR)$(bash_compdir)" \
		&& install -m 0644 -v $(prog).bashcomp "$(DESTDIR)$(bash_compdir)/$(prog)"

.PHONY: uninstall
uninstall:
	@rm -vrf \
		"$(DESTDIR)$(bindir)/$(prog)" \
		"$(CFGPATH)/.$(cfgname)" \
		"$(DESTDIR)$(mandir)/man5/$(cfgname).5.gz" \
		"$(DESTDIR)$(mandir)/man8/$(prog).8.gz" \
		"$(DESTDIR)$(bash_compdir)/$(prog)"
