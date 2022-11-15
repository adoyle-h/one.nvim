# treesitter

## checkhealth

Run `:checkhealth nvim-treesitter` to check.

https://github.com/nvim-treesitter/nvim-treesitter#troubleshooting

## treesitter parsers

If you don't know what is treesitter parser, read [this](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers).

If you want to remove all parsers, call `:TSUninstall all`.

If you want to reinstall a parser, call `:TSUninstall {language}` and `:TSInstall {language}`.

All parsers installed in `nvim-treesitter/parser/`. `:TSUninstall` will remove `nvim-treesitter/parser/{language}.so` file.
If you trapped in treesitter parsers, try to remove the `nvim-treesitter/parser-info/{language}.revision` as well.
