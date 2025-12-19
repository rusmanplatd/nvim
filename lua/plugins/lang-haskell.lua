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
}
