# Installation Failures

[English](./install-failed.md) | [中文](./install-failed.zh.md)

Always run `:checkhealth` to check problems.

## ERROR [mason-tool-installer] luaformatter: failed to install

If you are using MacOS, try to install luarocks by `brew install luarocks`, or upgrade it.

If missing `cmake`, may install luaformatter failed.

If luarocks reports `Failed downloading manifest` when installing luaformatter, upgrade your local `wget` to the latest version and try again.

Related Issues/Discussions: [#10](https://github.com/adoyle-h/one.nvim/issues/10) [#14](https://github.com/adoyle-h/one.nvim/issues/14)

## The default theme looks not so good, tokyonight is more beautiful.

Related Issues/Discussions: [#2](https://github.com/adoyle-h/one.nvim/issues/2)

## How can I disable the 'format code on save"

Related Issues/Discussions: [#6](https://github.com/adoyle-h/one.nvim/discussions/6)

## Plugins Installed Failed

### If `config.pluginManager.use = lazy` (by default)

- Run `:Lazy install` to install all plugins in nvim. Repeat it util all plugins installed successfully.
- Check plugins in `~/.local/share/nvim/plugins`. If the plugin folder is empty except .git files. you should delete the plugin folder and reinstall it.
  - `:Lazy home` or press `<space>P` to open the lazy window. Move cursor to the plugin and press `x` to delete. And press `i` to re-install this plugin.
  - It is a fault of lazy.nvim, see [the issue](https://github.com/folke/lazy.nvim/issues/224#issuecomment-1367108251) for details.


<!-- links -->

[packer.nvim]: https://github.com/wbthomason/packer.nvim
