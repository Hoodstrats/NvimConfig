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
