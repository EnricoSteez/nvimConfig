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
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
set scrolloff=8
set nohlsearch
" set ttimeoutlen=5
let mapleader = "\<Space>"
" :let @/ = ""
"(Supposedly) Smarter way to move between panes
map <leader>v :vsplit<CR>
map <leader><up> <C-w><up>
map <leader><down> <C-w><down>
map <leader><left> <C-w><left>
map <leader><right> <C-w><right>

"(Supposedly) Smarter way to move between BUFFERS and close them
nnoremap L :bn<CR>
nnoremap H :bp<CR>
nmap <leader>w :bd<CR>

" Exit from within parenthesis/quotes when in insert mode 
inoremap <C-e> <right>
" Smartass way to insert semicolon without hurting my brain
inoremap ;<cr> <end>;<cr>

let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'scrooloose/nerdtree'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'vim-python/python-syntax'
" Plug 'sheerun/vim-polyglot' "This shit is slow as fuck
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'chentoast/marks.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'jiangmiao/auto-pairs'
" Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive' "GIT
Plug 'airblade/vim-gitgutter'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'} "Formatting
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } },
Plug 'elzr/vim-json'
Plug 'lervag/vimtex',
" Color Schemes
Plug 'joshdick/onedark.vim', "My favorite one
Plug 'morhetz/gruvbox' "The best one
Plug 'doums/darcula', "IntelliJ colorscheme 
Plug 'EdenEast/nightfox.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'embark-theme/vim'
call plug#end()

lua require('Comment').setup()
lua require("scrollbar").setup()

" lua require("nvim-autopairs").setup {}


" COLOR CONFIGURATIONS
" Onedark
let g:onedark_terminal_italics=1
let g:tokyonight_style="storm"
" let g:tokyonight_hide_inactive_statusline="true"
" let g:gruvbox_material_background = 'dark'
" let g:gruvbox_material_better_performance = 1
let g:gruvbox_contrast_dark='light'
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
" endif


" statusline/tabline config
lua << EOF
 require('lualine').setup{
  sections={
    lualine_x = { "filetype" },
  },
  tabline = {
    lualine_a = {
      {
          'buffers',
          mode=2,
          symbols = {
            alternate_file=" "
          }
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  }
}
EOF

" ##### #### #### #### #### AIRLINE #### #### #### #### ####
" let g:airline_detect_spell=0
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline_section_z = '%3p%% u"\uE0A1"%3l/%L \uE0A3%2v'
" let g:airline_section_z = airline#section#create(["%3p%% "."\uE0A1 ".'%{line(".")}' . "/%L "."\uE0A3" . '%{col(".")}'])
" " let g:airline_section_c = airline#section#create(['%{coc#status()}'])
" 
" " let g:airline_section_error=''
" let g:airline_section_warning=''
" let g:airline_skip_empty_sections = 1
" let g:airline_detect_crypt=0
" let g:airline_left_sep=' '
" let g:airline_right_sep=''
" let g:airline_detect_modified=1
" let g:airline_powerline_fonts=1
" "This one for some reason was broken so I set it manually let g:airline_symbols.branch = "\ue0a0"
" 
" let g:airline#extensions#tabline#enabled = 1
" " let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" " let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline#extensions#tabline#left_sep=' '
" " let g:airline#extensions#tabline#left_alt_sep='|'
" let g:airline#extensions#tabline#formatter='unique_tail_improved'
" let g:webdevicons_enable_airline_tabline = 1

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
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  " set signcolumn=number
else
  set signcolumn=yes
endif

" Enable all python highlighting
let g:python_highlight_all = 1

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" <C-g>u breaks current undo, please make your own choice.

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ##### ##### ##### ##### ##### ##### COC-NVIM #### ###### ##### ### #### #### #### 
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc formatting is GARBAGE
" vnoremap <leader>F  :call CocAction('formatSelected')<CR>
nmap <leader>F  :call CocAction('format')<CR>

" Using dedicated python formatter plugin is faster
autocmd FileType python nnoremap <silent> <buffer> <leader>F <cmd>:call Black()<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" ###### ##### ##### ##### ##### NERDTree ##### ##### ##### ##### ##### 
let g:NERDTreeWinSize=35
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"
" ###### ##### ##### ##### ##### ###### FOLD #### ##### ##### ##### ##### 
set foldmethod=indent
set foldminlines=8
set foldignore=


" ###### ##### ##### ##### ##### ###### FZF #### ##### ##### ##### ##### 
nmap <leader>f :Files<CR>

" ###### ##### ##### ##### ##### ###### vim-fugitive (GIT) #### ##### ##### ##### ##### 
nnoremap <leader>ga :G add -A <cr> :G commit -v -q<CR>
nnoremap <leader>gp :G push -q<CR>
command -nargs=+ GAC G add -A | G commit -q -m \"<args>\"

" ###### ##### ##### ##### ##### ###### EDIT init.vim BLAZINGLY FAST #### ##### ##### ##### #####  
" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

"
" ###### ##### ##### ##### ##### ###### EDIT init.vim BLAZINGLY FAST #### ##### ##### ##### #####  
nnoremap <leader>i :vsplit $MYVIMRC<cr>
nnoremap <leader>I :edit $MYVIMRC<cr>


" ###### ##### ##### ##### VIMTEX ##### ##### ##### #####  
" We'll see about this... for now Overleaf works just fine....
" It's kinda like using VSCode and Vim motions ehehehehh
