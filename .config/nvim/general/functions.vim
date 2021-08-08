function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! Z_CopyLine()
    let c = v:count
    execute ':' . v:count . 't.'
endfunction

function! Z_CopyLineTo()
    let c = v:count
    execute ':.t' . v:count
endfunction

function! Z_MoveLineTo()
    let c = v:count
    execute ':.m' . v:count
endfunction

function! Z_MoveLine()
    let c = v:count
    execute ':' . v:count . 'm.'
endfunction

function! Z_DeleteLine()
    let c = v:count
    execute ':' . v:count . 'd'
endfunction
