local variables = {}
variables.servers = {
  lua = {
    name = "lua_ls",
    settings = {
      completion = {
        autoRequire = true,
        callSnippet = "Both",
        displayContext = 1,
        keywordSnippet = "Both",
      }
    }
  }
}

return variables
