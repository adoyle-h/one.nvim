# Installation Failures

[English](./install-failed.md) | [中文](./install-failed.zh.md)

## ERROR [mason-tool-installer] luaformatter: failed to install

If you are using MacOS, try to install luarocks by `brew install luarocks`, or upgrade it.

Related Issues/Discussions: [#10](https://github.com/adoyle-h/one.nvim/issues/10)

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

### If `config.pluginManager.use = vim-plug`

- Run `:PlugInstall` to install all plugins in nvim. Repeat it util all plugins installed successfully.
- All plugines installed in `~/.local/share/nvim/plugins`. You can modify the plugin directory with the `CM.config.pluginManager['vim-plug'].pluginDir` option.

### If `config.pluginManager.use = packer`

- Run `:PackerSync` to install all plugins in nvim. Repeat it util all plugins installed successfully.
- All plugines installed in `~/.local/share/nvim/pack/packer`. **DO NOT MODIFY** the `config.pluginManager.packer.package_root` option, unless you completely know what you are doing. If the option modified and get any error, please don't ask me anything.
- These are two cache mechanisms created by [packer.nvim][] and [impatient.nvim][]. You may be trapped in weird exceptions. Try `:lua one.reset()` to remove all plugins and cached files.


<!-- links -->

[packer.nvim]: https://github.com/wbthomason/packer.nvim
[impatient.nvim]: https://github.com/lewis6991/impatient.nvim
