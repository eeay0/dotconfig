local variables = {}
variables.servers = {
    lua = {
        name = "lua_ls",
        setup = {
            settings = {
                completion = {
                    autoRequire = true,
                    callSnippet = "Both",
                    displayContext = 1,
                    keywordSnippet = "Both"
                }
            }
        }
    },
    c_cpp = {name = "ccls"},
    bash = {name = "bashls"},
    css = {name = "cssls"},
    json = {name = "jsonls"},
    markdown = {name = "prosemd_lsp"},
    toml = {name = "taplo"},
}
return variables
