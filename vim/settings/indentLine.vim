let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = " "
let g:indentLine_char = "|"
let g:indentLine_first_char = "|"
let g:indentLine_color_term = 245
let g:indentLine_fileTypeExclude = ['text', 'nerdtree']
let g:indentLine_bufTypeExclude = ['nofile', 'help', 'terminal']
let g:indentLine_bufNameExclude = ["NERD_tree.*"]

autocmd FileType json let g:indentLine_setConseal=0