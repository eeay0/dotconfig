require("neorg").setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    default = "~/notes",
                    personal = "~/notes/personal",
                    work = "~/notes/work",
                    programming = "~/notes/programming"
                }
            }
        },
        ["core.mode"] = {},
        ["core.autocommands"] = {},
        ["core.highlights"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.completion"] = {config = {engine = "nvim-cmp", name = "NORG"}}
    }
}
