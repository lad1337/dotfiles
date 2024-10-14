" https://vi.stackexchange.com/a/12294
function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')
endfunction

let s:base02 = [ ReturnHighlightTerm('Pmenu', 'guibg'), 0 ]
let s:base01 = [ ReturnHighlightTerm('Type', 'guifg'), 0 ]
let s:base00 = [ ReturnHighlightTerm('Normal', 'guibg'), 0 ]
let s:yellow = [ ReturnHighlightTerm('StatusLine', 'guifg'), 0 ]
let s:orange = [ ReturnHighlightTerm('Title', 'guifg'), 0 ]
let s:red = [ ReturnHighlightTerm('ErrorMsg', 'guibg'), 0 ]
let s:magenta = [ ReturnHighlightTerm('MatchParen', 'guifg'), 0 ]
let s:blue = [ ReturnHighlightTerm('Identifier', 'guifg'), 0 ]
let s:cyan = [ ReturnHighlightTerm('Statement', 'guifg'), 0 ]
let s:green = [ ReturnHighlightTerm('String', 'guifg'), 0 ]
let s:boarder = [ ReturnHighlightTerm('CursorLine', 'guibg'), 0 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:base01 ], [ s:base02, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:blue ], [ s:base02, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ] ]
let s:p.inactive.left =  [ [ s:base02, s:base00 ], [ s:red, s:base00 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base00, s:base01 ] ]
let s:p.replace.left = [ [ s:base02, s:red ], [ s:base00, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], [ s:base00, s:base01 ] ]
let s:p.normal.middle = [ [ s:base02, s:boarder ] ]
let s:p.inactive.middle = [ [ s:base02, s:boarder ] ]
let s:p.tabline.left = [ [ s:base00, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base00, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base00 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:base02 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

let g:lightline#colorscheme#underwatermod#palette = lightline#colorscheme#flatten(s:p)
