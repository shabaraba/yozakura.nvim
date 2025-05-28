if exists('g:loaded_yozakura')
  finish
endif
let g:loaded_yozakura = 1

command! -nargs=? Yozakura lua require('yozakura').yozakura(<f-args>)