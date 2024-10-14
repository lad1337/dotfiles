let g:python_breakpoint_bind = "<leader><leader>b"
let g:python_breakpoint_cmd = "import pdb; pdb.set_trace()"

fun! python#breakpoint(lnum)
  let plnum = prevnonblank(a:lnum)
  if &expandtab
    let indents = repeat(' ', indent(plnum))
  else
    let indents = repeat("\t", plnum / &shiftwidth)
  endif

  call append(line('.')-1, indents.g:python_breakpoint_cmd)
  normal k
endfun

exe "nnoremap <silent> <buffer> " g:python_breakpoint_bind ":call python#breakpoint(line('.'))<CR>"

