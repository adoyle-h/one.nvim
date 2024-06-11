# Notice

## Lua 5.1

NVIM v0.10.0 use LuaJIT 2.1.1713773202, which full support Lua 5.1, optional support Lua 5.2+.

Refer to https://neovim.io/doc/user/lua.html#lua-intro

Read https://github.com/nanotee/nvim-lua-guide to learn nvim and lua.

## table.unpack

This project will set `table.unpack = unpack`.

## $VIMRUNTIME/filetype.vim won't be loaded

`$VIMRUNTIME/filetype.vim` won't be loaded. Filetype detected in [./lua/one/plugins/filetype.lua](./lua/one/plugins/filetype.lua)。
