
" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set nofoldenable        "dont fold by default
filetype plugin indent on

" This makes vim act like all other editors<leader> buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set noswapfile

syntax on

let mapleader=","

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-system-copy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'dikiaap/minimalist'
Plug 'flazz/vim-colorschemes'
Plug 'bkbncn/vim-colorschemes-picker'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" colorscheme other visual stuff
let g:jellybeans_use_term_italics = 1
colorscheme jellybeans
" obsidian
" sonofobsidian
" made_of_code
" cobalt2
" blazer
" maroloccio
" pencil
" eva01-LCL
" elise
" turtles
" ir_black
" Atelier_DuneDark
set termguicolors
highlight SignColumn guibg=e8e8d3
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
set signcolumn=yes


autocmd VimResized * wincmd =
" mode switch stuff
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
autocmd VimLeave * set guicursor=a:ver25-blinkon1

"make Y consistent with C and D
nnoremap Y y$

" surround
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

vnoremap <leader>gy "*y
" Use the same symbols as TextMate for tabstops and EOLs
set ts=4 sts=4 sw=4 expandtab
autocmd FileType make setlocal noexpandtab

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set completeopt=menuone


" fuzzy
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>gf :GitFiles?<cr>
nnoremap <silent> <leader>ag :Ag<cr>
nnoremap <silent> <leader>h: :History:<cr>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


" python
vmap <C-i> !eingefuhrt<CR>
let g:python_highlight_all = 1

" yaml
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" git commit message
autocmd FileType gitcommit set tw=80

" coc
" Better display for messages
set cmdheight=2
" next and previous "error"
nnoremap <silent> dp <Plug>(coc-diagnostic-prev)
nnoremap <silent> dn <Plug>(coc-diagnostic-next)

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" use ctr+j|k for "dropdown-menu"
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
