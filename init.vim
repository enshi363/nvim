lua require('plugins')

" lua require('common')
"
" lua require('keybinding')
"
" lua require('settings/lualine')
"
" lua require('settings/ntree')
"
" lua require('settings/comment')
"
" lua require('settings/treesitter')
"
" lua require('settings/telescope')
"
" lua require('settings/autocomplete')
"
" lua require('settings/lspconfig')
"
" lua require('settings/git')
"
" lua require('settings/toggleterm')
"
" lua require('nvim-autopairs').setup{}
"lua require('settings/null')
" lua require('settings/bufferline')
"
let g:enable_bold_font = 1 

set background=dark

" colorscheme nord 
let g:sonokai_style = 'maia'
colorscheme sonokai 
" colorscheme  dracula
" colorscheme onedark

" highlight Normal ctermbg=none

" highlight Normal guibg=None ctermbg=None
" highlight NonText guibg=None ctermbg=None

"hi Visual term=bold cterm=bold ctermbg=26

"hi CursorLine term=bold cterm=bold ctermbg=8

set termguicolors

set t_Co=256

set clipboard+=unnamedplus
