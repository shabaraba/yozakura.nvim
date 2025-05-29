" Debug commands for Yozakura colorscheme
command! YozakuraDebug lua require('yozakura.debug').show_highlights()

" Show current highlight under cursor
command! YozakuraInspect echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"