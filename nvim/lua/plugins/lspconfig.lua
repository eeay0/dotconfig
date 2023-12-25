require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})
local lspconfig = require("lspconfig")
local variables = require("utils.variables")
for _, server in pairs(variables.servers) do
    lspconfig[server.name].setup({ server.setup })
end
