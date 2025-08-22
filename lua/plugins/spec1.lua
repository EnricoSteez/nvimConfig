return {
  { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false },

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
