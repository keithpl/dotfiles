local opt = vim.opt

opt.encoding = "utf-8"

opt.exrc = true
opt.secure = true
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.magic = true

opt.wrap = false
opt.expandtab = false
opt.formatoptions:remove("t")
opt.errorbells = false
opt.scrolloff = 8
opt.mouse = "a"
opt.updatetime = 50
opt.smartindent = true
opt.shortmess:append("c")
opt.completeopt = "menu,menuone,preview,noinsert,noselect"

opt.termguicolors = true
opt.number = true
opt.cursorline = true
opt.showmode = false
opt.laststatus = 2
opt.background = "dark"
opt.colorcolumn = "81"
opt.signcolumn = "auto"
opt.cmdheight = 1
opt.list = true
opt.listchars = "tab:▸·,trail:~,extends:→,precedes:←,space:␣"
