" yozakura.vim - A yozakura (night cherry blossom) themed colorscheme for Vim/Neovim
" Author: yozakura.nvim
" License: MIT

lua << EOF
for k in pairs(package.loaded) do
  if k:match("^yozakura") then package.loaded[k] = nil end
end
EOF

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "yozakura"

lua require('yozakura').load()