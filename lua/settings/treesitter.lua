require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"markdown","html", "css", "vim", "lua", "javascript", "typescript", "go","php","bash","json","rust","yaml","dockerfile"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    -- disable = {"json"},
    disable = function(lang, buf)
        local max_filesize = 64 * 1024 -- 64 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false 
  },
  -- 启用增量选择
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  -- 设置为关闭，否则golang缩进某些情况会有问题
  indent = {
    enable = true 
  }
}

-- 开启 Folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
-- vim.wo.foldlevel = 99 
