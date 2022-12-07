# Colors and Highlights

You can change the colors and highlights.

## Color Design Principles

- Subject color: blue
- Second color: green
- Search/Match color: orange

### Color Layers

The priority from high to low:

- [`config.colors`](../lua/one/colors/display-p3.lua)
- colors and highlights defined in each plugin
- [`colors/highlights`](../lua/one/plugins/colors/highlights.lua)
-  colors and highlights defined in [theme plugin](../lua/one/plugins/themes/init.lua)
- syntax highlights by nvim-treesitter

## Color Gamut

The colors are desiged based on [Display P3](https://www.color.org/chardata/rgb/DisplayP3.xalter) color gamut. It works for MacOS and iTerm2 users.

If your nvim colors looks different from below picture. Your terminal is not under Display P3 color gamut.
You may try [sRGB colors](../lua/one/colors/srgb.lua).

<img src="https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/colors.png" height="100px" />

The color gamut is managed by your terminal application and operator system.
You should choose the right color gamut for your environment.

Current one.nvim provides [Display P3](../lua/one/colors/display-p3.lua) and [sRGB](../lua/one/colors/srgb.lua) color presets.
And use Display P3 presets by default. You can use sRGB presets like below codes.

```lua
require('one').setup {
  config = {
    colors = require('one.colors.srgb')
  }
}
```

For Kitty users, you should set [`macos_colorspace displayp3`](https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.macos_colorspace) in kitty config. Or set `macos_colorspace srgb` and use the sRGB color presets.

For windows users, read [Microsoft - About Color Management
](https://support.microsoft.com/en-us/windows/about-color-management-2a2ed8fa-cf09-83c5-e55c-d1428519f616) and [Windows Central - How to find the right color profile for your monitor using Windows 10](https://www.windowscentral.com/how-configure-correct-color-profile-your-monitor-windows-10). (Even though one.nvim not work for windows users for current)

## The background, frontground, cursorline colors

Change basic colors via `config.colors`.

Default color configs is defined in [../lua/one/colors/display-p3.lua](../lua/one/colors/display-p3.lua).

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

The syntax is parsed by [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter). The nvim-treesitter will set highlights for each syntax. See the [treesitter highlights](../lua/one/plugins/treesitter/highlights.lua) and [colors/highlights](../lua/one/plugins/colors/highlights.lua).

Use `:TSHighlightCapturesUnderCursor` to view the highlight group of word under cursor.

### NOTE: these syntax highlights are disabled for treesitter

The `markdown` syntax highlights are disabled for treesitter (See `config.treesitter.highlight.disable`).
But its syntax parser is still working.
Its syntax highlights are defined in [lua/one/plugins/markdown/highlights.lua](../lua/one/plugins/markdown/highlights.lua) .

The `help` syntax highlights are disabled for treesitter, while using nvim builtin highlights.

## Theme

Default theme is ['onedarkpro'](../lua/one/plugins/themes/onedarkpro.lua).

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

### Disable one.nvim theme

You can disable theme by `config.theme.use = false`.

If you prefer [tokyonight.nvim](https://github.com/folke/tokyonight.nvim), edit your `init.lua` like below codes.

```lua
require('one').setup {
  config = {
    theme = { use = false },
  },

  plugins = {
    { 'onedarkpro', disable = true },

    {
      'folke/tokyonight.nvim',

      config = function(config)
        local conf = config.tokyonight
        vim.cmd('colorscheme ' .. conf.colorscheme)
        require('tokyonight').setup(conf.setup)
      end,

      defaultConfig = {
        'tokyonight',
        {
          colorscheme = 'tokyonight', -- https://github.com/folke/tokyonight.nvim#-usage
          setup = {}, -- https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration
        },
      },
    },
  },
}
```

But some places do not look good, that you need to solve them by yourself.
