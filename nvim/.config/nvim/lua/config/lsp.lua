-- Lua（Neovim 設定用）: lua_ls
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
