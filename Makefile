test:
	# nvim --headless -c "PlenaryBustedDirectory lua {timeout = 5000}"
	nvim --headless -c "lua require('plenary.test_harness').test_directory('lua', { timeout = 5000 })"
