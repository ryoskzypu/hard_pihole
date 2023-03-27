DESTDIR ?=
prog := hard_pihole
prefix := $(HOME)/.local
bindir := $(prefix)/bin
mandir := $(prefix)/share/man
bash_compdir := $(prefix)/share/bash-completion/completions

cfg_filename := $(prog).cfg
cfg_filedir := $(HOME)

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
		'  Installing $(prog) globally:'  \
		'    sudo make prefix=/usr/local install' \
		'' \
		'  Installing $(cfg_filename) in an specific dir:' \
		'    make cfg_filedir=/dir install-cfgfile' \
		'' \
		'Note:' \
		'  If prefix= or cfg_filedir= were used for installs, they should' \
		'  be used for the uninstall target.'


.PHONY: lint
lint:
	shellcheck --shell=bash "$(prog)" "$(prog).bash-comp" "$(cfg_filename)"

.PHONY: test
test:
	make -C test

.PHONY: install-cfgfile
install-cfgfile:
	@echo install -m 0755 -v $(cfg_filename) "$(cfg_filedir)/.$(cfg_filename)"

.PHONY: install
install: install-cfgfile
	@echo install -v -d "$(DESTDIR)$(mandir)/man1" && echo install -m 0644 -v $(prog).1 "$(DESTDIR)$(mandir)/man1/$(prog).1"
	@echo install -v -d "$(DESTDIR)$(bash_compdir)" && echo install -m 0644 -v $(prog).bash-comp "$(DESTDIR)$(bash_compdir)/$(prog)"
	@echo install -v -d "$(DESTDIR)$(bindir)" && echo install -m 0755 -v $(prog) "$(DESTDIR)$(bindir)/$(prog)"

.PHONY: uninstall
uninstall:
	@printf 'rm -vrf %s\n' \
		"$(cfg_filedir)/.$(cfg_filename)" \
		"$(DESTDIR)$(bindir)/$(prog)" \
		"$(DESTDIR)$(mandir)/man1/$(prog).1" \
		"$(DESTDIR)$(bash_compdir)/$(prog)"
