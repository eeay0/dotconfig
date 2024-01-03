vim.g.mapleader = " "
local map = vim.keymap.set

if vim.g.neovide then
    map("n", "<C-s>", "<cmd>w<CR>") -- Save
    map("v", "<C-c>", "\"+y") -- Copy
    map("n", "<C-v>", "\"+P") -- Paste normal mode
    map("v", "<C-v>", "\"+P") -- Paste visual mode
    map("c", "<C-v>", "<C-R>+") -- Paste command mode
    map("i", "<C-v>", "<ESC>l\"+Pli") -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
map("", "<C-v>", "+p<CR>", {noremap = true, silent = true})
map("!", "<C-v>", "<C-R>+", {noremap = true, silent = true})
map("t", "<C-v>", "<C-R>+", {noremap = true, silent = true})
map("v", "<C-v>", "<C-R>+", {noremap = true, silent = true})

-- better up/down
map({"n", "x"}, "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
map({"n", "x"}, "<Down>", "v:count == 0 ? 'gj' : 'j'",
    {expr = true, silent = true})
map({"n", "x"}, "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
map({"n", "x"}, "<Up>", "v:count == 0 ? 'gk' : 'k'",
    {expr = true, silent = true})

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", {desc = "Go to left window", remap = true})
map("n", "<C-j>", "<C-w>j", {desc = "Go to lower window", remap = true})
map("n", "<C-k>", "<C-w>k", {desc = "Go to upper window", remap = true})
map("n", "<C-l>", "<C-w>l", {desc = "Go to right window", remap = true})

-- Resize window using <ctrl> arrow keys
map("n", "<C-A-k>", "<cmd>resize +2<cr>", {desc = "Increase window height"})
map("n", "<C-A-j>", "<cmd>resize -2<cr>", {desc = "Decrease window height"})
map("n", "<C-A-h>", "<cmd>vertical resize -2<cr>",
    {desc = "Decrease window width"})
map("n", "<C-A-l>", "<cmd>vertical resize +2<cr>",
    {desc = "Increase window width"})

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", {desc = "Move down"})
map("n", "<A-k>", "<cmd>m .-2<cr>==", {desc = "Move up"})
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", {desc = "Move down"})
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", {desc = "Move up"})
map("v", "<A-j>", ":m '>+1<cr>gv=gv", {desc = "Move down"})
map("v", "<A-k>", ":m '<-2<cr>gv=gv", {desc = "Move up"})

-- buffers
map("n", "<S-j>", "<cmd>BufferLineCyclePrev<cr>", {desc = "Prev buffer"})
map("n", "<S-k>", "<cmd>BufferLineCycleNext<cr>", {desc = "Next buffer"})

map("n", "<C-[>", "<cmd>BufferLineMovePrev<cr>", {desc = "Move Buffer Prev"})
map("n", "<C-]>", "<cmd>BufferLineMoveNext<cr>", {desc = "Move Buffer Next"})

map("n", "<C-d>", "<cmd>bdelete<cr>", {desc = "Delete Buffer"})
map("n", "<C-n>", "<cmd>enew<cr>", {desc = "New Buffer"})

map("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", {desc = "Buffer 1"})
map("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", {desc = "Buffer 2"})
map("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", {desc = "Buffer 3"})
map("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", {desc = "Buffer 4"})
map("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", {desc = "Buffer 5"})

-- Clear search with <esc>
map({"i", "n"}, "<esc>", "<cmd>noh<cr><esc>",
    {desc = "Escape and clear hlsearch"})

-- save file
map({"i", "x", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>", {desc = "Save file"})

-- windows
map("n", "<leader>ww", "<C-W>p", {desc = "Other window", remap = true})
map("n", "<leader>wd", "<C-W>c", {desc = "Delete window", remap = true})
map("n", "<leader>w-", "<C-W>s", {desc = "Split window below", remap = true})
map("n", "<leader>w|", "<C-W>v", {desc = "Split window right", remap = true})
map("n", "<leader>-", "<C-W>s", {desc = "Split window below", remap = true})
map("n", "<leader>|", "<C-W>v", {desc = "Split window right", remap = true})

-- navigate within instert mode
map("i", "<C-h>", "<Left>", {desc = "Move Left"})
map("i", "<C-j>", "<Down>", {desc = "Move Left"})
map("i", "<C-k>", "<Up>", {desc = "Move Left"})
map("i", "<C-l>", "<Right>", {desc = "Move Left"})

-- copy all
map("n", "<C-c>", "<cmd> %y+<CR>", {desc = "Copy all file"})

-- line numbers
map("n", "<leader>rn", "<cmd> set rnu!<CR>", {desc = "Toggle Relative Number"})

-- indent lines
map("v", "<", "<gv")
map("v", ">", ">gv")

-- IncRename
-- map("n", "<leader>r", "<cmd>IncRename<CR> ")

-- Trouble
map("n", "<leader>t", function() require("trouble").toggle() end)
map("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<A-o>", builtin.find_files, {})
map("n", "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})

-- NvimTree
map("n", "<A-f>", "<cmd>NvimTreeToggle<CR>", {desc = "Toggle NvimTree"})

-- Dap
map("n", "<F5>", function() require("dap").continue() end)
map("n", "<F10>", function() require("dap").step_over() end)
map("n", "<F11>", function() require("dap").step_into() end)
map("n", "<F12>", function() require("dap").step_out() end)
map("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
map("n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
map("n", "<Leader>dr", function() require("dap").repl.open() end)
map("n", "<Leader>dl", function() require("dap").run_last() end)
map({"n", "v"}, "<Leader>dh", function() require("dap.ui.widgets").hover() end)
map({"n", "v"}, "<Leader>dp", function() require("dap.ui.widgets").preview() end)
map("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)
map("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)

local opts = {}
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "H", vim.lsp.buf.hover, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "<C-h>", vim.lsp.buf.signature_help, opts)
map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
map("n", "<space>wl",
    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    opts)
map("n", "<space>D", vim.lsp.buf.type_definition, opts)
map('n', '<space>r', vim.lsp.buf.rename, opts) -- I use IncRename plugin instead.
map({"n", "v"}, "<space>ca", vim.lsp.buf.code_action, opts)
map("n", "gr", vim.lsp.buf.references, opts)

-- todo comments
map("n", "tn", function() require("todo-comments").jump_next() end,
    {desc = "Next todo comment"})

map("n", "tp", function() require("todo-comments").jump_prev() end,
    {desc = "Previous todo comment"})

-- TODO:
-- 1. Add TodoTrouble command
-- 2. Add TodoTelescople Command

-- Formatter
map("n", "<leader>f", "<cmd>w<cr> <cmd>FormatWrite<cr>", {desc = "Format"})
