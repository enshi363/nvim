local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]] -- packadd packer module


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


return require('packer').startup(function(use)
  -------------------------- plugins -------------------------------------------

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
  'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Comment
  -- use 'b3nj5m1n/kommentary'
  use 'numToStr/Comment.nvim'

  use {
    "danymat/neogen",
    config = function()
        require('neogen').setup {snippet_engine = "luasnip" }
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    tag = "*"
  }

  -- nvim-autopairs
  use 'windwp/nvim-autopairs'

  -- Git
  use {
      'lewis6991/gitsigns.nvim',
      requires = {
          'nvim-lua/plenary.nvim'
      },
      -- tag = 'release' -- To use the latest release
  }
  use {"akinsho/toggleterm.nvim" ,tag = 'v2.*'}

  use { "folke/which-key.nvim"}
  -- hop like vim-sneak
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  use { "aklt/plantuml-syntax" }

  use { "iamcco/markdown-preview.nvim" , run = 'cd app && yarn install' }

  -------------------------- lsp -------------------------------------------

  -- lspconfig
  use {'neovim/nvim-lspconfig'}
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'

  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })

  --------------------------- colorscheme ------------------------------------

  -- use 'shaunsingh/nord.nvim'
  -- use 'sainnhe/sonokai'
  use 'navarasu/onedark.nvim'

  -- use 'dracula/vim'
  -- use 'flazz/vim-colorschemes'
  -- use 'projekt0n/github-nvim-theme' 
  -- use 'joshdick/onedark.vim'


  -- telescope
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  if packer_bootstrap then
    require('packer').sync()
  end
  require 'bootstrap'
end)
