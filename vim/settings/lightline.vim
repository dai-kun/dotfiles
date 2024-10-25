let g:lightline = {
            \'colorscheme': 'dracula',
            \'active': {
            \   "right" : [ [ 'lineinfo' ],
            \             [ 'percent' ],
            \             [ 'filetype', 'fileformat', 'fileencoding', 'charvaluehex' ]],
            \},
            \'component': {
            \   'charvaluehex': '0x%B',
            \},
            \'component_expand': {
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \},
            \}

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no FT') : ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction
