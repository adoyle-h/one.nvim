# FAQ

- [Installation Failures](./install-failed.md)

Always run `:checkhealth` to check problems.

## Syntax parsed errors, highlights errors, indent errors

These features are based on treesitter.

When you first install, check treesitter parsers installed via `:TSIntall`.

When you updated neovim or treesitter, run `:TSUpdate` to update all installed treesitter parsers to latest.

See [doc/treesitter.md](../treesitter.md) for details.

## Client quit with exit code and signal

If you see the notify message `Client <number> quit with exit code <number> and signal <number>`.

Open `:LspInfo` window to check the LSP clients. There may be some clients which no buffer attached.
Open `:Mason` window to reinstall or update the LSP client.
