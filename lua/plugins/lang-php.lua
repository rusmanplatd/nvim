-- PHP and Laravel Configuration
return {
  -- Laravel plugin - DISABLED due to dependency issues
  -- Uncomment and configure when you need Laravel-specific features
  -- {
  --   "adalessa/laravel.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "tpope/vim-dotenv",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  --   keys = {
  --     { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
  --     { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
  --     { "<leader>lm", ":Laravel related<cr>", desc = "Laravel Related" },
  --   },
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("laravel").setup()
  --     -- Only load telescope extension if telescope is available
  --     local ok, telescope = pcall(require, "telescope")
  --     if ok then
  --       telescope.load_extension("laravel")
  --     end
  --   end,
  -- },
  
  -- Treesitter for PHP and Blade
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "phpdoc",
        "blade",
      })
    end,
  },
  
  -- Blade syntax
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },
  
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "fileinfo",
                "filter",
                "ftp",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "recode",
                "Reflection",
                "regex",
                "session",
                "SimpleXML",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "standard",
                "superglobals",
                "sysvsem",
                "sysvshm",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
                "wordpress",
                "phpunit",
                "laravel",
              },
              files = {
                maxSize = 5000000,
              },
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
        php = { "php_cs_fixer" },
        blade = { "blade-formatter" },
      },
    },
  },
}
