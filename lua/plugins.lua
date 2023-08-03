-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'airblade/vim-rooter'
  use 'nvim-lualine/lualine.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'numToStr/Comment.nvim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'ThePrimeagen/harpoon'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use 'APZelos/blamer.nvim'
  use 'morhetz/gruvbox'
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'embark-theme/vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
end)

