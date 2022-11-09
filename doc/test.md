# How to test

## Write Unit Test

Write unit test file which name suffixed with "_spec.lua" in same directory with source file.

## Excute Unit Test

Just run `make test` to excute unit test.

If you want more operations, read below sections.

### Excute Specific Unit Test

Open unit test file in nvim. Run `:TestLuaSpec` to run unit test.

### Excute Unit Tests in Directory

To run a whole directory "./lua" from the command line.

```sh
nvim --headless -c "PlenaryBustedDirectory lua"
```

### Headless Test Options

```sh
nvim --headless -c "lua require('plenary.test_harness').test_directory('lua', { timeout = 5000 })"
```

The second argument is a Lua option table with the following fields:

- minimal_init: specify an init.vim to use for this instance, uses --noplugin
- minimal: uses --noplugin without an init script (overrides minimal_init)
- sequential: whether to run tests sequentially (default is to run in parallel)
- keep_going: if sequential, whether to continue on test failure (default true)
- timeout: controls the maximum time allotted to each job in parallel or sequential operation (defaults to 50,000 milliseconds)

## Mock and Assert

See [Test Guide](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) for mocking and assert.
