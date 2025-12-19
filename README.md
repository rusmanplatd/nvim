# LazyVim Multi-Language Setup

Complete Neovim setup with LazyVim configured for TypeScript, React, Next.js, Dart, Flutter, Golang, PHP, Laravel, CSS, SCSS, JSX, HTML, Python3, YAML, XML, Java, Maven, Gradle, Rust, TOML, C, C++, Elixir, Phoenix, Haskell, and SQL (PostgreSQL, MySQL/MariaDB, SQL Server, Oracle DB).

## 📋 What's Included

### Language Support

- **TypeScript/JavaScript/React/Next.js**: Full LSP support with vtsls, ESLint, and Prettier
- **Dart/Flutter**: Flutter tools integration with dartls
- **Golang**: gopls with gofumpt formatting and comprehensive hints
- **PHP/Laravel**: Intelephense LSP with Laravel.nvim plugin and Blade support
- **Python**: Pyright LSP with Black formatting and Ruff linting
- **Java**: JDTLS with Maven/Gradle support
- **Rust**: rust-analyzer with clippy and rustfmt
- **C/C++**: clangd with clang-format, CMake integration, and clangd_extensions
- **Elixir/Phoenix**: ElixirLS with mix format, HEEx templates, and Phoenix support
- **Haskell**: Haskell Language Server with fourmolu, Hoogle, and Stack/Cabal support
- **SQL/Databases**: sqls with support for PostgreSQL, MySQL/MariaDB, SQL Server, Oracle DB, and vim-dadbod integration
- **CSS/SCSS/HTML**: Full LSP support with Emmet and color highlighting
- **YAML/XML/TOML**: Schema validation and LSP support

### Features

- ✨ Modern, beautiful UI with LazyVim
- 🚀 Fast startup with lazy loading
- 🔍 Fuzzy finding with Telescope
- 📁 File explorer with neo-tree
- 🎨 Syntax highlighting with Treesitter
- 💡 Intelligent code completion
- 🔧 Auto-formatting on save
- 🐛 Integrated debugging support
- 📝 Snippet support
- 🎯 Go to definition, references, and more
- 🌈 Color highlighting for CSS/SCSS
- 📦 Package manager integration (npm, cargo, go modules, etc.)

## 🚀 Installation

### Step 1: Backup and Install LazyVim

The installation script has already been run. Your previous Neovim configuration has been backed up to:

- Config: `~/.config/nvim.backup.TIMESTAMP`
- Data: `~/.local/share/nvim.backup.TIMESTAMP`
- State: `~/.local/state/nvim.backup.TIMESTAMP`
- Cache: `~/.cache/nvim.backup.TIMESTAMP`

### Step 2: Install LSP Servers and Tools

Run the LSP installation script:

```bash
cd /home/rusman/.gemini/antigravity/scratch/nvim-setup
./install-lsp-servers.sh
```

This will install:

- TypeScript/JavaScript LSP servers
- CSS/HTML/SCSS LSP servers
- Python LSP and formatters
- Go LSP and tools
- Rust analyzer and tools
- YAML/TOML LSP servers
- PHP Intelephense
- And more...

### Step 3: Start Neovim

```bash
nvim
```

On first launch, LazyVim will automatically:

1. Install the Lazy plugin manager
2. Download and install all configured plugins
3. Set up Treesitter parsers
4. Configure LSP servers

This may take a few minutes. Be patient!

### Step 4: Install Additional LSP Servers (Optional)

Some LSP servers are best installed through Mason:

```vim
:Mason
```

In Mason, you can install:

- `jdtls` - Java LSP
- `lemminx` - XML LSP
- Any other language servers you need

## 📚 Usage

### Essential Keybindings

#### General

- `<Space>` - Leader key
- `jk` - Exit insert mode
- `<C-s>` - Save file
- `<leader>qq` - Quit all

#### File Navigation

- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Browse buffers
- `<leader>e` - Toggle file explorer

#### Window Management

- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Make splits equal
- `<leader>sx` - Close split

#### Buffer Navigation

- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer

#### Code Actions

- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation

#### Language-Specific

**Go:**

- `<leader>gat` - Add tags
- `<leader>grt` - Remove tags
- `<leader>gie` - Add if err
- `<leader>gfs` - Fill struct

**Flutter/Dart:**

- `<leader>fr` - Flutter run
- `<leader>fq` - Flutter quit
- `<leader>fR` - Flutter reload
- `<leader>fD` - Flutter devices

**Rust:**

- `<leader>rr` - Rust runnables
- `<leader>rd` - Rust debuggables
- `<leader>re` - Expand macro
- `<leader>rc` - Open Cargo.toml

**Laravel:**

- `<leader>la` - Laravel artisan
- `<leader>lr` - Laravel routes
- `<leader>lm` - Laravel related

**C/C++:**

- `<leader>csh` - Switch between source and header files
- `<leader>cg` - CMake generate
- `<leader>cb` - CMake build
- `<leader>cr` - CMake run
- `<leader>cd` - CMake debug

**Haskell:**

- `<leader>hs` - Hoogle signature search
- `<leader>he` - Evaluate all
- `<leader>hr` - Toggle REPL
- `<leader>hq` - Quit REPL

**SQL/Database:**

- `<leader>db` - Toggle database UI
- `<leader>df` - Find database buffer
- `<leader>da` - Add database connection

### Useful Commands

- `:Lazy` - Manage plugins (update, install, remove)
- `:Mason` - Manage LSP servers, formatters, linters
- `:checkhealth` - Check Neovim health and configuration
- `:LspInfo` - Show LSP server status
- `:Telescope` - Open Telescope fuzzy finder
- `:LazyExtras` - Browse and enable LazyVim extras

## 🔧 Configuration

All configuration files are located in `~/.config/nvim/`:

```
~/.config/nvim/
├── init.lua                      # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua         # Auto-commands
│   │   ├── keymaps.lua          # Custom keybindings
│   │   ├── lazy.lua             # Lazy plugin manager config
│   │   └── options.lua          # Neovim options
│   └── plugins/
│       ├── lang-typescript.lua  # TypeScript/React/Next.js
│       ├── lang-dart.lua        # Dart/Flutter
│       ├── lang-go.lua          # Golang
│       ├── lang-php.lua         # PHP/Laravel
│       ├── lang-python.lua      # Python
│       ├── lang-java.lua        # Java/Maven/Gradle
│       ├── lang-rust.lua        # Rust
│       ├── lang-c-cpp.lua       # C/C++
│       ├── lang-elixir.lua      # Elixir/Phoenix
│       ├── lang-haskell.lua     # Haskell
│       ├── lang-sql.lua         # SQL/Databases
│       ├── lang-web.lua         # CSS/SCSS/HTML
│       └── lang-config.lua      # YAML/XML/TOML
```

## 🎨 Customization

### Adding More Plugins

Create a new file in `~/.config/nvim/lua/plugins/`:

```lua
-- ~/.config/nvim/lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Changing Keybindings

Edit `~/.config/nvim/lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>custom", "<cmd>YourCommand<CR>", { desc = "Description" })
```

### Modifying Options

Edit `~/.config/nvim/lua/config/options.lua`:

```lua
vim.opt.your_option = value
```

## 🐛 Troubleshooting

### LSP Not Working

1. Check LSP status: `:LspInfo`
2. Check health: `:checkhealth`
3. Verify LSP server is installed: `:Mason`
4. Check logs: `~/.local/state/nvim/lsp.log`

### Plugin Issues

1. Update plugins: `:Lazy update`
2. Clean and reinstall: `:Lazy clean` then `:Lazy install`
3. Check plugin status: `:Lazy`

### Treesitter Issues

1. Update parsers: `:TSUpdate`
2. Install specific parser: `:TSInstall <language>`
3. Check status: `:TSInstallInfo`

### Performance Issues

1. Check startup time: `nvim --startuptime startup.log`
2. Profile plugins: `:Lazy profile`
3. Disable unused language configs

## 📖 Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Neovim Documentation](https://neovim.io/doc/)
- [LazyVim Extras](https://www.lazyvim.org/extras)
- [Mason Registry](https://mason-registry.dev/)

## 🎯 Next Steps

1. **Learn the keybindings**: Start with the basics and gradually learn more
2. **Explore LazyVim extras**: `:LazyExtras` to see additional features
3. **Customize to your needs**: Modify keybindings, options, and plugins
4. **Install language-specific tools**: Use `:Mason` to add more tools
5. **Read the docs**: Check out LazyVim and Neovim documentation

## 📝 Notes

- Auto-formatting is enabled on save for most languages
- Inlay hints are enabled for TypeScript, Go, and Rust
- Treesitter is used for syntax highlighting
- LSP provides intelligent code completion and navigation
- All configurations are modular and can be easily modified

## 🙏 Credits

- [LazyVim](https://github.com/LazyVim/LazyVim) - Amazing Neovim configuration
- [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor
- All the plugin authors and contributors

---

**Enjoy your new Neovim setup! 🚀**
