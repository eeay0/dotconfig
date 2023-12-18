local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {}

plugins = {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      require("plugins.lspconfig")
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "smjonas/inc-rename.nvim",
    lazy = true,
    config = function()
      require("inc_rename").setup({ preview_empty_name = true })
    end,
    event = "LspAttach"
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.trouble") end,
    event = "LspAttach"
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          auto_triger = true, --enable manual sugestions.
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/cmp-nvim-lsp-signature-help",
      'saadparwaiz1/cmp_luasnip',
      "petertriho/cmp-git",
      "onsails/lspkind.nvim",
    },
    config = function() require("plugins.completion") end,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
}
require("lazy").setup(plugins)
-- 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 install chatgpt after telescope.nvim
