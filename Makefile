include ./makefile-utils/*.mk
.DEFAULT_GOAL := help

.PHONY: test
test:
	# nvim --headless -c "PlenaryBustedDirectory lua {timeout = 5000}"
	nvim --headless -c "lua require('plenary.test_harness').test_directory('lua', { timeout = 5000 })"

.PHONY: format
# @desc Format all lua files
format:
	find ./lua -iname '*.lua' -exec lua-format {} -i \;

.PHONY: check-style
# @desc Using editorconfig-checker to check code style
check-style:
	editorconfig-checker

# @target bump-major  bump major version (x)
# @target bump-minor  bump minor version (y)
# @target bump-patch  bump patch version (z)
BUMP_TARGETS := $(addprefix bump-,major minor patch)
.PHONY: $(BUMP_TARGETS)
$(BUMP_TARGETS):
	@$(MAKE) -s $(subst bump-,semver-,$@) > VERSION
	@$(MAKE) -s changelog
	@git add .
	@git commit -m "bump: $(subst bump-,,$@) version"
	@$(MAKE) -s new-tag

.PHONY: new-tag
new-tag:
	@git tag v$(shell cat VERSION)

.PHONY: changelog
# @desc Generate and update the CHANGELOG file
changelog:
	$(MAKE) -s CHANGELOG NEXT_VERSION=$(shell cat VERSION)

.PHONY: vimdoctags
vimdoctags:
	@nvim --cmd 'helptags ./doc/' --cmd 'q!'
	@echo Generated: ./doc/tags
