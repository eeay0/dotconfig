local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}


function M.config()
  local servers = {
    -- LSPs --
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "bashls",
    "jsonls",
    "marksman",
    "clangd",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
      icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
