return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<leader>ca",
                    refresh = "<A-r>",
                    open = "<A-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            suggestion = {
                auto_trigger = false,
                debounce = 50,
                keymap = {
                    accept = "<A-a>",
                    accept_word = "<A-w>",
                    accept_line = "<A-l>",
                    next = "<A-]>",
                    prev = "<A-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                yaml = true,
            },
            copilot_node_command = "node", -- Node.js version must be > 18.x
            server_opts_overrides = {},
        })
    end,
}
