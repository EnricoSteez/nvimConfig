return {
  { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },

  { 'preservim/nerdtree',              lazy = true },
  'nvim-lualine/lualine.nvim',
  'kyazdani42/nvim-web-devicons',
  'MattesGroeger/vim-bookmarks',

  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  'tom-anders/telescope-vim-bookmarks.nvim',
  'numToStr/Comment.nvim',

  {
    'windwp/nvim-autopairs', opts = {}
  },

  'tpope/vim-surround',
  'APZelos/blamer.nvim',
  'ThePrimeagen/harpoon',
  'rhysd/conflict-marker.vim',

  -- LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',

  {
    "L3MON4D3/LuaSnip",
    tag = "v2.*",
    build = "make install_jsregexp"
  },

  'fatih/vim-go',

  -- Colorschemes
  'morhetz/gruvbox',
  'EdenEast/nightfox.nvim',
  'folke/tokyonight.nvim',
  'embark-theme/vim',
  'ful1e5/onedark.nvim',
  { "catppuccin/nvim", name = "catppuccin" },
  'rebelot/kanagawa.nvim',
}


-- return require('packer').startup(function(use)
--   -- Packer can manage itself
--   use 'wbthomason/packer.nvim'
--
--   use {
--     'nvim-treesitter/nvim-treesitter',
--     run = ':TSUpdate'
--   }
--
--   use 'preservim/nerdtree'
--   use 'nvim-lualine/lualine.nvim'
--   use 'kyazdani42/nvim-web-devicons'
--   use 'MattesGroeger/vim-bookmarks'
--   use {
--     'nvim-telescope/telescope.nvim', tag = '0.1.x',
--     requires = { {'nvim-lua/plenary.nvim'} }
--   }
--   use 'tom-anders/telescope-vim-bookmarks.nvim'
--
--   use 'numToStr/Comment.nvim'
--   use { "windwp/nvim-autopairs",  config = function() require("nvim-autopairs").setup()  end }
--   use 'tpope/vim-surround'
--   use 'APZelos/blamer.nvim'
--   use 'ThePrimeagen/harpoon'
--   use 'rhysd/conflict-marker.vim'
--
--   -- LSP
--   use 'neovim/nvim-lspconfig'
--   use 'hrsh7th/nvim-cmp'
--   use 'hrsh7th/cmp-nvim-lsp'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/cmp-path'
--   use 'hrsh7th/cmp-cmdline'
--   -- follow latest release and install jsregexp.
--   use({
--     "L3MON4D3/LuaSnip",
--     -- follow latest release.
--     tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--     -- install jsregexp (optional!:).
--     run = "make install_jsregexp"
--   })
--   use 'fatih/vim-go'
--
--   -- Colorschemes
--   use 'morhetz/gruvbox'
--   use 'EdenEast/nightfox.nvim'
--   use 'folke/tokyonight.nvim'
--   use 'embark-theme/vim'
--   use 'ful1e5/onedark.nvim'
--   use { "catppuccin/nvim", as = "catppuccin" }
--   use "rebelot/kanagawa.nvim"
-- end)
--
