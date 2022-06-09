"
" Color settings for vim
"

set termguicolors

try
    colorscheme nightfox
catch /^Vim\%((\a\+)\)\=:E185/
    echo "color scheme nightfox does not exist, falling back to default."
endtry

" vim: set et ft=vim:
