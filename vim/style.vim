colorscheme underwater-mod
" obsidian
" jellybeans
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
" chance-of-storm
" lanox
" underwater-mod
" Tomorrow-Night-Bright
" HATE
nnoremap <leader>H :Hate<cr>
nnoremap <leader>N :CSnext<cr>
set termguicolors
" left markers column is always visible
set signcolumn=yes
highlight SignColumn guibg=#0d1c2b
" over the line!
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" mode switch cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
autocmd VimLeave * set guicursor=a:ver25-blinkon1

" auto resize
autocmd VimResized * wincmd =
