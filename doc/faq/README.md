# FAQ

## [Installation Failures](./install-failed.md)

Always run `:checkhealth` to check problems at first.

## Syntax parsed errors, highlights errors, indent errors

These features are based on treesitter.

When you first install, check treesitter parsers installed via `:TSIntall`.

When you updated neovim or treesitter, run `:TSUpdate` to update all installed treesitter parsers to latest.

See [doc/treesitter.md](../treesitter.md) for details.

## Code Jump/Code Lint/Code Format not work

Please check the nvim plugins of LSP/Linter/Formatter installed.

It's recommended to install LSP/DAP/Linter/Formatter by mason.nvim, which opened by `<M-m>` in one.nvim.

## Client quit with exit code and signal

If you see the notify message `Client <number> quit with exit code <number> and signal <number>`.

Open `:LspInfo` window to check the LSP clients. There may be some clients which no buffer attached.
Open `:Mason` window to reinstall or update the LSP client.

## I want the tabline looks like vscode style

See [this comment](https://github.com/adoyle-h/one.nvim/discussions/18#discussioncomment-6331752).
