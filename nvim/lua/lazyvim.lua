local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

plugins = {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function() require("plugins.lspconfig") end,
        event = {"BufReadPost", "BufNewFile"},
        dependencies = {"folke/neodev.nvim"}
    }, {
        "smjonas/inc-rename.nvim",
        lazy = true,
        config = function()
            require("inc_rename").setup({preview_empty_name = true})
        end,
        event = "LspAttach"
    }, {
        "folke/trouble.nvim",
        lazy = true,
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("plugins.trouble") end,
        event = "LspAttach"
    }, {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false,
                    auto_triger = true -- enable manual sugestions.
                },
                panel = {enabled = false}
            })
        end
    }, {
        "zbirenbaum/copilot-cmp",
        config = function() require("copilot_cmp").setup() end
    }, {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = {"InsertEnter", "CmdlineEnter"},
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip", "petertriho/cmp-git",
            "onsails/lspkind.nvim"
        },
        config = function() require("plugins.completion") end
    }, {
        "L3MON4D3/LuaSnip",
        lazy = true,
        version = "v2.*",
        dependencies = {"rafamadriz/friendly-snippets"},
        build = "make install_jsregexp"
    }, {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = {"BufReadPost", "BufNewFile"},
        config = function() require("plugins.treesitter") end,
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim", {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
                }, "nvim-treesitter/nvim-treesitter-context",
                "HiPhish/rainbow-delimiters.nvim"
            },
            config = function() require("plugins.telescope") end,
            event = "BufWinEnter"
        }
    }, {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        lazy = true,
        config = function() require("plugins.nvimtree") end
    }, {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function() require("plugins.theme") end
    }, {
        "nvim-lualine/lualine.nvim",
        config = function() require("plugins.lualine") end
    }, {
        "akinsho/bufferline.nvim",
        version = "*",
        lazy = true,
        event = "BufWinEnter",
        config = function() require("plugins.bufferline") end
    }, {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function() require("plugins.noice") end,
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
    }, {
        "mfussenegger/nvim-dap",
        event = "LspAttach",
        config = function() require("plugins.dap") end,
        dependencies = {
            "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui",
            "nvim-telescope/telescope-dap.nvim"
        }
    }, {
        "numToStr/Comment.nvim",
        lazy = true,
        event = "InsertEnter",
        config = function()
            require("Comment").setup({
                toggler = {line = "<leader>gc", block = "<leader>gb"}
            })
        end
    }, {
        "folke/todo-comments.nvim",
        lazy = true,
        event = "BufWinEnter",
        config = function() require("plugins.todo") end
    }, {
        "mhartington/formatter.nvim",
        lazy = true,
        cmd = {"Format", "FormatWrite"},
        config = function() require("plugins.formatter") end
    }, {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = true,
        event = "BufReadPost",
        config = function() require("plugins.indentline") end
    }, {
        "nvim-focus/focus.nvim",
        lazy = true,
        event = "BufWinEnter",
        config = function()
            require("focus").setup({
                ui = {cursorline = false, signcolumn = false}
            })
        end
    }, {
        "williamboman/mason.nvim",
        lazy = true,
        event = "BufWinEnter",
        config = function() require("plugins.mason") end
    }
}
require("lazy").setup(plugins)
