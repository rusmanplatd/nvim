-- Custom Keymaps
-- This file is automatically loaded by LazyVim

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set leader key (LazyVim uses space by default)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffer navigation
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Move lines up and down
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Paste without yanking
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Delete without yanking
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Save file
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<ESC><cmd>w<CR>", { desc = "Save file" })

-- Quit
keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

-- Language-specific keymaps

-- Go
keymap.set("n", "<leader>gat", "<cmd>GoAddTag<CR>", { desc = "Go: Add tags" })
keymap.set("n", "<leader>grt", "<cmd>GoRmTag<CR>", { desc = "Go: Remove tags" })
keymap.set("n", "<leader>gie", "<cmd>GoIfErr<CR>", { desc = "Go: Add if err" })
keymap.set("n", "<leader>gfs", "<cmd>GoFillStruct<CR>", { desc = "Go: Fill struct" })

-- Flutter/Dart
keymap.set("n", "<leader>fr", "<cmd>FlutterRun<CR>", { desc = "Flutter: Run" })
keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter: Quit" })
keymap.set("n", "<leader>fR", "<cmd>FlutterReload<CR>", { desc = "Flutter: Reload" })
keymap.set("n", "<leader>fD", "<cmd>FlutterDevices<CR>", { desc = "Flutter: Devices" })
keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<CR>", { desc = "Flutter: Emulators" })

-- Rust
keymap.set("n", "<leader>rr", "<cmd>RustRunnables<CR>", { desc = "Rust: Runnables" })
keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<CR>", { desc = "Rust: Debuggables" })
keymap.set("n", "<leader>re", "<cmd>RustExpandMacro<CR>", { desc = "Rust: Expand macro" })
keymap.set("n", "<leader>rc", "<cmd>RustOpenCargo<CR>", { desc = "Rust: Open Cargo.toml" })
