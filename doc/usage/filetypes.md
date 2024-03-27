# FileTypes

## FileType Detection

User can change the filetype detection by `config.filetype`.

The options refer to `:h vim.filetype.add`.

```lua
require('one').setup {
  config = {
    filetype = {
      -- Set the filetype based on file extension
      extension = {
        -- *.cocoascript files set filetype javascript
        cocoascript = 'javascript',
        bats = 'sh',
      },

      -- Set the filetype based on filename
      filename = { bash_profile = 'sh', profile = 'sh' },

      pattern = {
        -- Set the filetype of any full filename matching the regex to gitconfig
        ['.*git/config'] = 'gitconfig',
        ['Dockerfile*'] = 'dockerfile',
        ['*.dockerfile'] = 'dockerfile',
      },
    },
  },
```

## FileType Autocmd

Run custom function when vim buffer loaded for specific filetype.

```lua
require('one').setup {
  plugins = {
    filetypes = {
      -- <filetype> = function() { ... }

      markdown = function()
        vim.keymap.set('n', 'gh', ':Telescope heading<cr>',
          { silent = true, desc = 'Jump to heading', buffer = true })
      end,
    }
  },
}
```
