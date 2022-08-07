require('common')

require('keybinding')

require('settings/lualine')

-- require('settings/bufferline')

require('settings/ntree')

require('settings/comment')

require('settings/treesitter')

require('settings/telescope')

require('settings/autocomplete')

require('settings/lspconfig')

require('settings/git')

require('settings/toggleterm')

require('settings/null')

require('nvim-autopairs').setup{}

require('settings/whichkey')

require('settings/hop')

--require('nord').set()
require('github-theme').setup({
  theme_style = "dimmed",
  dark_sidebar = true,
  sidebars = {"qf", "vista_kind", "terminal", "packer"},
  comment_style = "italic",
})
