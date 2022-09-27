""""""""""""""" General Config
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set nofoldenable        "dont fold by default
set smartcase
set spell
filetype plugin indent on

" This makes vim act like all other editors<leader> buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set noswapfile
syntax on
let mapleader=","
nnoremap <leader>R :source $HOME/.config/nvim/init.vim<cr>

""""""""""""" activate plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-system-copy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-python/python-syntax'
" below is a fork of vim-python that has basic match support
Plug 'nyuszika7h/python-syntax', {'branch': 'main'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'lad1337/underwater-mod'
Plug 'junegunn/vim-easy-align'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'towolf/vim-helm'
Plug 'tpope/vim-eunuch'
Plug 'liuchengxu/vista.vim'
Plug 'iautom8things/gitlink-vim'
call plug#end()

" colorscheme other visual stuff
source ~/.config/nvim/style.vim
source ~/.config/nvim/fzf.vim
""""""""" movment
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
""""""""""""""""" get highlight group under cursor
"nnoremap <C-W>* <C-w>\|<C-w>_


""""""""" debugging
""""""""""""""""" get highlight group under cursor
" https://stackoverflow.com/a/9464929
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" get highlight stack
" this one is better then the above
"https://stackoverflow.com/a/37040415
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

""""""""" editing
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3
""""""""" auto highlight
" https://stackoverflow.com/a/25233145
set updatetime=10

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec '2match' 'HoverSearch' '/\V\<'.expand('<cword>').'\>/' 
    else 
        2match none 
    endif
endfunction

""""""""" spell
nnoremap sn ]s
nnoremap sN [s
nnoremap sf :call FzfSpell()<CR>
nnoremap sF 1z=
nnoremap <leader>sa zg

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"), 10)
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

""""""""" files
augroup filetypes
	au!
	au FileType yaml autocmd BufWritePre <buffer> %s/\s\+$//e
	au FileType own,gitcommit setlocal spell
	au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	au FileType proto setlocal ts=2 sts=2 sw=2 expandtab
	au FileType vim setlocal ts=2 sts=2 sw=2 expandtab
augroup end

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
""""""""" plugins
"""""""""""""""""" gitlink
nmap <leader>gl :echo gitlink#GitLink()<CR>
vmap <leader>gl :echo gitlink#GitLink(1)<CR>
"""""""""""""""""" vista
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
nmap <buffer> <silent> <leader>V :call vista#finder#fzf#Run()<CR>
"nmap <buffer> <silent> <leader>v :Vista!<CR>

autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :call vista#finder#fzf#Run()<CR>

"""""""""""""""""" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = "golangci-lint run"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['govet', 'golint', 'errcheck', 'structcheck']
let g:go_metalinter_autosave_enabled = []
let g:go_addtags_transform = "snakecase"

"""""""""""""""""" easy-align
" https://github.com/junegunn/vim-easy-align#quick-start-guide
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"""""""""""""""""" gitgutter
nmap ghn <Plug>(GitGutterNextHunk)
nmap ghp <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghv <Plug>(GitGutterPreviewHunk)
"""""""""""""""""" hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']
"""""""""""""""""" surround
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
" make Y consistent with C and D
nnoremap Y y$

" python
vmap <C-i> !eingefuhrt<CR>
let g:python_highlight_all = 1

" yaml
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" git commit message
autocmd FileType gitcommit set tw=80

"""""""""""""""""" coc
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

command! -nargs=0 SortImports :call CocAction('runCommand', 'editor.action.organizeImport')
"autocmd BufWritePre *.py :SortImports

nmap <leader>si :SortImports<CR>

"https://brookhong.github.io/2016/09/03/view-diff-file-side-by-side-in-vim.html
function! Vimdiff()
    let lines = getline(0, '$')
    let la = []
    let lb = []
    for line in lines
        if line[0] == '-'
            call add(la, line[1:])
        elseif line[0] == '+'
            call add(lb, line[1:])
        else
            call add(la, line)
            call add(lb, line)
        endif
    endfor
    tabnew
    set bt=nofile
    vertical new
    set bt=nofile
    call append(0, la)
    diffthis
    exe "normal \<C-W>l"
    call append(0, lb)
    diffthis
endfunction
autocmd FileType diff       nnoremap <silent> <leader>vd :call Vimdiff()<CR>
