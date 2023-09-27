# Debug

## Where a mapping/command/autocommand was defined

- Open nvim with `-V` option. `nvim -V1`
- `:verbose` to see where a mapping/command/autocommand was defined. `:verbose map m`

https://github.com/nanotee/nvim-lua-guide/blob/master/README.md#debugging-lua-mappingscommandsautocommands

## Disable other plugins

Use the `onlyPlugins` option.

### NOTE

- plugin manager will be not disabled by `onlyPlugins`.

### To disable all plugins

```lua
require('one').setup {
	-- @param [opts.onlyPlugins] {string[]}
	-- It's useful for debug. Defaults to nil.
	-- If set empty table, all builtin and user-defined plugins are disabled.
	-- If set non-empty table, only these plugins are not disabled.
	onlyPlugins = {},
}
```

### To disable all plugins except these plugins

```lua
require('one').setup {
	-- @param [opts.onlyPlugins] {string[]}
	-- It's useful for debug. Defaults to nil.
	-- If set empty table, all builtin and user-defined plugins are disabled.
	-- If set non-empty table, only these plugins are not disabled.
	onlyPlugins = { 'tiagovla/scope.nvim', 'akinsho/bufferline.nvim' },
}
```

## Problem with highlights of treesitter

nvim-treesitter has many Breaking Changes.
Read the [Notice of Breaking Changes](https://github.com/nvim-treesitter/nvim-treesitter/issues/2293).
