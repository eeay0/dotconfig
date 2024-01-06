require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-expand-or-jump", true, true,
                                    true), "")
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-jump-prev", true, true, true),
                                "")
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "luasnip"}, -- For luasnip users.
        {name = "buffer"}, {name = "path"}, {name = "nvim_lsp_signature_help"},
        {name = "copilot"}, {name = "emoji"}, {name = 'nerdfont'}
    }),
    preselect = cmp.PreselectMode.Item,
    matching = {
        disallow_fuzzy_matching = false,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = false,
        disallow_prefix_unmatching = false
    },
    experimental = {ghost_text = true}

})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        {name = "git"} -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {{name = "buffer"}})
})

cmp.setup.filetype("markdown", {
    sources = cmp.config.sources({
        {name = "buffer"}, {name = "path"}, {name = "nvim_lsp"},
        {name = "luasnip"}, {name = "buffer"}, {
            name = "look",
            keyword_length = 2,
            optinon = {convert_case = true, loud = true}
        }, {name = "dictionary", keyword_length = 2}, {
            name = 'spell',
            option = {
                keep_all_entries = false,
                enable_in_context = function() return true end
            }
        }, {name = 'emoji'}, {name = 'nerdfont'}

    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({"/", "?"}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = "buffer"}}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local variables = require("utils.variables")

for _, server in pairs(variables.servers) do
    require("lspconfig")[server.name].setup({capabilities = capabilities})
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local npairs = require("nvim-autopairs")
npairs.setup({fast_wrap = {}})

local lspkind = require("lspkind")
lspkind.init({symbol_map = {Copilot = " "}})
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg = "#6CC644"})

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                buffer = "BUF",
                nvim_lsp = "LSP",
                luasnip = "SNIP",
                nvim_lua = "LUA",
                latex_symbols = "Latex"
            }
        })
    }
})
