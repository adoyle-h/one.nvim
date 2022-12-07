# Snippets

By default every `snippets` directory in runtimepath will be searched for snippets.
See `:h rtp` and [nvim-snippy](https://github.com/dcampos/nvim-snippy)

## How to add snippets

`snippets/<filetype>.snippets` file will be autoloaded when the filetype matched.
`snippets/_.snippets` will be autoloaded for all filetypes.

The snippet syntax follows [SnipMate](https://github.com/garbas/vim-snipmate/blob/master/doc/SnipMate.txt#L309).

Other details see https://github.com/dcampos/nvim-snippy#adding-snippets .
