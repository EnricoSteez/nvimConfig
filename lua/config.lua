-- Options
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.hidden = true
vim.o.autoindent  = true
vim.o.inccommand = "split"
vim.o.mouse = "a"
vim.o.number = true
vim.o.splitbelow = true 
vim.o.splitright = true
vim.o.title = true
vim.o.wildmenu = true
vim.o.cc = ""
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.spell = true
vim.o.ttyfast = true
vim.o.scrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.opt.shortmess:append('c')
vim.o.signcolumn = 'number'
vim.o.completeopt = 'menuone,noselect'

vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.python_highlight_all = 1

vim.g.NERDTreeWinSize = 40
vim.o.NERDTreeQuitOnOpen = 1

if vim.fn.has('persistent_undo') then
  vim.o.undofile = true
  vim.o.undodir = os.getenv("HOME") .. "/.vim/undo"
end

-- let &t_ZH="\e[3m"
-- let &t_ZR="\e[23m"
-- let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
