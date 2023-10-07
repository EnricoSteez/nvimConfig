require('plugins') -- Packer
require('config') -- Configuration variables
require('mappings') -- Custom key mappings
require('plugins_config') -- All the require('...').setup{...}
require('lsp_configuration') -- LSP Configuration

vim.cmd [[colorscheme catppuccin]]
-- require('lsp_configuration') -- lsp configuration

