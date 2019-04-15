if exists('g:loaded_switcher')
    finish
endif

let g:loaded_switcher = 1

let g:switcher_extensions = {
            \ 'html': {
            \   'to_extension': ['ts', 'spec.ts', 'css',
            \       {'extension': 'js', 'subdir': 'javascript/'}
            \   ],
            \ },
            \ 'ts': {
            \   'to_extension': ['ts', 'spec.ts', 'html', 'css'],
            \   'remove': '\.spec$'
            \ }
            \}

if !exists('g:switcher_extensions')
    finish
endif

call switcher#BuildCommands(g:switcher_extensions)
