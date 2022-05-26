return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- packer itself

  -- Note for future setups. For omnisharp/csharp we need a SLN file in the root directory
  -- If not. Nothing will work.
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  --autocompletion framework
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  
  -- Nice symbols in autocomplete
  use 'onsails/lspkind.nvim'

  -- nice interface for LSP functions (among other things)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --GIT related
  --Git pushing etc
  use 'tpope/vim-fugitive'
  --Git commit LOG viewer
  use 'junegunn/gv.vim'

  --Tree sitter
  use 'nvim-treesitter/nvim-treesitter'

  -- A ton of color schemes too many even
  use 'gruvbox-community/gruvbox'

  --Better status bar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- tabular plugin is used to format tables
  use 'godlygeek/tabular'

  -- JSON front matter highlight plugin
  use 'elzr/vim-json'
  use 'plasticboy/vim-markdown'

  --Auto close brackets,quotes,etc
  --use 'jiangmiao/auto-pairs'
  use 'Raimondi/delimitMate'

  --FuzzFinder
  use 'junegunn/fzf'

  --Tree sitter highlighting enabled by default etc
  require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
  }
  
  -- the rest of my setup in seperate files 
  require ("lsp_setup")
  require ("cmp_config")

end)
