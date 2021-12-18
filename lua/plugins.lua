local util = require('lspconfig').util

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- packer itself
  --Omnisharp c# stuff
  --OMNISHARP PATH C:\Users\Hoodstrats\AppData\Local\omnisharp-vim\omnisharp-roslyn\OmniSharp.exe
  --use 'OmniSharp/omnisharp-vim'
  use 'neovim/nvim-lspconfig'
  --autocompletion framework
  use 'hrsh7th/nvim-cmp'  
  --LSP autocompletion provider
  use 'hrsh7th/cmp-nvim-lsp'
  -- return LSPINSTALL functionality + more
  use 'williamboman/nvim-lsp-installer'  
  
  -- nice interface for LSP functions (among other things)
  use { 
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
      }
  
  --GIT related
  --Git pushing etc 
  use 'tpope/vim-fugitive'
  --Git commit LOG viewer
  use 'junegunn/gv.vim'

  --Tree sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
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

-- autocomplete config
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
  }
}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  
    local opts = {
    root_dir = function(file, _)
        if file:sub(-#".csx") == ".csx" then
    return util.path.dirname(file)
  end
    return util.root_pattern("*.sln")(file) or util.root_pattern("*.csproj")(file)
end,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

end)

-- add multiline support like vscode,put cursor on multiple lines
-- https://github.com/terryma/vim-multiple-cursors

-- Snippet support
-- Also makes it that method signatures are added when auto complete is chosen
--if g:using_snippets
-- use 'sirver/ultisnips'
-- use 'honza/vim-snippets'
--endif

--Linting/error highlighting
--use 'dense-analysis/ale'
--Autocompletion
--use 'prabirshrestha/asyncomplete.vim'
