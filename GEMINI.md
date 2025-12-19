# Project Overview

This directory contains a Neovim configuration based on the [LazyVim](https://www.lazyvim.org/) distribution. The configuration is written in Lua and is designed to provide a feature-rich, multi-language development environment out-of-the-box.

It includes pre-configured support for a wide range of languages, including:
- Python
- Go
- Rust
- TypeScript/JavaScript
- Java
- PHP
- Dart
- and more.

The setup uses `lazy.nvim` for plugin management, `mason.nvim` for managing LSP servers and tools, and `nvim-treesitter` for syntax highlighting.

# Key Files

- `init.lua`: The main entry point for the Neovim configuration. It bootstraps the plugin manager.
- `lua/config/lazy.lua`: The core configuration for the `lazy.nvim` plugin manager. It specifies which plugins and "extras" (pre-configured modules from LazyVim) are loaded.
- `lua/plugins/`: This directory contains all custom plugin specifications and overrides. Each file in this directory can define one or more plugins. For instance, `lang-python.lua` customizes the LSP, formatting, and Treesitter settings for Python development.
- `lua/config/`: Contains base configuration files for Neovim options (`options.lua`), keymaps (`keymaps.lua`), and autocommands (`autocmds.lua`).
- `install-*.sh`: Shell scripts to install external dependencies like LSP servers and formatters.

# Development Conventions

This is a Neovim configuration, not a traditional software project. "Development" in this context means customizing the editor.

- **Adding a new plugin:** Create a new `.lua` file in the `lua/plugins/` directory. The file should return a list of plugin specifications. For example, to add `foo/bar.nvim`:
  ```lua
  -- lua/plugins/my-new-plugin.lua
  return {
    "foo/bar.nvim",
    config = function()
      -- your setup function for the plugin
    end,
  }
  ```

- **Customizing existing plugins:** Modify the relevant file in `lua/plugins/`. For language-specific settings, find the corresponding `lang-*.lua` file.

- **Managing LSPs and Tools:** Use the `:Mason` command inside Neovim to install, update, or remove LSP servers, linters, and formatters.

- **Managing Plugins:** Use the `:Lazy` command inside Neovim to update, clean, install, or profile plugins.

# Usage

1.  **Start Neovim:** Run `nvim` in your terminal.
2.  **Plugin Management:** On the first run, `lazy.nvim` will automatically install all the configured plugins. You can manage them later with the `:Lazy` command.
3.  **LSP Installation:** Some language servers may need to be installed manually via the `:Mason` command. The `install-lsp-servers.sh` script can be used to install many of the recommended tools in one go.

Example command to install tools:
```bash
./install-lsp-servers.sh
```
