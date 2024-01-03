-- Utilities for creating configurations
local util = require("formatter.util")
require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {require("formatter.filetypes.lua").luaformat},
        cmake = {require("formatter.filetypes.cmake").cmakeformat},
        c = {require("formatter.filetypes.c").clangformat},
        css = {require("formatter.filetypes.css").prettier},
        json = {require("formatter.filetypes.json").prettier},
        cpp = {require("formatter.filetypes.c").clangformat},
        sh = {require("formatter.filetypes.sh").shfmt},
        zsh = {require("formatter.filetypes.sh").shfmt},
        markdown = {require("formatter.filetypes.markdown").prettierd},
        toml = {require("formatter.filetypes.toml").taplo},
        ["*"] = {require("formatter.filetypes.any").remove_trailing_whitespace}
    }
})
