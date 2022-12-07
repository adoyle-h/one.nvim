.PHONY: test
test:
	# nvim --headless -c "PlenaryBustedDirectory lua {timeout = 5000}"
	nvim --headless -c "lua require('plenary.test_harness').test_directory('lua', { timeout = 5000 })"

.PHONY: bump-major bump-minor bump-patch
bump-major:
	./tools/bump major

bump-minor:
	./tools/bump minor

bump-patch:
	./tools/bump patch
