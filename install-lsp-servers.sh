#!/bin/bash

# Install LSP Servers and Development Tools
# This script installs all necessary LSP servers, formatters, and linters

# Don't exit on error - we want to install as much as possible

echo "=== Installing LSP Servers and Development Tools ==="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Check prerequisites
echo -e "${YELLOW}Checking prerequisites...${NC}"

check_command() {
  if command -v $1 &> /dev/null; then
    echo -e "${GREEN}✓ $1 is installed${NC}"
    return 0
  else
    echo -e "${RED}✗ $1 is not installed${NC}"
    return 1
  fi
}

# Track if any prerequisites are missing
MISSING_PREREQS=0

# Check Node.js
if ! check_command node; then
  echo -e "${YELLOW}  Install Node.js from: https://nodejs.org/${NC}"
  MISSING_PREREQS=1
fi

# Check npm
if ! check_command npm; then
  echo -e "${YELLOW}  npm should come with Node.js${NC}"
  MISSING_PREREQS=1
fi

# Check Python
if ! check_command python3; then
  echo -e "${YELLOW}  Install Python from: https://www.python.org/${NC}"
  MISSING_PREREQS=1
fi

# Check pip
if ! check_command pip3; then
  echo -e "${YELLOW}  Install pip: sudo apt install python3-pip${NC}"
  MISSING_PREREQS=1
fi

# Check Go
if ! check_command go; then
  echo -e "${YELLOW}  Install Go from: https://golang.org/${NC}"
  MISSING_PREREQS=1
fi

# Check Rust/Cargo
if ! check_command cargo; then
  echo -e "${YELLOW}  Install Rust from: https://rustup.rs/${NC}"
  MISSING_PREREQS=1
fi

# Check Java
if ! check_command java; then
  echo -e "${YELLOW}  Install Java: sudo apt install default-jdk${NC}"
  MISSING_PREREQS=1
fi

# Check Dart/Flutter (optional)
if ! check_command dart; then
  echo -e "${YELLOW}  (Optional) Install Flutter/Dart from: https://flutter.dev/${NC}"
fi

echo ""

if [ $MISSING_PREREQS -eq 1 ]; then
  echo -e "${RED}Some prerequisites are missing. Please install them first.${NC}"
  echo -e "${YELLOW}Do you want to continue anyway? (y/n)${NC}"
  read -r response
  if [[ ! "$response" =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

echo ""
echo -e "${GREEN}=== Installing Node.js-based LSP Servers ===${NC}"

# TypeScript/JavaScript
echo -e "${YELLOW}Installing TypeScript LSP servers...${NC}"
npm install -g typescript typescript-language-server
npm install -g @vtsls/language-server

# ESLint
echo -e "${YELLOW}Installing ESLint...${NC}"
npm install -g eslint

# Prettier
echo -e "${YELLOW}Installing Prettier...${NC}"
npm install -g prettier

# CSS/SCSS/HTML
echo -e "${YELLOW}Installing CSS/HTML LSP servers...${NC}"
npm install -g vscode-langservers-extracted

# Emmet
echo -e "${YELLOW}Installing Emmet LSP...${NC}"
npm install -g emmet-ls

# YAML
echo -e "${YELLOW}Installing YAML LSP...${NC}"
npm install -g yaml-language-server

# PHP
echo -e "${YELLOW}Installing PHP LSP (Intelephense)...${NC}"
npm install -g intelephense

# Blade formatter
echo -e "${YELLOW}Installing Blade formatter...${NC}"
npm install -g blade-formatter

echo ""
echo -e "${GREEN}=== Installing Python-based Tools ===${NC}"

# Python LSP and tools
echo -e "${YELLOW}Installing Python LSP and formatters...${NC}"
pip3 install --user pyright python-lsp-server
pip3 install --user black isort flake8 mypy pylint
pip3 install --user ruff ruff-lsp

echo ""
echo -e "${GREEN}=== Installing Go-based Tools ===${NC}"

# Go LSP and tools
echo -e "${YELLOW}Installing Go LSP and tools...${NC}"
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

echo ""
echo -e "${GREEN}=== Installing Rust-based Tools ===${NC}"

# Rust LSP and tools
echo -e "${YELLOW}Installing Rust Analyzer...${NC}"
rustup component add rust-analyzer rustfmt clippy

# Taplo (TOML)
echo -e "${YELLOW}Installing Taplo (TOML LSP)...${NC}"
cargo install taplo-cli --locked

echo ""
echo -e "${GREEN}=== Additional Tools ===${NC}"

# C/C++ Tools
echo -e "${YELLOW}Installing C/C++ tools...${NC}"
echo -e "${YELLOW}Please install clangd via your system package manager:${NC}"
echo -e "${YELLOW}  Ubuntu/Debian: sudo apt install clangd clang-format${NC}"
echo -e "${YELLOW}  Arch: sudo pacman -S clang${NC}"
echo -e "${YELLOW}  macOS: brew install llvm${NC}"

# Elixir Tools
if command -v elixir &> /dev/null; then
  echo -e "${YELLOW}Installing Elixir LSP (ElixirLS)...${NC}"
  echo -e "${YELLOW}ElixirLS will be installed via :Mason in Neovim${NC}"
else
  echo -e "${YELLOW}Elixir not found. Install from: https://elixir-lang.org/${NC}"
fi

# Haskell Tools
if command -v ghc &> /dev/null; then
  echo -e "${YELLOW}Installing Haskell Language Server...${NC}"
  echo -e "${YELLOW}HLS will be installed via :Mason in Neovim${NC}"
  echo -e "${YELLOW}Or install via GHCup: ghcup install hls${NC}"
  
  # Haskell formatters
  if command -v cabal &> /dev/null; then
    echo -e "${YELLOW}Installing Fourmolu (Haskell formatter)...${NC}"
    cabal install fourmolu || echo -e "${RED}Failed to install fourmolu${NC}"
  fi
else
  echo -e "${YELLOW}GHC not found. Install Haskell via GHCup: https://www.haskell.org/ghcup/${NC}"
fi

# SQL Tools
echo -e "${YELLOW}Installing SQL tools...${NC}"
if command -v go &> /dev/null; then
  go install github.com/sqls-server/sqls@latest
  echo -e "${GREEN}✓ Installed sqls (SQL Language Server)${NC}"
else
  echo -e "${RED}Go not found, cannot install sqls${NC}"
fi

# SQL formatters
echo -e "${YELLOW}Installing SQL formatters...${NC}"
npm install -g sql-formatter
pip3 install --user sqlfluff

# XML LSP (requires Java)
if command -v java &> /dev/null; then
  echo -e "${YELLOW}Installing LemMinX (XML LSP)...${NC}"
  # LemMinX will be installed via Mason in Neovim
  echo -e "${YELLOW}LemMinX will be installed via :Mason in Neovim${NC}"
fi

# Java LSP (JDTLS)
if command -v java &> /dev/null; then
  echo -e "${YELLOW}JDTLS (Java LSP) will be installed via :Mason in Neovim${NC}"
fi

echo ""
echo -e "${GREEN}=== Installation Complete! ===${NC}"
echo ""
echo "Installed LSP servers:"
echo "  ✓ TypeScript/JavaScript: vtsls, typescript-language-server"
echo "  ✓ CSS/SCSS/HTML: vscode-langservers-extracted"
echo "  ✓ Emmet: emmet-ls"
echo "  ✓ YAML: yaml-language-server"
echo "  ✓ PHP: intelephense"
echo "  ✓ Python: pyright, ruff-lsp"
echo "  ✓ Go: gopls"
echo "  ✓ Rust: rust-analyzer"
echo "  ✓ TOML: taplo"
echo "  ✓ SQL: sqls"
echo ""
echo "Additional tools installed:"
echo "  ✓ Formatters: prettier, black, isort, gofumpt, rustfmt, sql-formatter, sqlfluff"
echo "  ✓ Linters: eslint, flake8, pylint, golangci-lint, clippy"
echo ""
echo "To install via system package manager:"
echo "  • C/C++: clangd, clang-format"
echo ""
echo "To install via Mason in Neovim:"
echo "  • Elixir: elixir-ls"
echo "  • Haskell: haskell-language-server"
echo "  • Java: jdtls"
echo "  • XML: lemminx"
echo ""
echo "Next steps:"
echo "1. Install clangd: sudo apt install clangd clang-format (Ubuntu/Debian)"
echo "2. Start Neovim: nvim"
echo "3. Let LazyVim install all plugins"
echo "4. Run :Mason to install ElixirLS, HLS, and other LSP servers"
echo "5. Run :checkhealth to verify everything is working"
echo ""
