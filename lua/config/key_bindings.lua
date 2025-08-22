vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>|", [[:vsplit<CR>]])
vim.keymap.set("n", "<Leader>-", [[:split<CR>]])
vim.keymap.set("n", "<Leader>k", [[<C-w><up>]])
vim.keymap.set("n", "<Leader>j", [[<C-w><down>]])
vim.keymap.set("n", "<Leader>h", [[<C-w><left>]])
vim.keymap.set("n", "<Leader>l", [[<C-w><right>]])
vim.keymap.set("n", "L", [[:bn<CR>]])
vim.keymap.set("n", "H", [[:bp<CR>]])
vim.keymap.set("n", "<Leader>w", [[:bp|bd #<CR>]])
vim.keymap.set("i", "<C-e>", [[<right>]])
-- Smart way to insert semicolon at the end of the line
-- without loosing too many brain cells
vim.keymap.set("i", ";<CR>", [[<end>;<CR>]])

-- Edit init.lua faster
vim.keymap.set("n", "<Leader>I", function()
  -- Get all files under lua/config recursively
  local files = vim.fn.glob("~/.config/nvim/lua/config/*", 1, 1)
  -- Open each file in a separate buffer
  for _, file in ipairs(files) do
    vim.cmd("edit " .. file)
  end
end, { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('v', '<leader>fg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NERDTree
vim.keymap.set('n', '<leader>n', [[:NERDTreeToggle<CR>]], {})

--TERMINAL
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Bookmarks amazing stuff
local bookmarks_extension = require('telescope').extensions.vim_bookmarks
local bookmark_actions = require('telescope').extensions.vim_bookmarks.actions

vim.keymap.set('n', '<leader>bb', bookmarks_extension.current_file, {})
vim.keymap.set('n', '<leader>bg', bookmarks_extension.all, {})

bookmarks_extension.all {
  attach_mappings = function(_, map)
    map('n', 'dd', bookmark_actions.delete_selected_or_at_cursor)

    return true
  end
}
