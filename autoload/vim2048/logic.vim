function! vim2048#logic#up() abort
    let data = s:merge_up(s:split_list(vim2048#ui#get_data()))
    call vim2048#ui#update(data)
endfunction
function! vim2048#logic#down() abort
    echom 1
endfunction
function! vim2048#logic#right() abort
    echom 1
endfunction
function! vim2048#logic#left() abort
    echom 1
endfunction


function! s:split_list(data) abort
    return [
                \ [
                \ a:data[0], a:data[1], a:data[2], a:data[3]
                \ ],
                \ [
                \ a:data[4], a:data[5], a:data[6], a:data[7]
                \ ],
                \ [
                \ a:data[8], a:data[9], a:data[10], a:data[11]
                \ ],
                \ [
                \ a:data[12], a:data[13], a:data[14], a:data[15]
                \ ]
                \ ]
endfunction

" a list with 4 items
function! s:merge(l) abort
    let l = a:l
    " 1 = 2
    " 1 = 2 , 3 =4
    " 2 = 3
    " 3 = 4
    if l[0] == l[1] && !empty(l[0])
        let l[0] = l[0] * 2
        let l[1] = ''
        if l[2] == l[3] && !empty(l[2])
            let l[1] = l[2] * 2
            let l[2] = ''
            let l[3] = ''
        endif
    elseif l[1] == l[2] && !empty(l[1])
        l[1] = l[1] + l[2]
        l[2] = l[3]
        l[3] = ''
    elseif l[2] == l[3] && !empty(l[2])
        let l[2] = l[2] * 2
        let l[3] = ''
    endif
    return l
endfunction

function! s:merge_up(data) abort
    let l0 = s:merge([a:data[0][0], a:data[1][0], a:data[2][0], a:data[3][0]])
    let l1 = s:merge([a:data[0][1], a:data[1][1], a:data[2][1], a:data[3][1]])
    let l2 = s:merge([a:data[0][2], a:data[1][2], a:data[2][2], a:data[3][2]])
    let l3 = s:merge([a:data[0][3], a:data[1][3], a:data[2][3], a:data[3][3]])
    return [
                \ l0[0],l1[0],l2[0],l3[0],
                \ l0[1],l1[1],l2[1],l3[1],
                \ l0[2],l1[2],l2[2],l3[2],
                \ l0[3],l1[3],l2[2],l3[3],
                \ ]
endfunction
