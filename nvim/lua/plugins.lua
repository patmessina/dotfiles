require("lazy").setup({

  -- colorscheme
  {
    "shaunsingh/nord.nvim",
    lazy = false, -- load during startup
    priority = 1000, -- load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
  },

  -- autopair {}
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  -- surround
  {
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
        require('nvim-surround').setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  -- treesitter
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ":TSUpdate"
  -- },


  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    keys = {
      {'<leader>ff', '<cmd>Telescope find_files<cr>', desc="file search"},
      {'<leader>fg', '<cmd>Telescope live_grep<cr>', desc="grep over files"},
      {'<leader>fb', '<cmd>Telescope buffers<cr>', desc="search buffers"},
      {'<leader>fh', '<cmd>Telescope help_tags<cr>', desc="search help tags"},
    }
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  },


  -- status line
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {theme = 'nord'},
    config = function()
      require("lualine").setup()
    end
  },

  -- comments
  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {},
  },

  -- auto session
  {
    'rmagatti/auto-session',
    opt = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    },
    config = function()
      require("auto-session").setup()
    end
  },

  -- autocomplete
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
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
      {'hrsh7th/cmp-nvim-lsp-signature-help'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

    },
    config = function()


      local lsp_zero = require('lsp-zero')

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        -- ensure_installed = {'lua_ls', 'rust_analyzer'},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })

      local cmp = require('cmp')

      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
          {name = 'nvim_lsp_signature_help'}
        },
        snippet = {
          expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
          end,
        },
        -- mapping = cmp.mapping.preset.insert({}),
        mapping = {
          -- `Enter` key to confirm completion
          -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
          -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({select = true}),
        }
      })

      -- signatures

    end
  },

  -- copilot
  { 'github/copilot.vim' },

  -- godot
  -- {
  --   'habamax/vim-godot',
  --   ft = { "gdscript" },
  -- }

})
