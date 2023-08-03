-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'preservim/nerdtree'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'MattesGroeger/vim-bookmarks'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'tom-anders/telescope-vim-bookmarks.nvim'

  use 'numToStr/Comment.nvim'
  use { "windwp/nvim-autopairs",  config = function() require("nvim-autopairs").setup()  end }
  use 'tpope/vim-surround'
  use 'airblade/vim-rooter'
  use 'APZelos/blamer.nvim'
  use 'ThePrimeagen/harpoon'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- follow latest release and install jsregexp.
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use 'fatih/vim-go'

  -- Colorschemes
  use 'morhetz/gruvbox'
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'embark-theme/vim'
  use 'ful1e5/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
end)

