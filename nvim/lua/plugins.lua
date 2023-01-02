return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- color
  -- https://github.com/rafamadriz/neon
  use "rafamadriz/neon"


  -- surrounding stuff

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  -- A super powerful autopair plugin for Neovim that supports multiple characters.
  use {
      "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  -- tag = 'release' -- To use the latest release
  }

  -- use { 'nvim-tree/nvim-web-devicons' }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- nice statusline
  -- https://github.com/nvim-lualine/lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons',
      opt = true}
  }


  -- treesitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  -- comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }


  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-copilot'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- copilot
  use { 'github/copilot.vim' }

  -- use "lukas-reineke/lsp-format.nvim"

  -- A pretty list for showing diagnostics, references, telescope results, quickfix
  -- and location lists to help you solve all the trouble your code is causing.
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
    require("trouble").setup {}
    end
  }

  -- Language specific

  -- go
  -- use { 'ray-x/go.nvim' }
  use { 'fatih/vim-go' }

  -- godot
  use {
      'habamax/vim-godot'
  }

  -- rust
  use {
    'simrat39/rust-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap'
    }
  }


end)
