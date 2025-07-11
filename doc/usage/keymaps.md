# Default Keymaps

This document only list basic keymaps for novices.

Press `<space>k` to query all keymaps in nvim.
Or press `:h one-keymaps` to see the keymaps document.

## Keymaps Design Principles

- Prefixed `<leader>` (defaults `;`) to functions.
- Prefixed `<space>` to open/toggle window, and change mode.
- Prefixed `<M->` for shortcuts/toggle. Some keymaps can hold on.
- Prefixed `g` for goto/jump/search/lsp.
- Prefixed `[` or `]` for jump.
- Prefixed `<C-t>` for tabs.
- Prefixed `<C-w>` for windows.
- Normal characters for general skilled usages.

## General

- `<space>o` = Toggle outline
- `<space>O` = Toggle outline nav window
  - `?` in outline = Show outline keymaps
- `<space>P` = Show plugin status
- `<leader>e` = Refresh current buffer
- `<leader>w` = Save current buffer to disk
- `<M-g>` = Show absolute file path
- `<C-g>` = Show relative file path to CWD
- `<leader>l` = Toggle invisible characters (EOL, Tabs, Spaces... see :h lcs)
- `.` = Repeat last change. Also work in visual mode
- `<M-i>` = Increment word under cursor
- `<M-I>` = Decrement word under cursor
- `<leader>so` = Toggle scrolloff
- `<leader>sp` = Toggle spell-checking
- `<M-t>` = Translate text under cursor (support selection). You can also use `:Translate <lang>`. See [translate plugin](../../lua/one/plugins/translate.lua).

## Edit and Write

- `jk` = Exit from input mode
- `u` = Undo
- `U` = Redo
- `u` in visual selection = Characters to upper case
- `U` in visual selection = Characters to lower case
- `<space>u` = Toggle undo tree
- `<space><space>` = Insert a space at right position of cursor
- `[<space>` = Insert a space at left position of cursor
- `]<space>` = Insert a space at right position of cursor
- `~` = Character to upper case or lower case
- `<M-s>` = Spell suggestion
- `<space>z` = Toggle zen mode for writing
- `J` = Join lines into one
- `K` = Split current line on cursor
- `<M-CR>` in insert mode = Move cursor to next line

## Surround

See `:h nvim-surround.basics`.

- `ds[char]` = deleting the surrounding pair associated with `{char}`
- `cs{target}{replacement}` = changing the surrounding pair associated with `{target}` to a pair associated with `{replacement}`
- `cS{target}{replacement}` = the normal-mode operator is analogous to `cs`, but adds the replacement delimiter pair on new lines
- `vs[char]` = add delimiter pair associated with `{char}` around the cursor and visual selection
- `vgs[char]` = the normal-mode operator is analogous to `vs`, but adds the replacement delimiter pair on new lines
- `ys{motion}{char}` = surrounds a given motion or text-object with a delimiter pair associated with `{char}`
- `yss[char]` = the operator is a special case for `ys`, and operates on the current line via `yss[char]`, ignoring leading and trailing whitespace
- `yS[char]` = the operators are analogous to `ys`, but add the delimiter pair on new lines.
- `ySS[char]` = the operators are analogous to `yss`, but add the delimiter pair on new lines.

## Indent

- `>` = Increment indent
- `<` = Decrement indent

## Fold

- `<Tab>` = Toggle folding at current cursor
- `<M-Tab>` = Toggle all foldings with fold level of current cursor

## Copy and Paste

- `<leader>y` = Copy current line into system clipboard
- `<leader>y` in visual mode = Copy selected text into system clipboard
- `Y` = Copy text from cursor to line end
- `<leader>p` = Paste from vim clipboard
- `<leader>P` = Paste from system clipboard
- `<M-p>` = Toggle paste mode
- `<space>R` = List vim registers
- `<space>y` = List yank history
- `<C-r>"` in insert mode = Paste from vim clipboard (:h i_CTRL-R)

## Open

- `gx` = Open URL when cursor on link
- `gf` = Open file when cursor on filepath
- `<C-W>f` = Open file in split when cursor on filepath
- `<C-W>gf` = Open file in new tab when cursor on filepath

## Cursor Motion and Jump

- `fw` = Jump to the start of word (forward)
- `fb` = Jump to the start of word (back forward)
- `fe` = Jump to the end of word (forward)
- `fE` = Jump to the end of word (back forward)
- `fl` = Jump to line (skip whitespace and empty line)
- `fL` = Jump to line (include whitespace)
- `fa` = Jump to word matches beginning of input
- `fA` = Jump to word matches ending of input
- `f/` = Jump to word as you type
- `g[` = Jump to previous cursor position
- `g]` = Jump to next cursor position
- `<C-]>` = Jump to the definition of the keyword under the cursor. see `:h CTRL-]`
- `%` = Jump to matched pair
- `[%` = Jump to previous matched pair
- `]%` = Jump to next matched pair
- `:{number}` = Jump to line
- `ch` = Move cursor to parent node (treesitter)
- `cj` = Move cursor to next node (treesitter)
- `ck` = Move cursor to previous node (treesitter)
- `cl` = Move cursor to child node (treesitter)
- Emacs shortcuts like `<C-e>`, `<C-a>`, `<C-u>`, `<C-k>`, `<M-b>`, `<M-f>`...

## Select

- `<leader>sa` = Select all texts
- see `:h text-objects`
- `vaf` = Text-objects for function (Support by treesitter)
- `va%` = Text-objects for matched pairs
- `vat` = Text-objects for XML tag node
- `vin` = Text-objects for treesitter node
- `<M-v>` = Smart select the next closest text-objects
- `<M-V>` = Reverse selection of `<M-v>`

## Swap

- `<M-h>` = Swap current symbol under cursor with previous node (Note: cursor position affects swap position)
- `<M-l>` = Swap current symbol under cursor with next node (Note: cursor position affects swap position
- `<M-j>` = Swap current line with next line
- `<M-k>` = Swap current line with previous line

## Search

- `/` = Search next
- `?` = Search previous
- `<leader>C` = Clear search
- `<C-n>` = Search word under cursor (with `<` and `>` around the word)
- `<C-p>` = Reversed search word under cursor (with `<` and `>` around the word)
- `g<C-n>` = Search word under cursor (without `<` and `>` around the word)
- `g<C-p>` = Reversed search word under cursor (without `<` and `>` around the word)
- `<space>f` = Find files
- `<space>?` = Fuzzy find content in current buffer
- `<space>/` = Fuzzy find content in workspace. (Press `<C-'>` to toggle [live-grep-args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim#grep-argument-examples))
- `<leader>f` = Fuzzy find content in workspace (use CtrlSF)

## Highlight

- `<leader>k` = Toggle highlight of all matched words under cursor
- `[k` = Move to previous user highlighted word (cursor must be on highlighted word)
- `]k` = Move to next user highlighted word (cursor must be on highlighted word)
- `<leader>K` = Clear user highlighted words
- `<leader>h` = Show treesitter highlight group
- `<space>H` = Find highlight groups

## File Explorer

- `<space>m` = Close file explorer when it is opened. Otherwise, reveal current buffer in file explorer.
- `<space>M` = Reveal current buffer in file explorer.
- `<space>b` = Toggle buffers window
  - `?` in buffers window = Show buffers window keymaps
- `<space>g` = Toggle git files window
  - `?` in git files window = Show git files window keymaps
- `<space>,` = Open the yazi window at the current file
- `<space>.` = Open the yazi window in current working directory
- Keymaps in neo-tree window
  - `?` = Show file explorer keymaps
  - `j` = move cursor to next node
  - `k` = move cursor to previous node
  - `J` = move cursor to last sibling node
  - `K` = move cursor to first sibling node
  - `<C-j>` = move cursor to next sibling node
  - `<C-k>` = move cursor to previous sibling node
  - `<C-h>` = Change current work directory to upper
  - `<C-l>` = Change current work directory to the folder under cursor
  - `<C-r>` = Refresh
  - `<cr>` or `o` = Open file in current window, or toggle folder opened/collapsed
  - `q` = Close file explorer window
  - `H` = Toggle hidden and git-ignored files
  - `f` = Enter filter pattern
  - `/` = Enter live filter pattern
  - `F` or `<C-/>` = Clear filter
  - `C` = Close node
  - `D` = Fuzzy_finder_directory
  - `O` = Open file in system finder
  - `P` = Toggle preview
  - `R` = Refresh
  - `S` = Open split
  - `Z` = Expand all nodes
  - `[g` = Move to previous git modified file
  - `]g` = Move to next git modified file
  - `A` = Add folder
  - `a` = Add file or folder
  - `c` = Copy
  - `d` = Delete
  - `f` = Filter on submit
  - `m` = Move
  - `p` = Paste from clipboard
  - `q` = Close window
  - `r` = Rename
  - `s` = Open split
  - `t` = Open tabnew
  - `v` = Open vsplit
  - `x` = Cut to clipboard
  - `y` = Copy to clipboard
  - `z` = Close all nodes

## Pickers and Windows

- `<space>;` = Choose Telescope pickers
- `<space>p` = Find commands
- `<space>C` = Find command history
  - `<CR>` in picker = Execute command immediately.
  -	`<Ctrl-e>` in picker = Edit command in terminal mode.
- `<space>h` = Find vim help
- `<space>k` = Find keymaps
- `<space>S` = Find search history
- `<space>j` = Show jumplists
- `<space>v` = Find vim options
- `<space>r` = Show recently opened files
- `<space>N` = Find notifications (messages from `vim.notify` and `:Notify`)
- `<space>n` = Toggle messages window (Default use telescope, if you enabled noice plugin, it will use noice)
- `<space>t` = List all terminal windows
- `<space>T` = List todo comments
- `<space>ls` = Lists LSP document symbols in the current buffer
- `<space>lf` = List LSP document symbols which filtered by kinds in current buffer
- `<space>lS` = List LSP document symbols in the current workspace
- `<space>lF` = List LSP document symbols which filtered by kinds in current workspace
- `<space>?` = Fuzzy find content in current buffer
- `<space>/` = Fuzzy find content in workspace. (Press `<C-'>` to toggle [live-grep-args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim#grep-argument-examples))

## Telescope

In Telescope picker window.

- `?` in normal mode = Show keymaps of telescope
- `<C-j>` = Move to next selection
- `<C-k>` = Move to previous selection
- `<C-s>` = Open buffer in horizontal split window
- `<C-t>` = Open buffer in new tab
- `<C-b>` = Scroll results window page up
- `<C-f>` = Scroll results window page down
- `<M-h>` = Scroll results window left
- `<M-l>` = Scroll results window right
- `<C-u>` = Scroll preview window page up
- `<C-d>` = Scroll preview window page down
- `<M-j>` = Scroll preview window left
- `<M-k>` = Scroll preview window right
- `<C-y>` = Copy name of current selection
- `<M-y>` = Copy path of current selection
- `<M-a>` = Multi select all entries
- `<M-A>` = Drop all entries from the current multi selection
- `<Tab>` = Toggle current entry status for multi select
- `<C-a>` = Move cursor to ahead
- `<C-e>` = Move cursor to end
- `<C-h>` = Move cursor to left
- `<C-l>` = Move cursor to right

## Word Case

- `crm` = MixedCase
- `crc` = camelCase
- `crs` or `cr_` = snake_case
- `cru` = SNAKE_UPPERCASE
- `cr-` = dash-case
- `crk` = kebab-case
- `cr.` = dot.case
- `cr<space>` = space case

## Buffer Line

If bufferline plugin enabled:

- `<M-[>` = Select previous buffer
- `<M-]>` = Select next buffer
- `<leader>1` = Select 1st buffer
- `<leader>2` = Select 2nd buffer
- `<leader>3` = Select 3rd buffer
- `<leader>4` = Select 4th buffer
- ...
- `<leader>9` = Select 9th buffer
- `<leader>0` = Select last buffer

## Tabpage

- `<C-t>n` = Open new tab
- `<C-t>x` = Close tab
- `<C-t>o` = Close all other tabs
- `<C-t>-` = Go to previously focused tab
- `<M-[>` or `<C-t>k` = Select previous tab
- `<M-]>` or `<C-t>j` = Select next tab
- `<M-{>` or `<C-t>h` = Move current tab to previous
- `<M-}>` or `<C-t>l` = Move current tab to next
- `<leader>1` = Select the 1st tab
- `<leader>2` = Select the 2nd tab
- `<leader>3` = Select the 3rd tab
- ...
- `<leader>9` = Select the 9th tab
- `<leader>0` = Select the last tab

If bufferline plugin enabled, some keymaps will be overridden. See [Buffer Line](#buffer-line).

## Window

- `-` = Jump to window in current tab
- `<C-w><C-w>` = Choose window or tab via telescope picker
- `<]w>` = Focus to next window
- `<[w>` = Focus to previous window
- `<C-w>p` = Focus to last accessed window.
- `<C-w>q` = Close current window
- `<C-w>o` = Close all other windows
- `<C-w>|` = Open window (vsplit)
- `<C-w>\` or `<C-w>n` = Open window (split)
- `<C-w>s` = Copy window (split)
- `<C-w>v` = Copy window (vsplit)
- `<C-w>r` = Enter window resize mode
- `<C-w>h` = Focus to left window
- `<C-w>j` = Focus to bottom window
- `<C-w>k` = Focus to upper window
- `<C-w>l` = Focus to right window
- `<C-w>t` = Focus to top-left window.
- `<C-w>b` = Focus to bottom-right window.
- `<C-w>H` = Adjust window border to left (5 spaces)
- `<C-w>J` = Increment window height (3 spaces)
- `<C-w>K` = Decrement window height (3 spaces)
- `<C-w>L` = Adjust window border to right (5 spaces)
- `<C-w><` = Adjust window border to left (1 space)
- `<C-w>>` = Adjust window border to right (1 space)
- `<C-w>+` = Increment window height (1 space)
- `<C-w>-` = Decrement window height (1 space)
- `<C-w>t` = Move current window to new tab
- `<C-w>_` = Maximize window height
- `<C-w>=` = Make all windows (almost) equally high and wide, but use 'winheight' and 'winwidth' for the current window.
- `<C-w><C-H>` = move current window to left
- `<C-w><C-J>` = move current window to bottom
- `<C-w><C-K>` = move current window to top
- `<C-w><C-L>` = move current window to right
- `<C-w>m` = Start Win-Move mode
  - `h` or `<left>`    = Move window left
  - `j` or `<down>`    = Move window down
  - `k` or `<up>`      = Move window up
  - `l` or `<right>`   = Move window right
  - `H` or `<S-left>`  = Move window far_left
  - `J` or `<S-down>`  = Move window far_down
  - `K` or `<S-up>`    = Move window far_up
  - `L` or `<S-right>` = Move window far_right
  - `<ESC>` or `q` or `<C-c>` = Exit Win-Move mode
- `<C-w>M` = Start Win-Swap mode

## Scroll

- `G` = Scroll to top
- `gg` = Scroll to buttom
- `<C-y>` = Scroll up 10% of window
- `<C-e>` = Scroll down 10% of window
- `<C-u>` = Scroll up 50% of window
- `<C-d>` = Scroll down 50% of window
- `<C-b>` = Scroll page up
- `<C-f>` = Scroll page down
- `zt` = Scroll to window top
- `zz` = Scroll to window middle
- `zb` = Scroll to window buttom

## Terminal

- `jk` = Exit from terminal mode
- `<space>t` = List all terminal windows
- `<leader>tn` = Create a terminal
- `<leader>tt` = Toggle terminal
- `<leader>tk` = Kill terminal
- `<leader>ts` = Send current line or selected texts to terminal

## Coding

### Comments

- `gcc` or `<space>c` = Comment toggle current line
- `gcb` = Comment toggle current block
- `gcA` = Comment insert at the end of line
- `gcO` = Comment insert on the line above
- `gco` = Comment insert on the line below
- `gc<Enter>` = Comment toggle in current scope
- `gc<Motion>` = Comment toggle in `<Motion>` scope (see `:h text-objects`)

### Completion

- `<M-c>` = Abort completion
-	`<CR>` or `<C-o>` = Confirm selection
-	`<C-n>` = Select next completion. And select history next in cmdline
-	`<C-p>` = Select prev completion. And select history prev in cmdline
-	`<Up>` or `<S-Tab>` or `<C-k>` = Select prev completion
-	`<Down>` or `<Tab>` or `<C-j>` = Select next completion
-	`<C-f>` = Select page down
-	`<C-b>` = Select page up
-	`<C-u>` = Scroll preview up
-	`<C-d>` = Scroll preview down

### Diagnostic

- `<space>d` = Find diagnostics in current buffer
- `<space>D` = Find diagnostics in workspace
- `[d` = Move to the previous diagnostic in the current buffer
- `]d` = Move to the next diagnostic in the current buffer

### LSP and Diagnostic

- `<M-m>` = Toggle Mason window to install or uninstall lsp/dap/linter/formatter adapters
- `gi` = Show implementation about the symbol under cursor
- `gd` = Open float window to query the definition of the symbol under the cursor
- `gD` = Jump to the definition of the symbol under the cursor
- `gr` = Open float window to show references about the symbol under cursor
- `gR` = Show references about the symbol under cursor
- `gt` = Open float window to preview type definition about the symbol under cursor
- `gT` = Goto preview type definition about the symbol under cursor
- `<space>a` = Selects a code action available at the current cursor position.
- `<leader>r` = Rename all references to the symbol under the cursor.
- `gh` = Display hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.
  - `gh` in markdown files = Open a telescope picker to select a heading
- `gs` = Display signature information about the symbol under the cursor in a floating window.
- `<C-s>` in insert mode = Toggle signature on and off in insert mode.

## Format

- `==` = vim default `==`. See `:h ==`
- `<M-=>` = Format a buffer using the attached language server clients. (format will be trigger when write buffer to disk)
- `<M-=>` in selection = Format selected texts using the attached language server clients.

## Diff

- `<leader>df` = :diffthis
- `<leader>do` = :diffoff
- `<leader>d1` = :diffget LOCAL
- `<leader>d2` = :diffget REMOTE
- `<leader>d3` = :diffget BASE

## Markdown

- `gh` in markdown files = Open a telescope picker to select a heading
- `<M-b>` in visual mode = bold selected text (add surrounding pair with `**`)
- `<M-B>` = unbold text (remove surrounding pair with `**`)
- `sl` in visual mode = add link to text from system clipboard
- `sL` in visual mode = add link to text from nvim clipboard
- `dsl` = remove markdown link

## DAP

- `<F9>` = Continue
- `<F10>` = Step over
- `<F11>` = Step into
- `<F12>` = Step out
- `<leader>db` = Toggle breakpoint
- `<leader>dB` = Set breakpoint with condition
- `<leader>dp` = Set breakpoint with log message
- `<leader>dr` = Open REPL
- `<leader>dl` = Run last

## Git

- `<leader>G` = Open Gitsigns window
- `<leader>gg` = Open lazygit window

## Gutter

- `<leader>N` = Toggle relative/absolute number gutter
- `<leader>L` = Toggle linenumber gutter

## Marks

- `mm` = Set mark
- `m,<character>` = Set mark with character
- `ml` = List marks in current buffer
- `mL` = List all marks
- `md` = Remove marks in current cursor line
- `mD` = Remove all marks in current buffer
- `mj` = Move to next mark
- `mk` = Move to previous mark
- `m0` ~ `m9` = Set bookmarks
- `mbl` = List bookmarks
- `mbd` = Remove bookmark

## Trouble

- `<Enter>` in trouble window = jump to file
- `o` in trouble window = jump to file and auto close trouble window (See https://github.com/folke/trouble.nvim/issues/15)

## Message

- `<space>N` = Find notifications (messages from `vim.notify` and `:Notify`)
- `<space>n` = Toggle messages window (Default use telescope, if you enabled noice plugin, it will use noice)
- `<M-n>` = Clean all visible messages

## AI

- `<leader>m` = Toggle MCPHub
- `<leader>aa` = avante: ask
- `<leader>af` = avante: focus
- `<leader>at` = avante: toggle
- `<leader>aS` = avante: stop
- `<leader>ae` = avante: edit
- `<leader>ar` = avante: refresh
- `<leader>a?` = avante: select model
- `<leader>ad` = avante: toggle debug
- `<leader>ah` = avante: select history
- `<leader>an` = avante: create new ask
- `<leader>an` = avante: create new ask
- `<leader>aR` = avante: display repo map
- `<leader>as` = avante: toggle suggestion
- `<leader>aB` = avante: add all open buffers
- `<leader>ac` = avante: add current buffer to file selector

## Uncategory

- `<leader>cr` = Send request in HTTP file (NTBBloodbath/rest.nvim)
- `<leader>cp` = Open a color picker
