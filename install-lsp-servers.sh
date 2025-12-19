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

# SQL
echo -e "${YELLOW}Installing SQL LSP...${NC}"
npm install -g sql-language-server

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
echo -e "${GREEN}=== Installing C/C++ Tools ===${NC}"
echo -e "${YELLOW}Installing clangd and clang-format...${NC}"
echo -e "${YELLOW}NOTE: This script assumes you are using apt. If not, please install clangd and clang-format using your system's package manager.${NC}"
sudo apt-get install -y clangd clang-format

echo ""
echo -e "${GREEN}=== Installing Haskell Tools ===${NC}"

if ! command -v ghcup &> /dev/null; then
    echo -e "${RED}✗ ghcup is not installed. Please install it from: https://www.haskell.org/ghcup/${NC}"
else
    echo -e "${GREEN}✓ ghcup is installed${NC}"
    echo -e "${YELLOW}Installing Haskell LSP and formatter...${NC}"
    ghcup install hls
    ghcup install fourmolu
fi

echo ""
echo -e "${GREEN}=== Installing Elixir Tools ===${NC}"
echo -e "${YELLOW}Installing Elixir-LS...${NC}"
echo -e "${YELLOW}NOTE: Elixir-LS is typically installed via Mason inside Neovim. This is the recommended approach.${NC}"
echo -e "${YELLOW}You can run :MasonInstall elixir-ls${NC}"

echo ""
echo -e "${GREEN}=== Additional Tools ===${NC}"

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
echo ""
echo "Additional tools installed:"
echo "  ✓ Formatters: prettier, black, isort, gofumpt, rustfmt"
echo "  ✓ Linters: eslint, flake8, pylint, golangci-lint, clippy"
echo ""
echo "Next steps:"
echo "1. Start Neovim: nvim"
echo "2. Let LazyVim install all plugins"
echo "3. Run :Mason to install any remaining LSP servers"
echo "4. Run :checkhealth to verify everything is working"
echo ""
