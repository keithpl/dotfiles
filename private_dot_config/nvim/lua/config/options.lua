vim.opt.encoding = "utf-8"

vim.opt.exrc = true
vim.opt.secure = true
vim.opt.hidden = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.magic = true

vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.formatoptions:remove("t")
vim.opt.errorbells = false
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.updatetime = 50
vim.opt.smartindent = false
vim.opt.shortmess:append("c")
vim.opt.completeopt = "menu,menuone,preview,noinsert,noselect"

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.laststatus = 2
vim.opt.background = "dark"
vim.opt.colorcolumn = "81"
vim.opt.signcolumn = "auto"
vim.opt.cmdheight = 0
vim.opt.list = true
vim.opt.listchars = "tab:▸·,trail:~,extends:→,precedes:←,space:␣"
