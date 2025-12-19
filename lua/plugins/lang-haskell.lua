-- Haskell Configuration
return {
  -- Treesitter for Haskell
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "haskell",
      })
    end,
  },
  
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hls = {
          settings = {
            haskell = {
              formattingProvider = "fourmolu",
              checkProject = true,
              maxCompletions = 40,
              plugin = {
                -- Enable all HLS plugins
                class = { globalOn = true },
                eval = { globalOn = true },
                importLens = { globalOn = true },
                moduleName = { globalOn = true },
                pragmas = { globalOn = true },
                qualifyImportedNames = { globalOn = true },
                refineImports = { globalOn = true },
                rename = { globalOn = true },
                retrie = { globalOn = true },
                splice = { globalOn = true },
                tactics = { globalOn = true },
                hlint = {
                  globalOn = true,
                  diagnosticsOn = true,
                },
                stan = { globalOn = false },
              },
            },
          },
        },
      },
    },
  },
  
  -- Haskell tools
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local ht = require("haskell-tools")
      local def_opts = { noremap = true, silent = true }
      
      -- Haskell-specific keymaps
      vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, vim.tbl_extend("force", def_opts, { desc = "Hoogle Signature" }))
      vim.keymap.set("n", "<leader>he", ht.lsp.buf_eval_all, vim.tbl_extend("force", def_opts, { desc = "Evaluate All" }))
      vim.keymap.set("n", "<leader>hr", ht.repl.toggle, vim.tbl_extend("force", def_opts, { desc = "Toggle REPL" }))
      vim.keymap.set("n", "<leader>hq", ht.repl.quit, vim.tbl_extend("force", def_opts, { desc = "Quit REPL" }))
    end,
  },
  
  -- Formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        haskell = { "fourmolu" },
      },
    },
  },
  
  -- Additional Haskell support
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "mrcjkb/neotest-haskell",
    },
    opts = {
      adapters = {
        ["neotest-haskell"] = {},
      },
    },
  },
}
