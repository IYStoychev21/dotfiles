-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Using Packer:
  use({
	  'Mofiqul/dracula.nvim',
	  as = 'dracula',
	  config = function()
		  vim.cmd("colorscheme dracula")
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('ThePrimeagen/harpoon')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-buffer'},     -- Required
		  {'hrsh7th/cmp-path'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'saadparwaiz1/cmp_luasnip'}, -- Required
		  {'hrsh7th/cmp-nvim-lua'}, -- Required

		  {'L3MON4D3/LuaSnip'},     -- Required
		  {'rafamadriz/friendly-snippets'},     -- Required
	  }
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use 'andweeb/presence.nvim'
end)
