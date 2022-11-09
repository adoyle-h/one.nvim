# Types

## PlugOpts

```lua
-- class PlugOpts {table} The plugin options
-- @prop [1] {string} The name of plugin. It must be first.
-- If the name format matches "repo/name", e.g. {'nvim-lua/plenary.nvim'},
-- the plugin manager (vim-plug/packer) will install the repo.
-- If the name has not "/", no repo installed. User can name this plugin with any characters.
--
-- @prop [desc] {string} Plugin Description.
-- @prop [disable] {boolean} If true, this Plugin will not be loaded. [Default: false]
-- @prop [tag] {string} tag of the repository to use
-- @prop [branch] {string} branch of the repository to use
-- @prop [commit] {string} commit of the repository to use
-- @prop [rtp] {string} Subdirectory that contains Vim plugin
-- @prop [as] {string} Use different name for the plugin
-- @prop [run] {string} Post-update hook (string or funcref)
-- @prop [on] {string[]} On-demand loading: Commands or <Plug>-mappings. [e.g. {'command'}]
-- @prop [ft] {string|string[]} On-demand loading: File types. [e.g. {'lua'}]
-- @prop [lock] {boolean} Do not update unless explicitly specified. [Default: false]
--
-- @prop [requires] {PlugOpts[]|string[]} requires these plugins
-- When one of required plugins is disabled or uninstalled,
-- current plugin and its "requires" and "deps" plugins will be disabled too.
-- NOTE: The plugin loaded order: "requires" plugins, "deps" plugins, current plugin.
--
-- @prop [deps] {PlugOpts[]|string[]} requires these plugins, but with weak dependent.
-- When one of required plugins is disabled or uninstalled, current will not be disabled.
-- NOTE: The plugin loaded order: "requires" plugins, "deps" plugins, current plugin.
--
-- @prop [setup] {function}
-- Specifies code to run before this plugin is loaded.
-- User should not require lua module in this function.
--
-- @prop [config] {function(config)} Put your code here. Like require('name').setup {config.PluginName}
-- Specifies code to run after this plugin is loaded.
-- User can require lua module in this function.
--
-- @prop [defaultConfig] {table|function(config)}
-- Set default config for current plugin.
-- User can require lua module in this function.
-- @prop defaultConfig[1] {string | string[]} Config key. If set {'plugin', 'path'}, the value store at `config.plugin.path`.
-- @prop defaultConfig[2] {table} config value, must be a table
--
-- @prop [highlights] {table|function(config)} Set highlight groups. Parameters refer to ":h nvim_set_hl"
-- @prop [signs] {table|function(config)} Set vim sign. Parameters refer to ":h sign_define"
-- @prop [keymaps] {table|function(config)} Parameters refer to ":h nvim_set_keymap"
-- @prop [commands] {table|function(config)} {['command-name'] = {}} Parameters refer to ":h nvim_create_user_command"
-- @prop [autocmds] {table|function(config)}
-- @prop [filetypes] {table|function(config)}
-- @prop [completions] {table|function(config)}
-- @prop [telescopes] {table|function(config)} Add telescope extensions
--
-- Supporting more options supported by plugin manager
-- packer: https://github.com/wbthomason/packer.nvim#specifying-plugins
-- vim-plug: https://github.com/junegunn/vim-plug#plug-options
```
