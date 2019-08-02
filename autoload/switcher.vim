function! switcher#OpenNewPath(options)
    let l:cwd = expand('%:p:h')
    let l:filename = expand('%:t:r')

    let l:new_ext = ''

    if type(a:options) == v:t_string
      let l:new_ext = a:options
    elseif type(a:options) == v:t_dict
      if has_key(a:options, 'extension')
        let l:new_ext = a:options['extension']
      endif

      if has_key(a:options, 'remove')
        let l:filename = substitute(l:filename, a:options['remove'], '', 'g')
      endif

      if has_key(a:options, 'subdir')
        let l:cwd += '/' . a:options['subdir']
      endif
    endif

    execute 'edit ' . l:cwd . '/' . l:filename . '.' . l:new_ext
endfunction
