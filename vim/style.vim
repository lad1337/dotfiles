colorscheme underwater-mod
set termguicolors
" left markers column is always visible
set signcolumn=yes
highlight SignColumn guibg=#0d1c2b
" over the line!
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/
" gitgutter symbol color remap
" https://github.com/airblade/vim-gitgutter#signs-colours-and-symbols
hi link GitGutterAdd String
hi link GitGutterDelete Special
hi link GitGutterChange Function

" mode switch cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
autocmd VimLeave * set guicursor=a:ver25-blinkon1

" lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'underwatermod',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \  'right': [ [ 'lineinfo' ], ['gitbranch'], ['fileencoding', 'filetype'] ]
    \ },
    \ 'inactive': {
    \   'left': [['filename']],
    \   'right': [['lineinfo']]
    \ },
    \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
" auto resize
autocmd VimResized * wincmd =
