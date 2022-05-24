return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- packer itself
  --Omnisharp c# stuff
  --OMNISHARP PATH C:\Users\Hoodstrats\AppData\Local\omnisharp-vim\omnisharp-roslyn\OmniSharp.exe
  --use 'OmniSharp/omnisharp-vim'
  -- godot
  use 'habamax/vim-godot'
  --autocompletion framework
  use 'hrsh7th/nvim-cmp'
  --LSP autocompletion provider
  use 'hrsh7th/cmp-nvim-lsp'
  -- hrsh completion sources
  use 'hrsh7th/cmp-buffer'
  -- enable snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'onsails/lspkind.nvim'
  --use 'hrsh7th/vim-vsnip'
  --use 'hrsh7th/vim-vsnip-integ'
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
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  --NerdTree Icons make sure to get a NERDFONT and set it in terminal
  --https://github.com/ryanoasis/nerd-fonts
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'Xuyuanp/nerdtree-git-plugin'

  -- A ton of color schemes too many even
  use 'flazz/vim-colorschemes'
  use 'chriskempson/base16-vim'
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

  use {
    'junnplus/nvim-lsp-setup',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
    }
  }
  -- return LSPINSTALL functionality + more
  --Tree sitter highlighting enabled by default etc
  require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
  }
  -- using junnplus nvim-lsp-setup which takes care of the heavy lifting from lspconfig and lsp installer
  require('nvim-lsp-setup').setup({
    servers = {
      omnisharp = {},
      sumneko_lua = {}
    }
  }
  )

  -- autocomplete config
  local cmp = require 'cmp'
  local lspkind = require('lspkind')
  cmp.setup {
    -- As currently, i am not using any snippet manager, thus disabled it.
    snippet = {
      expand = function(args)
        --     require("luasnip").lsp_expand(args.body)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          return vim_item
        end
      })
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer", keyword_length = 5 },
    },
    experimental = {
      ghost_text = true
    }
  }
end)
