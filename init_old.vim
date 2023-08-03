" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set relativenumber
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advanced menu
set cc= " Remove the vertical line for code style (very annoying)
" Google code style for Oracle
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set expandtab
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
set scrolloff=8
set ignorecase
set smartcase
set nohlsearch
set termguicolors

let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'scrooloose/nerdtree'
Plug 'numToStr/Comment.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Color Schemes
Plug 'joshdick/onedark.vim', "My favorite one
Plug 'morhetz/gruvbox' "The best one
Plug 'doums/darcula', "IntelliJ colorscheme 
Plug 'EdenEast/nightfox.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'embark-theme/vim'
call plug#end()

lua require('Comment').setup()
lua require('scrollbar').setup() 

let g:onedark_terminal_italics=1
let g:tokyonight_style="storm"
let g:gruvbox_contrast_dark='light'
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Merge signcolumn and number column into one
set signcolumn=number

"
" Enable all python highlighting
let g:python_highlight_all = 1


" ###### ##### ##### ##### ##### NERDTree ##### ##### ##### ##### ##### 
let g:NERDTreeWinSize=40
let NERDTreeQuitOnOpen=1

" ###### ##### ##### ##### ##### ###### EDIT init.vim BLAZINGLY FAST #### ##### ##### ##### #####  
" Reloads vimrc after saving but keep cursor position
" if !exists('*ReloadVimrc')
"    fun! ReloadVimrc()
"        let save_cursor = getcurpos()
"        source $MYVIMRC
"        call setpos('.', save_cursor)
"    endfun
" endif
" autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" ###### ##### ##### ##### ##### ###### EDIT init.vim BLAZINGLY FAST #### ##### ##### ##### #####  
nnoremap <leader>i :edit ~/.config/nvim/init_old.vim<cr>
nnoremap <leader>I :edit $MYVIMRC<cr>

" VIM ROOTER for HeatWave
" let g:rooter_patterns = ['all_makefull.sh']

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif


" ###### ##### ##### ##### ##### FORMAT PYTHON #### ##### ##### ##### #####  
let g:black#settings = {
    \ 'fast': 1,
    \ 'line_length': 100
\}

nnoremap <buffer><silent> <leader>F <cmd>call Black()<cr>

"##### ##### ##### INSERT BLANK LINES WITHOUT GOING INTO INSERT MODE ##### ##### #####  
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>
