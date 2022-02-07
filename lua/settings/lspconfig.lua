local nvim_lsp = require('lspconfig')

--local lsp_installer_servers = require('nvim-lsp-installer.servers')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
    "gopls",
    "angularls",
    "bashls",
    "tsserver",
    "yamlls",
    "rust_analyzer",
    "intelephense",
    "jsonls",
    "html",
    "cssls",
}

-- golang lsp setting
nvim_lsp.gopls.setup({
    on_attach = function(_, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('keybinding').maplsp(buf_set_keymap)
        vim.api.nvim_exec([[
            autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil,1000)
        ]],false)
    end,
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})


-- angular lsp setting
require'lspconfig'.angularls.setup{
    on_attach = function(_, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        require('keybinding').maplsp(buf_set_keymap)
    end,
    capabilities = capabilities,

}

-- php lsp setting
require'lspconfig'.intelephense.setup{
    on_attach = function(_, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        require('keybinding').maplsp(buf_set_keymap)
    end,
    capabilities = capabilities,
}

-- typescript lsp setting
--nvim_lsp.tsserver.setup({
    --on_attach = function(_, bufnr)
        --local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        --require('keybinding').maplsp(buf_set_keymap)
    --end,
    --capabilities = capabilities,

--})

