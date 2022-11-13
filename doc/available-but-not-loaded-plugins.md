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
  - [profiling](../lua/one/plugins/profiling.lua)
  - [funny](../lua/one/plugins/funny.lua)
  - [zk](../lua/one/plugins/zk.lua)
  - [node](../lua/one/plugins/node/init.lua)
  - [curl](../lua/one/plugins/curl.lua)
  - [latex](../lua/one/plugins/latex.lua)
  - [calendar](../lua/one/plugins/calendar.lua)
  - [todo](../lua/one/plugins/todo.lua)
  - [zen](../lua/one/plugins/zen.lua)
  - [mark](../lua/one/plugins/mark.lua)
  - [bookmark](../lua/one/plugins/bookmark.lua)
