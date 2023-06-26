-- require('kommentary.config').use_extended_mappings()
-- vim.api.nvim_command('set commentstring=//%s')
require('Comment').setup({
  -- mappings = false,
})

-- vim.keymap.set("n", "<leader>ci", "<Plug>(comment_toggle_linewise)" )
-- vim.keymap.set('x', '<leader>cc', '<Plug>(comment_toggle_linewise_visual)')
-- vim.keymap.set('n', '<leader>cc', function()
--   return vim.v.count == 0
--     and '<Plug>(comment_toggle_linewise_current)'
--     or '<Plug>(comment_toggle_linewise_count)'
-- end, { expr = true })


-- local ft = require('Comment.ft')
--
-- ft({'go', 'rust','php','javascript'}, {'//%s', '/*%s*/'})
-- ft({'toml', 'graphql','yaml'}, '#%s')
