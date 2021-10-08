syntax on

"set leader to spacebar so spacebar + commands
let mapleader = " "
" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 1 
"Set out default session saving dir
let g:session_dir = 'C:/tmp/vim-sessions'
"pressing leader and ss will save and overwrite out session 
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
"restore our prev session
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

call plug#begin('C:\Users\Hoodstrats\scoop\apps\neovim\current\plugged')
"Basic NVIM LSP
"Plug 'neovim/nvim-lspconfig'

"GIT related
"Git pushing etc 
Plug 'tpope/vim-fugitive'
"Git commit LOG viewer
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"NerdTree Icons make sure to get a NERDFONT and set it in terminal
"https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

" prettier
Plug 'sbdchd/neoformat'

" A ton of color schemes too many even
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'

"Better status bar 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Markdown editing
" Snippet support
if s:using_snippets
 Plug 'sirver/ultisnips'
 Plug 'honza/vim-snippets'
endif

" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
" if you don't have node and yarn, use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

"Omnisharp c# stuff
Plug 'OmniSharp/omnisharp-vim'
"Auto close brackets,quotes,etc
"Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'

"Use release branch (recommend) for code completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Linting/error highlighting
Plug 'dense-analysis/ale'
"Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'

"FuzzFinder
Plug 'junegunn/fzf'

call plug#end()

au InsertLeave * set nopaste
"enable default windows clipboard behavior aftering Yanking text with Y
set clipboard=unnamed
set guicursor=
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
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

"set airline theme
let g:airline_theme='wombat'

"Set colorscheme from the get go
colorscheme srcery
highlight Normal guibg=#1c1b19

"Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

"Show buffer name on top of window tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"Configure Ultisnips for tab completion with markdown
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsUsePythonVersion = 3 "force Utilsnips to use python 3 to avoid issues
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>" "jump forward and back between created syntax after tab
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"

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

"ALE linter setup
" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
" }}}

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
"alt+f to use fuzzy finder
nnoremap <M-f> :FZF<CR> 
"ctrl+n toggle nerd tree useful
:map <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"disable ctrl+Z which seems to lock up vim 
:nmap <C-z> <nop>
"disable the f1 keybind it opens random window/help
:nmap <F1> <nop>
"social links snippet for the top of code
:nmap <F1> <nop>

"Omnisharp config
"Supprot for different goto definitions for different file types.
"some vscode OMNISHARP functionality 
"nnoremap <F12> :OmniSharpFindUsages<CR>
autocmd FileType cs nmap <silent> <Leader>gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>ca :OmniSharpGetCodeActions<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fc :OmniSharpCodeFormat<CR>
autocmd FileType cs nnoremap <Leader> rn :OmniSharpRenameTo<CR>

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}
if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
