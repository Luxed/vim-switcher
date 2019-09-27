if exists('g:loaded_switcher')
    finish
endif

let g:loaded_switcher = 1

command! Switch call switcher#Switch()<CR>
