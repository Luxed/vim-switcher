if exists('g:loaded_switcher')
    finish
endif

let g:loaded_switcher = 1

command! -nargs=1 Switch call switcher#OpenNewPath(<f-args>)
