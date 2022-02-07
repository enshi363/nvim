lua require('common')

set completeopt=menu,menuone,noselect

lua require('plugins')

lua require('keybinding')

lua require('settings/lualine')

lua require('settings/bufferline')

lua require('settings/ntree')

lua require('settings/comment')

lua require('settings/treesitter')

lua require('settings/telescope')

lua require('settings/autocomplete')
lua require('settings/lspconfig')

lua require('nvim-autopairs').setup{}


set background=dark

colorscheme nord 
