# nvimConfig
My personal neovim configuration. To use, run:

`mkdir ~/.config && git clone https://github.com/EnricoSteez/nvimConfig.git ~/.config/nvim`
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

Where `init.lua` simply sources all modules under `lua/` (other than setting some variables that I want to access often and quickly).
`init_old.vim` is the old vim configuration file in vimscript, which has been recently 100% ported to lua.
The contents of each lua module are pretty self-explanatory:
- `config.lua` contains generic environment configuration, such as smart indentation, relative line numbers, smart case search etc.
- `lsp_configuration.lua`... well, you guessed it. Some LSP key bindings are configured to use Telescope instead of the native LSP call.
- `mappings.lua` contains definitions of custom key bindings to navigate buffers and splits etc.
- `plugins.lua` contains the list of installed plugins (using [Packer](https://github.com/wbthomason/packer.nvim))
- `plugins_config.lua` contains calls to `setup{}` for the installed plugins that require it, optionally providing some additional custom configuration (e.g. for [Lualine](https://github.com/nvim-lualine/lualine.nvim))
