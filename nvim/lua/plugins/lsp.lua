return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        "nvimdev/lspsaga.nvim",
        "folke/neodev.nvim",
        "smjonas/inc-rename.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local variables = require("utils.variables")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.offsetEncoding = "utf-8"

        local map = vim.keymap.set

        require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
        require("inc_rename").setup({})
        require("lspsaga").setup({})

        for _, opts in pairs(variables.Ft_Opts) do
            if opts.lsp then
                if opts.lsp.conf then
                    lspconfig[opts.lsp.lsp].setup(opts.lsp.conf)
                    lspconfig[opts.lsp.lsp].setup({ capabilities = capabilities })
                else
                    lspconfig[opts.lsp.lsp].setup({})
                    lspconfig[opts.lsp.lsp].setup({ capabilities = capabilities })
                end
            end
        end

        local opts = { noremap = true, silent = true }

        map("n", "<space>e", vim.diagnostic.open_float)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
        map("n", "<space>q", vim.diagnostic.setloclist)
        map("n", "<space>rn", ":IncRename ", opts)
        map("n", "<space>f", "<cmd> GuardFmt <CR>", opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        --                map('n', '<C-s>', vim.lsp.buf.signature_help, opts)
        map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        map("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        map("n", "<space>D", vim.lsp.buf.type_definition, opts)
        -- map('n', '<space>rn', vim.lsp.buf.rename, opts)
        map({ "n", "v" }, "<space>ca", "<cmd> Lspsaga code_action <CR>", opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        -- map("n", "<space>f", function() vim.lsp.buf.format({ async = true }) end, opts)

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "󰌶",
                    [vim.diagnostic.severity.HINT] = "",
                },
            },
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "none",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
