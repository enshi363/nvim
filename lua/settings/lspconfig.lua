local nvim_lsp = require('lspconfig')
local util = require 'lspconfig/util'

--local lsp_installer_servers = require('nvim-lsp-installer.servers')

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    on_attach = function(_, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('keybinding').maplsp(buf_set_keymap)
        vim.api.nvim_exec([[
        autocmd BufWritePre *.go lua vim.lsp.buf.format()
        ]],false)
    end,
    --capabilities = capabilities,
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
-- require'lspconfig'.angularls.setup{
--     on_attach = function(_, bufnr)
--         local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--         require('keybinding').maplsp(buf_set_keymap)
--     end,
--     capabilities = capabilities,
--     root_dir = util.root_pattern("angular.json", ".git",".angular-cli.json")
-- }

nvim_lsp.tsserver.setup{
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        require('keybinding').maplsp(buf_set_keymap)
        -- client.resolved_capabilities.document_formatting = false
        -- client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
          enable_import_on_completion=true,
        })
        ts_utils.setup_client(client)
    end,
    -- root_dir = util.root_pattern("tsconfig.json" ,"tslint.json", ".git"),
    capabilities = capabilities,
}

-- nvim_lsp.eslint.setup{}

-- php lsp setting
nvim_lsp.intelephense.setup{
  cmd = { 'intelephense', '--stdio' },
  on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    require('keybinding').maplsp(buf_set_keymap)
    vim.api.nvim_exec([[
    autocmd BufWritePre *.php lua vim.lsp.buf.format()
    ]],false)
  end,
  capabilities = capabilities,
  settings = {
    intelephense = {
      stubs = {
        "apcu",
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "ctype",
        "curl",
        "date",
        "dba",
        "dom",
        "exif",
        "FFI",
        "fileinfo",
        "filter",
        "ftp",
        "gd",
        "gettext",
        "gmp",
        "grpc",
        "hash",
        "iconv",
        "intl",
        "json",
        "ldap",
        "libxml",
        "mbstring",
        "mysqli",
        "mysqlnd",
        "odbc",
        "openssl",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_dblib",
        "pdo_mysql",
        "PDO_ODBC",
        "pdo_pgsql",
        "pdo_sqlite",
        "pgsql",
        "Phar",
        "posix",
        "protobuf",
        "pspell",
        "psr",
        "readline",
        "Reflection",
        "session",
        "shmop",
        "SimpleXML",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "sqlite3",
        "standard",
        "sysvmsg",
        "sysvsem",
        "sysvshm",
        "tidy",
        "tokenizer",
        "xml",
        "xmlreader",
        "xmlwriter",
        "xsl",
        "Zend OPcache",
        "zip",
        "zlib",
        "mongodb",
        "phalcon"
      },
      files = {
        maxSize = 5000000;
      }
    }
  }
}

