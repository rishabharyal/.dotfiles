vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use('folke/tokyonight.nvim')

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'moll/vim-bbye'

  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use 'nvim-tree/nvim-web-devicons'

    use({
        'tpope/vim-surround',
        event = 'BufRead',
        requires = {
            {
                'tpope/vim-repeat',
                event = 'BufRead',
            },
        },
    })

    use({
        'AndrewRadev/splitjoin.vim',
        event = 'CursorHold',
    })

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
      {'ray-x/lsp_signature.nvim'},
	  }
    }

    use "theprimeagen/refactoring.nvim"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/gitsigns.nvim"
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use "olimorris/onedarkpro.nvim"

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- not needed for now
            }
        end
    }
  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }
  use { "nvim-neotest/nvim-nio" }

  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "leoluz/nvim-dap-go"} }
  use 'leoluz/nvim-dap-go'
  use { "theHamsta/nvim-dap-virtual-text" }
end)
