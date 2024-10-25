augroup _augroup_verilog
    au!
    autocmd BufNewFile,BufRead *.bia setfiletype verilog_systemverilog
    autocmd BufNewFile,BufRead *.vbb setfiletype verilog_systemverilog
    let g:verilog_navigate_split = 'v'
    autocmd FileType verilog_systemverilog set foldmethod=marker
    autocmd FileType verilog_systemverilog set tags=./tags,~.../tags
    autocmd FileType verilog_systemverilog nnoremap <Leader>i :VerilogFollowInstance<CR>
    autocmd FileType verilog_systemverilog nnoremap <Leader>I :VerilogFollowPort<CR>
    autocmd FileType verilog_systemverilog nnoremap <Leader>o :VerilogReturnInstance<CR>
    autocmd FileType verilog_systemverilog nnoremap <Leader>u :VerilogGotoInstanceStart<CR>
augroup end

augroup _augroup_vcslog
    au!
    autocmd BufNewFile,BufRead *vcs.log setfiletype vcslog
    autocmd BufNewFile,BufRead *verdi.log setfiletype vcslog
    autocmd FileType vcslog let g:verilog_efm_level = 'warning'
    autocmd FileType vcslog let g:verilog_efm_uvm_lst = 'fatal,error,warning'
    autocmd FileType vcslog let g:verilog_efm_quickfix_clean = 1
    autocmd FileType vcslog execute verilog_systemverilog#VerilogErrorFormat("vcs", 2) | redraw
    autocmd FileType vcslog setlocal makeprg=cat\ %
augroup END

nnoremap <silent> im :set opfunc=VlogInstFloat<CR>g@
vnoremap <silent> im :<C-U> call VlogInstFloat(visualmode(), 1)<CR>
nnoremap <silent> in :set opfunc=VlogInstConnect<CR>g@
vnoremap <silent> in :<C-U> call VlogInstConnect(visualmode(), 1)<CR>

function! VlogInstFloat(type, ...)
    call VlogInst(a:type, a:0, 0)
endfunction

function! VlogInstConnect(type, ...)
    call VlogInst(a:type, a:0, 1)
endfunction

function! VlogInst(type, vmode, autoconnect, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@
    if a:vmode
        let [l1, l2] = [line("'<"), line("'>")]
    else
        let [l1, l2] = [line("'["), line("']")]
    endif
    for lnum in range(l1, l2)
        let line = getline(lnum)
        if a:autoconnect
            let line = substitute(line,
                \ '^\(\s*,\?\s*\)\(input\|output\|inout\)\s\+\(wire\|logic\|reg\)\?\(\s\+\|\s*\[\s*\(\d\+\|[^:]\+\)\s*:\s*0\s*\]\s*\)\(\w\+\)\s*\(,\?\)\(\s*\/\/.*\s*\)\?$'
                \ '\=submatch(1).".".submatch(6).(repeat(" ", 35-len(submatch(6))))."( ".submatch(6).(repeat(" ", 38-len(submatch(6)))).")".submatch(7).(repeat(" ", 1-len(submatch(7))))." // ".submatch(2)." ".((submatch(5) == "") ? 1 : (eval(submatch(5))+1))',
                \ '')
            )
            let line = substitute(line,
                \ '^\(\s*,\?\s*\)\(\w\+\.\w\+\)\s\+\(\(\w\|{}\)\+\)\s*\(,\?\)\(\s*\/\/.*\s*\)\?$',
                \ '\=submatch(1).".".submatch(3).(repeat(" ", 35-len(submatch(3))))."( ".submatch(3).(repeat(" ", 38-len(submatch(3)))).")".submatch(5).(repeat(" ", 1-len(submatch(5))))." // ".submatch(2)',
                \ '')
            )
        else
            let line = substitute(line,
                \ '^\(\s*,\?\s*\)\(input\|output\|inout\)\s\+\(wire\|logic\|reg\)\?\(\s\+\|\s*\[\s*\(\d\+\|[^:]\+\)\s*:\s*0\s*\]\s*\)\(\w\+\)\s*\(,\?\)\(\s*\/\/.*\s*\)\?$'
                \ '\=submatch(1).".".submatch(6).(repeat(" ", 35-len(submatch(6))))."( ".(repeat(" ", 38)).")".submatch(7).(repeat(" ", 1-len(submatch(7))))." // ".submatch(2)." ".((submatch(5) == "") ? 1 : (eval(submatch(5))+1))',
                \ '')
            )
            let line = substitute(line,
                \ '^\(\s*,\?\s*\)\(\w\+\.\w\+\)\s\+\(\(\w\|{}\)\+\)\s*\(,\?\)\(\s*\/\/.*\s*\)\?$',
                \ '\=submatch(1).".".submatch(3).(repeat(" ", 35-len(submatch(3))))."( ".(repeat(" ", 38)).")".submatch(5).(repeat(" ", 1-len(submatch(5))))." // ".submatch(2)',
                \ '')
            )
        endif
        call setline(lnum, line)
    endfor
    let &selection = sel_save
    let @@ = reg_save
endfunction