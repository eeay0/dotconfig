require("bufferline").setup({
    options = {
        separator_style = "slope",
        numbers = "ordinal",
        max_name_length = 20,
        tab_size = 15,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true, -- use a "true" to enable the default, or set your own character
            },
        },
    },
})
