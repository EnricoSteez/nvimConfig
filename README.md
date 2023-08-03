# nvimConfig
My personal neovim configuration.
## Directory Structure
```
~/.config/nvim
├── init.lua
├── init_old.vim
├── lua
│   ├── config.lua
│   ├── lsp_configuration.lua
│   ├── mappings.lua
│   ├── plugins_config.lua
│   └── plugins.lua
└── plugin
    └── packer_compiled.lua
```

Where init.lua simply sources all modules under `lua/` (other than setting some variables that I want to access often and quickly)


