vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>|", [[:vsplit<CR>]])
vim.keymap.set("n", "<Leader>-", [[:split<CR>]])
vim.keymap.set("n", "<Leader>k", [[<C-w><up>]])
vim.keymap.set("n", "<Leader>j", [[<C-w><down>]])
vim.keymap.set("n", "<Leader>h", [[<C-w><left>]])
vim.keymap.set("n", "<Leader>l", [[<C-w><right>]])
vim.keymap.set("n", "L", [[:bn<CR>]])
vim.keymap.set("n", "H", [[:bp<CR>]])
vim.keymap.set("n", "<Leader>w", [[:bd<CR>]])
vim.keymap.set("i", "<C-e>", [[<right>]])
-- Smart way to insert semicolon at the end of the line
-- without loosing too many brain cells
vim.keymap.set("i", ";<CR>", [[<end>;<CR>]])

-- Edit init.lua faster
  vim.keymap.set("n", "<Leader>I", [[:e $MYVIMRC<CR>:e ~/.config/nvim/lua/config.lua<CR>:e ~/.config/nvim/lua/mappings.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/plugins_config.lua<CR>:e ~/.config/nvim/lua/lsp_configuration.lua<CR>]])
vim.keymap.set("n", "<Leader>i", [[:e ~/.config/nvim/init_old.vim <CR> ]])

-- vim.g.black#settings = {'fast' : 1, 'line_length' : 100}

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
