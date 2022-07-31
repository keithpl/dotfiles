scriptencoding utf-8
set encoding=utf-8

set exrc
set secure
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set ignorecase
set smartcase
set nohlsearch
set incsearch
set magic

set nowrap
set noexpandtab
set formatoptions-=t
set noerrorbells
set scrolloff=4
set mouse=a
set updatetime=50
set smartindent
set shortmess+=c
set completeopt=menu,menuone,preview,noinsert,noselect

set termguicolors
set number
set cursorline
set noshowmode
set laststatus=2
set background=dark
set colorcolumn=81
set signcolumn=auto
set cmdheight=1
set list
set listchars=tab:▸·,trail:~,extends:→,precedes:←,space:␣

let vim_plug_path = stdpath('data') . '/site/autoload/plug.vim'

if empty(glob(vim_plug_path))
    silent execute '!curl -fLo ' vim_plug_path ' --create-dirs '
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'gruvbox-community/gruvbox'

Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
let g:gruvbox_improved_strings = 0
let g:gruvbox_improved_warnings = 1

colorscheme gruvbox

lua << EOF
    require("lsp")
    require("treeshitter")
    require("statusline")
    require("colorizer").setup()
EOF

let mapleader="\<Space>"

nnoremap ZZ <nop>
nnoremap ZQ <nop>

nnoremap Y y$
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

augroup yank_highlight
    function! YankHighlight(msec)
        exec 'lua require("vim.highlight").on_yank({ timeout = ' a:msec ' })'
    endfunction

    autocmd!
    autocmd TextYankPost * silent! call YankHighlight(100)
augroup END

augroup indentation
    function! SetTabWidth(width)
        exec 'setlocal tabstop=' . a:width . ' shiftwidth=' . a:width
    endfunction

    function! SetTabWidthExpand(width)
        call SetTabWidth(a:width)
        exec 'setlocal expandtab'
    endfunction

    autocmd!
    autocmd FileType c      call SetTabWidth(8)
    autocmd FileType lua    call SetTabWidthExpand(4)
    autocmd FileType python call SetTabWidthExpand(4)
    autocmd FileType sh     call SetTabWidthExpand(2)
    autocmd FileType vim    call SetTabWidthExpand(4)
    autocmd FileType xml    call SetTabWidthExpand(2)
    autocmd FileType yaml   call SetTabWidthExpand(2)
    autocmd FileType zsh    call SetTabWidthExpand(2)

    autocmd BufWritePost,BufRead,BufNewFile *.c,*.h set filetype=c
    autocmd BufWritePost,BufRead,BufNewFile *.c,*.h setlocal cindent
    autocmd BufWritePost,BufRead,BufNewFile *.c,*.h setlocal cino=(0:0
augroup END
