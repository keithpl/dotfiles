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
set guicursor=
set laststatus=2
set background=dark
set colorcolumn=81
set signcolumn=auto
set cmdheight=1
set list
set listchars=tab:▸·,trail:~,extends:→,precedes:←,space:␣

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
	set t_Co=256
	set notermguicolors
endif

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
let g:gruvbox_improved_strings = 0
let g:gruvbox_imrpoved_warnings = 1

if (has('nvim'))
	let vimplug_path = stdpath('data') . '/site/autoload/plug.vim'
	let plugged_path = stdpath('data') . '/plugged'
else
	let vimplug_path = '~/.vim'
	let plugged_path = '~/.vim/plugged'
endif

if empty(glob(vimplug_path))
	silent execute '!curl -fLo ' vimplug_path ' --create-dirs '
		\ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)

Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'windwp/nvim-autopairs'
Plug 'folke/trouble.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

colorscheme gruvbox

lua require('colorizer').setup()
lua require('nvim-web-devicons').setup()
lua require('lsp')
lua require('treeshitter')
lua require('lina')

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

nnoremap <F8> :TroubleToggle<CR>

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
	autocmd FileType c call SetTabWidth(8)
	autocmd FileType vim call SetTabWidth(4)
	autocmd FileType lua call SetTabWidth(4)
	autocmd FileType xml call SetTabWidthExpand(2)
	autocmd FileType yaml call SetTabWidthExpand(2)
	autocmd FileType python call SetTabWidthExpand(4)

	autocmd BufWritePost,BufRead,BufNewFile *.c,*.h set filetype=c
	autocmd BufWritePost,BufRead,BufNewFile *.c,*.h setlocal cindent
	autocmd BufWritePost,BufRead,BufNewFile *.c,*.h setlocal cino=(0:0
augroup END
