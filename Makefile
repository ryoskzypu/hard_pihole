DESTDIR ?=
prog := hard_pihole
prefix := $(HOME)/.local
bindir := $(prefix)/bin
mandir := $(prefix)/share/man
bash_compdir := $(prefix)/share/bash-completion/completions

cfg_filename := $(prog).cfg
cfg_path := $(HOME)

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
		'  $$ sudo make prefix=/usr/local install' \
		'    install $(prog) system-wide'  \
		'' \
		'  $$ make cfg_path=/path install-cfg' \
		'    install $(cfg_filename) in custom path' \
		'' \
		'Note:' \
		'  If prefix= or cfg_path= were used for installs, they must' \
		'  be used for the uninstall target.'


.PHONY: lint
lint:
	shellcheck --shell=bash "$(prog)" "$(prog).bash-comp"

.PHONY: test
test:
	make -C test

.PHONY: install-cfg
install-cfg:
	@install -m 0755 -v $(cfg_filename) "$(cfg_path)/.$(cfg_filename)"

.PHONY: install
install: install-cfg
	@install -v -d "$(DESTDIR)$(mandir)/man1" && install -m 0644 -v $(prog).1 "$(DESTDIR)$(mandir)/man1/$(prog).1"
	@install -v -d "$(DESTDIR)$(bash_compdir)" && install -m 0644 -v $(prog).bash-comp "$(DESTDIR)$(bash_compdir)/$(prog)"
	@install -v -d "$(DESTDIR)$(bindir)" && install -m 0755 -v $(prog) "$(DESTDIR)$(bindir)/$(prog)"

.PHONY: uninstall
uninstall:
	@rm -vrf \
		"$(cfg_path)/.$(cfg_filename)" \
		"$(DESTDIR)$(bindir)/$(prog)" \
		"$(DESTDIR)$(mandir)/man1/$(prog).1" \
		"$(DESTDIR)$(bash_compdir)/$(prog)"
