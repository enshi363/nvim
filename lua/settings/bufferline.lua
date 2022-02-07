vim.opt.termguicolors = true

require("bufferline").setup{
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return vim.fn.getcwd()
                end,
                highlight = "Directory",
                text_align = "left"
            }
        },
        show_buffer_close_icons = false,
    }
}
