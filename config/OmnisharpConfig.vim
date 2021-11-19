"Configure Ultisnips for tab completion with markdown
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsUsePythonVersion = 3 "force Utilsnips to use python 3 to avoid issues
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>" "jump forward and back between created syntax after tab
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"

"Omnisharp config
"Support for different goto definitions for different file types.
"some vscode OMNISHARP functionality 
autocmd FileType cs nmap <silent> <Leader>gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmnSharpFindUsages<CR>
autocmd FileType cs nnoremap <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>ca :OmniSharpGetCodeActions<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fc :OmniSharpCodeFormat<CR>
autocmd FileType cs nmap <silent> <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"the signature preview like in VSCODE that shows you what that code does etc
autocmd FileType cs nmap <silent> <buffer> <Leader>sd :OmniSharpDocumentation<CR>

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

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
