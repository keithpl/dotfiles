local opt = vim.opt

-- Undo history and swapfile configuration.
opt.autowrite = true
opt.backup = false
opt.swapfile = false
opt.undodir = vim.fn.stdpath("state") .. "/undo/"
opt.undofile = true
opt.undolevels = 10000

-- Search behavior configuration.
opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = true
opt.magic = true
opt.smartcase = true

-- General text editing behavior.
opt.breakindent = true
opt.completeopt = "menu,menuone,preview,noinsert,noselect"
opt.confirm = false
opt.clipboard = "unnamedplus"
opt.errorbells = false
opt.expandtab = false
opt.formatoptions:remove("t")
opt.formatoptions:append("j")
opt.mouse = "a"
opt.scrolloff = 8
opt.shortmess:append("c")
opt.sidescrolloff = 4
opt.smartindent = false
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 300
opt.updatetime = 250
opt.wildmode = "longest:full,full"
opt.wrap = false

-- Editor appearance.
opt.background = "dark"
opt.cmdheight = 0
opt.colorcolumn = "81"
opt.cursorline = true
opt.laststatus = 2
opt.list = true
opt.listchars = "tab:▸·,trail:~,extends:→,precedes:←,nbsp:␣"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = false
opt.showmode = false
opt.signcolumn = "yes"
opt.termguicolors = true
