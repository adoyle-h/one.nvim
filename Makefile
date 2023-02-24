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
	@$(MAKE) $(subst bump-,semver-,$@) > VERSION

.PHONY: changelog
# @desc Generate and update the CHANGELOG file
changelog:
	$(MAKE) CHANGELOG NEXT_VERSION=$(shell cat VERSION)
