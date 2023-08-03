-- vim.cmd('source ~/.config/nvim/init_old.vim')

require('plugins') -- Packer
require('plugins_config') -- All the require('...').setup{...}
require('config') -- Configuration variables
require('mappings') -- Custom key mappings
require('lsp_configuration') -- LSP Configuration

vim.cmd [[colorscheme catppuccin-frappe]]
-- require('lsp_configuration') -- lsp configuration

