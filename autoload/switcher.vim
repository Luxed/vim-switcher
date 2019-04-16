function! switcher#OpenNewPath(options)
    if !has_key(a:options, 'extension')
        finish
    endif

    let l:cwd = expand('%:p:h')
    let l:filename = expand('%:t:r')
    let l:new_ext = a:options['extension']

    if has_key(a:options, 'remove')
        let l:filename = substitute(l:filename, a:options['remove'], '', 'g')
    endif

    if has_key(a:options, 'subdir')
        let l:cwd += '/' . a:options['subdir']
    endif

    execute 'edit ' . l:cwd . '/' . l:filename . '.' . l:new_ext
endfunction

function! switcher#BuildCommands(options)
    for [ft, ext_options] in items(a:options)
        if !has_key(ext_options, 'to_extension')
            continue
        endif
        let l:to_extensions = l:ext_options['to_extension']
        let l:remove = ''
        if has_key(ext_options, 'remove')
            let l:remove = ext_options['remove']
        endif

        for to_ext in l:to_extensions
            let l:new_dict = {}

            if type(to_ext) == v:t_string
                let l:new_dict['extension'] = substitute(to_ext, '\.', '', 'g')
            elseif type(to_ext) == v:t_dict
                let l:new_dict['extension'] = substitute(to_ext['extension'], '\.', '', 'g')
                if has_key(to_ext, 'subdir')
                    let l:new_dict['subdir'] = to_ext['subdir']
                endif
            endif

            if l:remove != ''
                let l:new_dict['remove'] = l:remove
            endif

            let l:autocmd = 'autocmd FileType ' . ft
            let l:command = ':command! Yes' . l:new_dict['extension']
            let l:call = ':call switcher#OpenNewPath(' . string(l:new_dict) . ')'

            execute l:autocmd . ' ' . l:command . ' ' . l:call
        endfor
    endfor
endfunction
