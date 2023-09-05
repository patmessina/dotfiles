require("lazy").setup({

  -- colorscheme
  {
    "rafamadriz/neon",
    lazy = false, -- load during startup
    priority = 1000, -- load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme neon]])
    end,
  },

  -- autopair
  {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6',
    opts={
      tabout={enable=true}
    },
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

  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
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
    opts = {theme = 'neon'},
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
    branch = 'v2.x',
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

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

    },
    config = function()

      local lsp = require('lsp-zero').preset({})
      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
      end)
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()


      -- auto complete
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = false}),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })

    end
  },

  -- TODO: null ls replacement? no longer maintained
--  {
--    'jose-elias-alvarez/null-ls.nvim',
--     dependencies = {'nvim-lua/plenary.nvim'},
--     config = function()
--     end
--  },

  -- copilot
  { 'github/copilot.vim' },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      {'<leader>xx', '<cmd>TroubleToggle<cr>', desc='Start trouble'},
    }
  },

  -- todos
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {'<leader>td', '<cmd>TodoTelescope<cr>', desc='search todos'},
    },
    opts = {}
  },

  {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()

        -- Run gofmt on save

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
      require('go.format').gofmt()
      end,
      group = format_sync_grp,
    })

  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }

  -- godot
  -- { 'habamax/vim-godot' }

})
