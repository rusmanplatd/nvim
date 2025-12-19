-- Elixir and Phoenix Framework Configuration
return {
  -- Treesitter for Elixir
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir",
        "heex",
        "eex",
      })
    end,
  },
  
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          settings = {
            elixirLS = {
              -- Dialyzer support
              dialyzerEnabled = true,
              dialyzerWarnOpts = {},
              dialyzerFormat = "dialyxir_long",
              -- Enable all ElixirLS features
              fetchDeps = false,
              enableTestLenses = true,
              suggestSpecs = true,
              signatureAfterComplete = true,
            },
          },
        },
      },
    },
  },
  
  -- Formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
      },
      formatters = {
        mix = {
          command = "mix",
          args = { "format", "-" },
        },
      },
    },
  },
  
  -- Phoenix Framework support
  {
    "mhanberg/elixir.nvim",
    ft = { "elixir", "heex", "eex" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      nextls = { enable = false },
      credo = { enable = true },
      elixirls = { enable = true },
    },
  },
  
  -- Additional Elixir tools
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "jfpedroza/neotest-elixir",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
}
