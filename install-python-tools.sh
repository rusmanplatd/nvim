#!/bin/bash

# Install Python LSP Servers and Tools
# This script handles the externally-managed-environment issue

echo "=== Installing Python LSP Servers and Tools ==="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}Note: Python has an externally-managed-environment restriction.${NC}"
echo -e "${YELLOW}We'll install pipx via apt and use it to install Python tools.${NC}"
echo ""

# Check if pipx is installed
if ! command -v pipx &> /dev/null; then
    echo -e "${YELLOW}Installing pipx via apt...${NC}"
    echo -e "${YELLOW}This requires sudo access.${NC}"
    sudo apt update
    sudo apt install -y pipx
    pipx ensurepath
    export PATH="$HOME/.local/bin:$PATH"
    echo ""
fi

echo -e "${GREEN}Installing Python LSP servers and tools with pipx...${NC}"
echo ""

# Install Python LSP servers and tools
echo -e "${YELLOW}Installing pyright...${NC}"
pipx install pyright || echo -e "${RED}Failed to install pyright${NC}"

echo -e "${YELLOW}Installing python-lsp-server...${NC}"
pipx install python-lsp-server || echo -e "${RED}Failed to install python-lsp-server${NC}"

echo -e "${YELLOW}Installing ruff (linter and formatter)...${NC}"
pipx install ruff || echo -e "${RED}Failed to install ruff${NC}"

echo -e "${YELLOW}Installing black (formatter)...${NC}"
pipx install black || echo -e "${RED}Failed to install black${NC}"

echo -e "${YELLOW}Installing isort (import sorter)...${NC}"
pipx install isort || echo -e "${RED}Failed to install isort${NC}"

echo -e "${YELLOW}Installing flake8 (linter)...${NC}"
pipx install flake8 || echo -e "${RED}Failed to install flake8${NC}"

echo -e "${YELLOW}Installing mypy (type checker)...${NC}"
pipx install mypy || echo -e "${RED}Failed to install mypy${NC}"

echo -e "${YELLOW}Installing pylint (linter)...${NC}"
pipx install pylint || echo -e "${RED}Failed to install pylint${NC}"

echo ""
echo -e "${GREEN}=== Python Tools Installation Complete! ===${NC}"
echo ""
echo "Installed Python tools:"
echo "  ✓ pyright - LSP server"
echo "  ✓ python-lsp-server - Alternative LSP server"
echo "  ✓ ruff - Fast linter and formatter"
echo "  ✓ black - Code formatter"
echo "  ✓ isort - Import sorter"
echo "  ✓ flake8 - Linter"
echo "  ✓ mypy - Type checker"
echo "  ✓ pylint - Linter"
echo ""
echo "All tools are installed in isolated environments via pipx."
echo "They are available in your PATH at: ~/.local/bin/"
echo ""
echo -e "${YELLOW}Important: Add ~/.local/bin to your PATH if not already done:${NC}"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
