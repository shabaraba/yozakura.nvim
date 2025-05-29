" Yozakura palette commands
command! YozakuraSoftContrast lua require('yozakura').set_palette('soft_contrast')
command! YozakuraWarmGray lua require('yozakura').set_palette('warm_gray')
command! YozakuraMutedRose lua require('yozakura').set_palette('muted_rose')
command! YozakuraNightBlue lua require('yozakura').set_palette('night_blue')

" Generic palette command with completion
function! s:YozakuraCompletePalette(ArgLead, CmdLine, CursorPos)
  return ['soft_contrast', 'warm_gray', 'muted_rose', 'night_blue']
endfunction

command! -nargs=? -complete=customlist,s:YozakuraCompletePalette YozakuraPalette 
  \ lua require('yozakura').set_palette(<q-args>)