# 颜色和高亮

[English](./colors.md) | [中文](./colors.zh.md)

你可以修改默认配色和高亮。

## 色彩设计原则

- 主色调：蓝色
- 副色调：绿色
- 搜索/匹配色：橙色

### 颜色层次

优先级从高到低：

- [`config.colors`](../lua/one/colors/display-p3.lua)
- 每个插件定义的颜色和高亮
- [`colors/highlights`](../lua/one/plugins/colors/highlights.lua)
- 在[主题插件](../lua/one/plugins/themes/init.lua)中定义的颜色和高亮
- 语法高亮由 nvim-treesitter 提供

## 色彩空间

什么是色彩空间？可参考[这篇文章](https://adoyle.me/Today-I-Learned/design/color-space.html)。

本项目的颜色是根据 [Display P3](https://www.color.org/chardata/rgb/DisplayP3.xalter) 色彩空间设计的。对于 MacOS 系统和 iTerm2 用户友好。

如果你的 nvim 配色看起来跟下图有点不一样。你的终端应该不是处于 Display P3 色彩空间。
你可以尝试 [sRGB 配色](lua/one/colors/srgb.lua)。

<img src="https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/one.nvim/colors.png" height="400px" />

色彩空间由终端应用程序和操作系统管理。您应该根据自己的环境选择合适的色彩空间。

当前 one.nvim 提供 [Display P3](../lua/one/colors/display-p3.lua) 和 [sRGB](../lua/one/colors/srgb.lua) 色彩预设。
默认使用 Display P3 预设。您可以参考下面的代码使用 sRGB 预设。

```lua
require('one').setup {
  config = {
    colors = require('one.colors.srgb')
  }
}
```

对于 Kitty 用户，应在 Kitty 配置中设置 [`macos_colorspace displayp3`](https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.macos_colorspace) 。或者设置 `macos_colorspace srgb`，并使用 sRGB 色彩预设。

对于 Windows 用户，请阅读 [Microsoft - About Color Management
](https://support.microsoft.com/en-us/windows/about-color-management-2a2ed8fa-cf09-83c5-e55c-d1428519f616) 和 [Windows Central - How to find the right color profile for your monitor using Windows 10](https://www.windowscentral.com/how-configure-correct-color-profile-your-monitor-windows-10)。(尽管目前 one.nvim 对 Windows 用户不起作用）。

## 背景色、前景色、光标颜色

通过配置项 `config.colors` 修改基本配色。

默认颜色配置定义在 [../lua/one/colors/display-p3.lua](../lua/one/colors/display-p3.lua)。

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

## 给插件设置高亮

通过 `plugins` 配置覆盖插件的高亮。

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

## 语法高亮

本项目高度依赖 [nvim-treesitter][]。The nvim-treesitter will set highlights for each syntax. See the [treesitter highlights](../lua/one/plugins/treesitter/highlights.lua) and [colors/highlights](../lua/one/plugins/colors/highlights.lua).

如果语法高亮失效，尝试重新安装你的 [treesitter parsers](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers)。阅读 [doc/treesitter.md](./treesitter.md) 查看如何排查问题。

### 注意：这些语法高亮对 treesitter 无效

treesitter 禁用了 `markdown` 语法高亮（参见 `config.treesitter.highlight.disable`）。
但它的语法解析器仍在工作。
它的语法高亮定义在 [lua/one/plugins/markdown/highlights.lua](../lua/one/plugins/markdown/highlights.lua) 中。

在使用 nvim 内置高亮时，`help` 语法高亮对 treesitter 无效。

## 主题

默认主题是 ['onedarkpro'](../lua/one/plugins/themes/onedarkpro.lua).

### 主题: onedarkpro

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

### 主题: material

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

### 禁用 one.nvim 主题

你可以 `config.theme.use = false` 禁用主题。

如果你更喜欢 [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)，按如下代码编辑你的 `init.lua`。

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

这个配置很简陋，需要你自己调整。



<!-- links -->

[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
