.DEFAULT_GOAL := check
.NOTPARALLEL:
EMACS ?= emacs
MODULE_DIRS := $(shell python3 -c 'import json; print(" ".join(json.load(open("workspace.json"))["repositories"]))')

.PHONY: structure-check setup-hooks compile test check api-check clean
structure-check:
	python3 scripts/check-repository.py
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" structure-check EMACS="$(EMACS)"; done
setup-hooks:
	git config --local core.hooksPath .githooks
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" setup-hooks; done
compile:
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" compile EMACS="$(EMACS)"; done
test:
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" test EMACS="$(EMACS)"; done
check: structure-check
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" check EMACS="$(EMACS)"; done
api-check:
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" api-check EMACS="$(EMACS)"; done
clean:
	@set -e; for repo in $(MODULE_DIRS); do $(MAKE) -C "$$repo" clean; done
