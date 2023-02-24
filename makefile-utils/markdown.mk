.PHONY: md-check-links
md-check-links: LYCHEE_OPTS ?= --exclude ./makefile-utils --exclude-mail --timeout 3 -r 3 --exclude-link-local --insecure
# @desc Check dead links in markdown files
md-check-links:
ifeq (, $(shell which lychee))
	$(error "Not found lychee in PATH. Please install it by yourself. See https://github.com/lycheeverse/lychee")
endif
	@lychee $(LYCHEE_OPTS) .
