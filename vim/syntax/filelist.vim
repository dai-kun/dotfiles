" Vim syntax file
" Author: daikun
" Language: filelist

if exists("b:current_syntax")
    finish
endif

syn match flPath    /^.*$/                          contains=flEnviron,flOption
syn match flEnviron /$\h\w*/                        contained
syn match flEnviron /${\h\w*}/                      contained
syn match flOption  /^\s*\(+incdir+\|-y\|-v\|-f\)/  contained

syn region flComment start="/\*" end="\*/"
syn match  flComment "^\s*//.*"

hi def link flComment Comment
hi def link flOption  Option
hi def link flEnviron Identifier
hi def link flPath    Normal

let b:current_syntax = "filelist"