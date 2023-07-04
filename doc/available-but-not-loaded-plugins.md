# Available but not loaded plugin list

For reduce installing and loading time, some plugins are available but disabled or not loaded by default.
You can enable them as required.

## How to enable these plugins

```lua
require('one').setup {
  plugins = function(load, config)
    -- Load the builtin plugins
    return {
      load('profiling'),
      load('funny', { disable = true }), -- You can pass options to override the default options of plugin.
      load('noice'),
    }
  end
}
```

## Not-loaded Plugin List

- Disabled
  - [noice](../lua/one/plugins/noice.lua)
- Not Included
  - [funny](../lua/one/plugins/funny.lua)
  - [profiling](../lua/one/plugins/profiling.lua)
  - [zk](../lua/one/plugins/zk.lua) : the [zk](https://github.com/mickael-menu/zk) plain text note-taking assistant.
  - [node](../lua/one/plugins/node/init.lua): Plugins for nodejs develop
  - [curl](../lua/one/plugins/curl.lua)
  - [latex](../lua/one/plugins/latex.lua)
  - [calendar](../lua/one/plugins/calendar.lua)
  - [todo](../lua/one/plugins/todo.lua)
  - [zen](../lua/one/plugins/zen.lua): Zen Mode
  - [mark](../lua/one/plugins/mark.lua)
  - [bookmark](../lua/one/plugins/bookmark.lua)
  - [hex](../lua/one/plugins/hex.lua): hex dump and editing
