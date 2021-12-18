luafile ~\scoop\apps\neovim\0.6.0\share\nvim\runtime\lua\plugins.lua

syntax on
"set leader to spacebar so spacebar + commands
let mapleader = " "
" Set this to 1 to use ultisnips for snippet handling
"let g:using_snippets = 1 
"Set out default session saving dir
let g:session_dir = 'C:/tmp/vim-sessions'
"pressing leader and ss will save and overwrite out session 
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
"restore our prev session
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

au InsertLeave * set nopaste
"enable default windows clipboard behavior aftering Yanking text with Y
set clipboard=unnamed
set guicursor=
set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nohlsearch
set nobackup
set undodir=/tmp//
set undofile
set hidden
set incsearch
set colorcolumn=100
"enable mouse scrolling and clicking to enter visual mode/highlight
"set mouse=a
"enale scrolling only in normal mode 
set mouse=n
"allows us to have a transparent background when set in highlight below
set termguicolors 
"Prevents autocomplete from triggering automatically and not letting us delete
set completeopt=menuone,noinsert,noselect
"make the current file's directory the working directory by default
set autochdir
"enabling these 2 features will make '/' search auto toggle between search cases 
set ignorecase
set smartcase
"this will enable FOLDING with zc and zo but work with the buffer's language
set foldmethod=syntax
"makes sure the folded regions are opened by default
set nofoldenable

"if g:using_snippets
""  let g:OmniSharp_want_snippet = 1
"endif

"Configure Ultisnips for tab completion with markdown
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsUsePythonVersion = 3 "force Utilsnips to use python 3 to avoid issues
"let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
"let g:UltiSnipsJumpForwardTrigger="<c-j>" "jump forward and back between created syntax after tab
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsListSnippets="<c-l>"

"set airline theme
let g:airline_theme='wombat'

"Set colorscheme from the get go
colorscheme srcery 
"highlight Normal guibg=#1c1b19
highlight Normal guibg=none

"Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

"Show buffer name on top of window tabline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

" Markdown config
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

"Dev ICONS config for NERDTREE
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" whether or not to show the nerdtree brackets around flags
"Delimitmate insert line after opening brackets and enter
let g:delimitMate_expand_cr = 2

""""""""""""""REMAPS""""""""""""""""""""""
"Code snippets grabbed directly from file like visualstudio does
"<CR> lets vim know its a command to be executed
"-1r lets vim know to insert whatever at a line above the cursor which will
"default to the cursor position
:nnoremap <Leader>twt :-1r D:\OtherProgramming\Snippets.txt<CR>
"REMAPS capital M is alt so this one would be hold ALT+m 
nnoremap <M-m> :MarkdownPreview<CR>
"Buffer navigation
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
"GIT remaps
nmap <leader>gj :diffget //3<CR> 
nmap <leader>gf :diffget //2<CR> 
nmap <leader>gs :G<CR>
"alt+f to use fuzzy finder can be telescope of normal fzf
nnoremap <M-f> :FZF<CR>
"alt+t to use telescope for a more precise search/in files 
nnoremap <M-t> :Telescope find_files<cr>
"ctrl+n toggle nerd tree useful
:map <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"disable ctrl+Z which seems to lock up vim 
:nmap <C-z> <nop>
"disable the f1 keybind it opens random window/help
:nmap <F1> <nop>
"Telescope and LSP remaps
nnoremap('<leader>fu', 'Telescope lsp_references')
nnoremap('<leader>gd', 'Telescope lsp_definitions')
nnoremap('<leader>rn', 'lua vim.lsp.buf.rename()')
nnoremap('<leader>dn', 'lua vim.lsp.diagnostic.goto_next()')
nnoremap('<leader>dN', 'lua vim.lsp.diagnostic.goto_prev()')
nnoremap('<leader>dd', 'Telescope lsp_document_diagnostics')
nnoremap('<leader>dD', 'Telescope lsp_workspace_diagnostics')
nnoremap('<leader>xx', 'Telescope lsp_code_actions')
nnoremap('<leader>xd', '%Telescope lsp_range_code_actions')
