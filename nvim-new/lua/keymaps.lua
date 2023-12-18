vim.g.mapleader = " "
local map = vim.keymap.set

if vim.g.neovide then
  map('n', '<C-s>', ':w<CR>')      -- Save
  map('v', '<C-c>', '"+y')         -- Copy
  map('n', '<C-v>', '"+P')         -- Paste normal mode
  map('v', '<C-v>', '"+P')         -- Paste visual mode
  map('c', '<C-v>', '<C-R>+')      -- Paste command mode
  map('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
map('', '<C-v>', '+p<CR>', { noremap = true, silent = true })
map('!', '<C-v>', '<C-R>+', { noremap = true, silent = true })
map('t', '<C-v>', '<C-R>+', { noremap = true, silent = true })
map('v', '<C-v>', '<C-R>+', { noremap = true, silent = true })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-j>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- navigate within instert mode
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-j>", "<Down>", { desc = "Move Left" })
map("i", "<C-k>", "<Up>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Left" })

-- copy all
map("n", "<C-c>", "<cmd> %y+<CR>", { desc = "Copy all file" })

-- line numbers
map("n", "<leader>rn", "<cmd> set rnu!<CR>", { desc = "Toggle Relative Number" })


-- indent lines
map("v", "<", "<gv")
map("v", ">", ">gv")

-- IncRename
map("n", "<leader>r", ":IncRename ")

-- Lua
map("n", "<leader>xx", function() require("trouble").toggle() end)
map("n", "gR", function() require("trouble").toggle("lsp_references") end)
