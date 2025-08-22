require('config.lazy')
require('config.plugins_config')
require('config.env_opts')
require('config.key_bindings')
require('config.lsp_configuration')

vim.cmd [[colorscheme catppuccin]]

-- Verify it's being inited correctly
vim.notify("init.lua loaded", vim.log.levels.INFO)
