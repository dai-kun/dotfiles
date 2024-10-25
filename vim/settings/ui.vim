if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch

    if has("gui_running")
        colorscheme dracula
        " 终端vim如何显示斜体：https://sookocheff.com/post/vim/italics/
        hi Comment      gui=italic      guifg=#787EA2
        hi Search       gui=none        guifg=#000000       guibg=#FFFF00
        hi LineNr       gui=none        guifg=#BD93F9       guibg=#282A36
        hi CursorLineNr gui=none        guifg=#282A36       guibg=#BD93F9
        hi CursorLine   gui=none                            guibg=#50546C
        hi VertSplit    gui=none
        hi NonText      gui=none        guifg=#000000       guibg=#000000
    else
        colorscheme desert
        hi Comment      cterm=italic    ctermfg=245
        hi Search       cterm=none      ctermfg=Black       ctermbg=Yellow
        hi LineNr       cterm=none      ctermfg=DarkBlue
        hi CursorLineNr cterm=none      ctermfg=Black       ctermbg=DarkBlue
        hi CursorLine   cterm=none                          ctermbg=239
        hi VertSplit    cterm=none
        hi NonText      cterm=none      ctermfg=Black
    endif

    set guifont=MesloLGS\ NF\ Regular\ 11

    if &diff
        syntax off
    endif
endif