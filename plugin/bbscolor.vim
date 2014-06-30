function! GetRangeAsString(line1, line2)
    let l = getline(a:line1, a:line2)
    let s = ''
    for i in range(len(l))
        let s .= l[i] . "\n"
    endfor
    return s
endfunction

function! BBSColor(line1, line2)
    let buf1 = bufname('%')
    exec a:line1 . ',' . a:line2 . 'TOansi'
    let buf2 = bufname('%')
    if buf2 != buf1 . '.ansi'
        echoerr 'Fail to get into the ansi buffer.'
        return
    endif
    let s = GetRangeAsString(0, '$')
    let s = substitute(s, "\<Esc>", "\<Esc>\<Esc>", 'ge')
    set buftype=nofile
    bdelete
    let @* = s
endfunction
command! -range=% BBSColor :call BBSColor(<line1>,<line2>) 