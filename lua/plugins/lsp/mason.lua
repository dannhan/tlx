return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      return {
        ensure_installed = { "lua_ls" },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- "custom handler" for `lua_ls`
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              on_init = function(client)
                require("lsp-zero").nvim_lua_settings(client, {})
              end,
            })
          end,
        },
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function()
      return {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        handlers = {},
        ensure_installed = {},
        automatic_installation = {},
      }
    end,
  },
}
