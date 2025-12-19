#!/bin/bash

# LazyVim Installation Script
# This script will backup existing Neovim config and install LazyVim

set -e

echo "=== LazyVim Installation Script ==="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check Neovim version
echo -e "${YELLOW}Checking Neovim version...${NC}"
if command -v nvim &> /dev/null; then
    NVIM_VERSION=$(nvim --version | head -n1)
    echo -e "${GREEN}Found: $NVIM_VERSION${NC}"
else
    echo -e "${RED}Neovim is not installed!${NC}"
    echo "Please install Neovim >= 0.9.0 first"
    exit 1
fi

# Backup existing config
NVIM_CONFIG="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"

if [ -d "$NVIM_CONFIG" ]; then
    echo -e "${YELLOW}Backing up existing Neovim config...${NC}"
    mv "$NVIM_CONFIG" "$BACKUP_DIR"
    echo -e "${GREEN}Backup created at: $BACKUP_DIR${NC}"
fi

# Backup existing data
NVIM_DATA="$HOME/.local/share/nvim"
DATA_BACKUP="$HOME/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)"

if [ -d "$NVIM_DATA" ]; then
    echo -e "${YELLOW}Backing up existing Neovim data...${NC}"
    mv "$NVIM_DATA" "$DATA_BACKUP"
    echo -e "${GREEN}Data backup created at: $DATA_BACKUP${NC}"
fi

# Backup existing state
NVIM_STATE="$HOME/.local/state/nvim"
STATE_BACKUP="$HOME/.local/state/nvim.backup.$(date +%Y%m%d_%H%M%S)"

if [ -d "$NVIM_STATE" ]; then
    echo -e "${YELLOW}Backing up existing Neovim state...${NC}"
    mv "$NVIM_STATE" "$STATE_BACKUP"
    echo -e "${GREEN}State backup created at: $STATE_BACKUP${NC}"
fi

# Backup existing cache
NVIM_CACHE="$HOME/.cache/nvim"
CACHE_BACKUP="$HOME/.cache/nvim.backup.$(date +%Y%m%d_%H%M%S)"

if [ -d "$NVIM_CACHE" ]; then
    echo -e "${YELLOW}Backing up existing Neovim cache...${NC}"
    mv "$NVIM_CACHE" "$CACHE_BACKUP"
    echo -e "${GREEN}Cache backup created at: $CACHE_BACKUP${NC}"
fi

# Clone LazyVim starter
echo -e "${YELLOW}Cloning LazyVim starter template...${NC}"
git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
echo -e "${GREEN}LazyVim starter cloned successfully!${NC}"

# Remove .git directory from starter
rm -rf "$NVIM_CONFIG/.git"

echo ""
echo -e "${GREEN}=== Installation Complete! ===${NC}"
echo ""
echo "Next steps:"
echo "1. The configuration files will be created in ~/.config/nvim"
echo "2. Run 'nvim' to start Neovim and LazyVim will install plugins automatically"
echo "3. After plugins are installed, LSP servers will be configured"
echo ""
