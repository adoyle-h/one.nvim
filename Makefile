.PHONY: test
test:
	# nvim --headless -c "PlenaryBustedDirectory lua {timeout = 5000}"
	nvim --headless -c "lua require('plenary.test_harness').test_directory('lua', { timeout = 5000 })"

.PHONY: format
format:
	find ./lua -iname '*.lua' -exec lua-format {} -i \;

.PHONY: bump-major bump-minor bump-patch
bump-major:
	./tools/bump major

bump-minor:
	./tools/bump minor

bump-patch:
	./tools/bump patch

.PHONY: check-links
check-links:
	# https://github.com/tcort/markdown-link-check
	ag --md -l | xargs -n1 markdown-link-check

.PHONY: check-style
check-style:
	editorconfig-checker
