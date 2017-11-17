" Shortcut to rapidly toggle `set list`

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set nofoldenable        "dont fold by default

" This makes vim act like all other editors<leader> buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

syntax on

let mapleader=","
nmap <leader>l :set list!<CR>

"make Y consistent with C and D
nnoremap Y y$

" <leader># Surround a word with #{ruby interpolation}
map <leader># ysiw#
vmap <leader># c#{<C-R>"}<ESC>

" <leader>" Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>

" <leader>) or <leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
map <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set ts=4 sts=4 sw=4 expandtab
syntax on
autocmd FileType make setlocal noexpandtab

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set completeopt=menuone


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'moll/vim-node', { 'for': 'node' }
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'vim-airline/vim-airline'
Plug 'blueshirts/darcula'
Plug 'kh3phr3n/python-syntax'
call plug#end()

colorscheme darcula

" python
vmap <C-i> !eingefuhrt<CR>
let g:pymode_options_max_line_length = 100
let g:python_highlight_all = 1

