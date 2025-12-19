-- SQL and Database Configuration
return {
  -- Treesitter for SQL
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "sql",
      })
    end,
  },
  
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqls = {
          settings = {
            sqls = {
              connections = {
                -- Example PostgreSQL connection
                -- {
                --   driver = "postgresql",
                --   dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=password dbname=mydb sslmode=disable",
                -- },
                -- Example MySQL connection
                -- {
                --   driver = "mysql",
                --   dataSourceName = "user:password@tcp(127.0.0.1:3306)/mydb",
                -- },
                -- Example SQL Server connection
                -- {
                --   driver = "mssql",
                --   dataSourceName = "sqlserver://user:password@localhost:1433?database=mydb",
                -- },
              },
            },
          },
          on_attach = function(client, bufnr)
            require("sqls").on_attach(client, bufnr)
          end,
        },
      },
    },
  },
  
  -- SQL utilities
  {
    "nanotee/sqls.nvim",
    ft = { "sql", "mysql", "plsql" },
  },
  
  -- Database client (optional but recommended)
  {
    "tpope/vim-dadbod",
    cmd = "DB",
  },
  
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Database Buffer" },
      { "<leader>da", "<cmd>DBUIAddConnection<cr>", desc = "Add Database Connection" },
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 40
      
      -- Auto-complete for SQL
      vim.g.db_ui_auto_execute_table_helpers = 1
    end,
  },
  
  -- SQL completion
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = "vim-dadbod",
    ft = { "sql", "mysql", "plsql" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          local cmp = require("cmp")
          cmp.setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          })
        end,
      })
    end,
  },
  
  -- Formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
        mysql = { "sql_formatter" },
        plsql = { "sql_formatter" },
      },
      formatters = {
        sql_formatter = {
          command = "sql-formatter",
          args = { "--language", "sql" },
        },
      },
    },
  },
}
