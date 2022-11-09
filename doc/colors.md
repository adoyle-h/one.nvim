# Colors and Highlights

You can change the colors and highlights.

## Color Design Principles

- Subject color: blue
- Second color: green
- Search/Match color: orange

### Color Layers

The priority from high to low:

- [`config.colors`](lua/one/config/colors.lua)
- colors and highlights defined in each plugin
- [`colors/highlights`](lua/one/plugins/colors/highlights.lua)
-  colors and highlights defined in [theme plugin](lua/one/plugins/themes/init.lua)
- syntax highlights by nvim-treesitter

## The background, frontground, cursorline colors

Change basic colors via `config.colors`.

Default color configs is defined in [./lua/one/config/colors.lua](./lua/one/config/colors.lua).

```lua
require('one').setup {
  config = {
    colors = { -- basic colors
      white = '#BEC0C4', -- frontground
      black = '#15181D', -- background
      cursorLine = '#252931',
    },
  }
}
```

## The highlights for plugins

Override plugin highlights via `plugins`.

```lua
require('one').setup {
  plugins = {
    {
      'stevearc/aerial.nvim',
      highlights = {
        AerialLine = { bg = 'green' },
      }
    },
  },
}
```

## The syntax highlights

The syntax is parsed by [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter). The nvim-treesitter will set highlights for each syntax. See the [treesitter highlights](../lua/one/plugins/treesitter/highlights.lua) and [colors/highlights](lua/one/plugins/colors/highlights.lua).

Use `:TSHighlightCapturesUnderCursor` to view the highlight group of word under cursor.

### NOTE: these syntax highlights are disabled for treesitter

The `markdown` syntax highlights are disabled for treesitter (See `config.treesitter.highlight.disable`).
But its syntax parser is still working.
Its syntax highlights are defined in [lua/one/plugins/markdown/highlights.lua](lua/one/plugins/markdown/highlights.lua) .

The `help` syntax highlights are disabled for treesitter, while using nvim builtin highlights.

## Theme

Default theme is ['onedarkpro'](./lua/one/plugins/themes/onedarkpro.lua).

### Theme: onedarkpro

```lua
require('one').setup {
  config = {
    theme = {
      use = 'onedarkpro',
      -- The onedarkpro plugin provides four themes.
      onedarkpro = {
        theme = 'onedark', -- 'onelight', 'onedark_vivid', 'onedark_dark'

        -- You can override options
        -- Options see https://github.com/olimorris/onedarkpro.nvim#wrench-configuration
        colors = {},
        highlights = {},
        plugins = {},
        styles = {},
        options = {},
      }
    }
  },
}
```

### Theme: material

```lua
require('one').setup {
  config = {
    theme = {
      use = 'material',
      -- The material plugin provides five themes.
      material = {
        style = 'darker', -- 'darker', 'lighter', 'oceanic', 'palenight' 'deep ocean'
        -- Options see https://github.com/marko-cerovac/material.nvim
      }
    }
  },
}
```
