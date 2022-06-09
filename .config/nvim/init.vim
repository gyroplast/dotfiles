" automatically install plugins if needed
source ~/.config/nvim/plugins.vim

" color settings
source ~/.config/nvim/colors.vim
syntax on           " enable syntax highlighting

" key bindings and remaps
source ~/.config/nvim/keys.vim

set updatetime=300
set shortmess+=c
set signcolumn=number

set scrolloff=3     " keep 3 lines cursor scrolling offset
set number          " show line numbers
set noshowmode      " do not show the current mode
set cursorline      " highlight cursor line
set tw=78           " wrap at 78 characters
set sw=2
set ts=2
set sts=2

" vim: set et ft=vim:
