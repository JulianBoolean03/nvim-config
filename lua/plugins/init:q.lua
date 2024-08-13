-- ~/.config/nvim/init.lua or ~/.config/nvim/lua/plugins.lua

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua-language-server", "stylua", "html-lsp", "css-lsp", "prettier", "csharp-language-server" }
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "vim", "lua", "vimdoc", "html", "css" },
        highlight = {
          enable = true,
        },
      }
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require'nvim-tree'.setup {
        view = {
          width = 30,
          side = 'left',
          auto_resize = true,
        },
      }
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua-language-server", "stylua", "html-lsp", "css-lsp", "prettier", "csharp-language-server" }
      })

      local lspconfig = require("lspconfig")
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      lspconfig.csharp_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "csharp-language-server", "--stdio" },
        filetypes = { "cs" },
        init_options = {},
        root_dir = lspconfig.util.root_pattern(".git", ".sln"),
      })
    end,
  },
}

