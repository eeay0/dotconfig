-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function open_close()
        api.node.open.edit()
        api.tree.close()
    end

    local function change_cwd()
        local node = api.tree.get_node_under_cursor()
        api.tree.change_root_to_node()
        vim.api.nvim_set_current_dir(node.absolute_path)
    end
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<S-l>", open_close, opts("Close"))
    vim.keymap.set("n", "<CR>", change_cwd, opts("CD"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

-- empty setup using defaults
require("nvim-tree").setup({
    on_attach = my_on_attach,
    disable_netrw = false,
    hijack_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    renderer = {
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = true,
                    color = true,
                },
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        debounce_delay = 15,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "󰌶",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
})

-- autocmd to close nvim-tree
