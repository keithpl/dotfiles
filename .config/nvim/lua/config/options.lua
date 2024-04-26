-----------------------
-- Editor Appearance --
-----------------------

-- Enable 24-bit RGB color in the text user interface.
vim.opt.termguicolors = true

-- Adjust the default color groups for a dark inherited background color.
vim.opt.background = "dark"

-- Print ansbolute line numbers by default, not line numbers relative to the
-- current cursor position.
vim.opt.number = true
vim.opt.relativenumber = false

-- Don't show the current mode, the status line will take care of this.
vim.opt.showmode = false

-- Do not display a command-line unless it is being used.
vim.opt.cmdheight = 0

-- Use a global status line.
vim.opt.laststatus = 3

-- Always draw the signcolumn.
vim.opt.signcolumn = "yes"

-- Highlight the current text line of the cursor.
vim.opt.cursorline = true

-- Draw a screen column at 81 character widths.
vim.opt.colorcolumn = "81"

-- Represent certain whitespace characters with other characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
    tab = "▸·",
    trail = "~",
    extends = "→",
    precedes = "←",
    nbsp = "␣"
}

-- Enable pseudo-transparency for the popup menu and set opacity percentage.
vim.opt.pumblend = 10

-- Set the maximum number of items to show in the popup menu.
vim.opt.pumheight = 10

---------------------
-- Editor Behavior --
---------------------

-- Enable mouse support in all modes.
vim.opt.mouse = "a"

-- Do not beep or flash the screen for error messages.
vim.opt.errorbells = false

-- Sync the operating system and neovim clipboard by default.
vim.opt.clipboard = "unnamedplus"

-- Visually indent every wrapped line with the same level of indentation
-- as the beginning of that line.
vim.opt.breakindent = true

-- Configure insert mode completion, do not automatically select or insert
-- any text without the user making a selection from the menu.
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

-- Shorten some messages and potentially avoid hit-enter prompts.
vim.opt.shortmess:append({
    c = true, -- Don't print ins-completion-menu messages.
    C = true  -- Don't print messages while scanning for ins-completion.
})

-- Complete longest comment string, then list alternatives in 'wildmenu'.
vim.opt.wildmode = { "longest:full", "full" }

-- Do not automatically wrap lines longer than the width of the current window.
vim.opt.wrap = false

-- Set update time for CursorHold autocommand event, in milliseconds.
vim.opt.updatetime = 250

-- Set time to wait for a mapped sequence to complete, in milliseconds.
vim.opt.timeoutlen = 300

-- Configure new veritcal splits to open below the current window, and new
-- horizonal splits to open to the right of the current window.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Preview the effects of substitutions live, in a new split.
vim.opt.inccommand = "split"

-- Minimum number of screen lines, 'scrolloff', and screen columns,
-- 'sidescrolloff', to keep around the cursor. Minimum columns are only
-- maintained when 'nowrap' is set.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4

---------------------
-- Text Formatting --
---------------------

-- Configure sane defaults for automatic text formatting.
-- See `:help fo-table`
vim.opt.formatoptions:append({
    a = false, -- Disable automatic formatting of paragraphs.
    o = false, -- Don't insert comment leaders after 'o' or 'O' in normal mode.
    t = false, -- Don't auto-wrap text using 'textwidth'.
    ["2"] = false, -- Don't support first line paragraph indentation.

    c = true, -- Auto-wrap comments using 'textwidth', insert a comment leader.
    j = true, -- Remove a comment leader when joining lines, if possible.
    l = true, -- Do not automatically break long lines in insert mode.
    q = true, -- Allow formatting of comments with "gq".
    r = true  -- Automatically insert a comment leader after pressing <enter>
              -- in insert mode.
})

-- Maximum width of text that is being inserted, does not apply to code when
-- 't' is removed from 'formatoptions'.
vim.opt.textwidth = 80

-- By default, do not replace inserted <tab> characters with spaces.
vim.opt.expandtab = false

-- By default, (auto)indentation will shift input a width of eight characters.
vim.opt.shiftwidth = 8

-- By default, a <tab> character shall be drawn with a width of eight
-- characters.
vim.opt.tabstop = 8

-- Enable the built-in default autoindent rules, apply the indentation of the
-- current line to the next.
vim.opt.autoindent = true

-- Do not use 'cindent' or 'smartindent' syntax-aware indentation by default,
-- filetype plugins should enable these as needed.
-- See `help cinoptions-values`
vim.opt.cindent = false
vim.opt.cinoptions = "(0:0"
vim.opt.smartindent = false

-- Allow the cursor to be positioned where no actual text is present, only
-- in visual block mode.
vim.opt.virtualedit = "block"

---------------------
-- Search Behavior --
---------------------

-- Ignore case in patterns unless \C or at least one capital letter appears
-- in the search pattern.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Explicitly enforce the 'magic' default for special characters in search
-- patterns.
-- See `:help /magic`
vim.opt.magic = true

-- Highlight all of the matches from the previous search pattern.
vim.opt.hlsearch = true

-- While typing a search command, highlight where the pattern matches
-- incrementally, as it is typed.
vim.opt.incsearch = true

-----------------------------
-- File Saving and History --
-----------------------------

-- Automatically save undo history, up to 10000 changes, to an undo file when
-- writing a buffer to a file. Write the undo files in "$XDG_STATE_HOME/undo".
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo/"

-- Automatically write the contents of the file, if it has been modified,
-- on certain events.
vim.opt.autowrite = true

-- Do not create a backup before overwriting a file.
vim.opt.backup = false

-- Do not use a swapfile for buffers by default.
vim.opt.swapfile = false
