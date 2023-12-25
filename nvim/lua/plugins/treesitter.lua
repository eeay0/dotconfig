local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "json",
        "toml",
        "make",
        "markdown_inline",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})

-- This module contains a number of default definitions
local rainbow_delimiters = require("rainbow-delimiters")

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
    },
    query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
    },
    priority = {
        [""] = 110,
        lua = 210,
    },
}
