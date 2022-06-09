" automatically install plugin manager and plugins

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  let s:plugin_install = 1
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-toml',
      \ 'coc-highlight',
      \ 'coc-docker',
      \ 'coc-fzf-preview',
      \ 'coc-pydocstring',
      \ 'coc-pyright',
      \ 'coc-sh',
      \ 'coc-markdownlint',
      \ 'coc-git'
      \ ]

call plug#begin()
" theme / colors
Plug 'EdenEast/nightfox.nvim'

" general
Plug 'tpope/vim-commentary'  " smart, syntax-aware commenting
Plug 'Yggdroot/indentLine'   " indentation

" Python
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'tmhedberg/SimpylFold'  " better syntax-folding for Python

" Finder / Browser
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'ANGkeith/telescope-terraform-doc.nvim'

"
Plug 'folke/todo-comments.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'hashivim/vim-terraform'

" code snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'

" search files and file contents
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
call plug#end()

" catch initial plugin manager installation and force a plugin install before
" following configuration refers to not-yet existing variables or commands.
if exists("s:plugin_install") || len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync
endif

" Plugin-specific settings

lua << EOF

require("todo-comments").setup {
  signs = false
}

-- telescope extensions 
telescope = require('telescope')
telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    terraform_doc = {
      url_open_command = "xdg-open"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
for _, extension in ipairs({ 'fzf', 'terraform_doc', 'file_browser', 'project'}) do
  telescope.load_extension(extension)
end
EOF

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']  " use these chars for visual indent guide levels
let g:indentLine_fileTypeExclude = ['help', 'vim']

" fzf-preview
let g:fzf_preview_command = 'bat --color=always --plain {-1}'

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" vim: set et ft=vim:
