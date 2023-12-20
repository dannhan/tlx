return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvimtools/none-ls.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "folke/neodev.nvim",
      "SmiteshP/nvim-navbuddy",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require("neodev").setup({})

      -- lsp keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        end,
      })
      vim.keymap.set("n", "<C-i>", function()
        vim.lsp.buf.format({
          filer = function(client) return client.name == "null-ls" end,
        })
      end)

      -- sign icons
      local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- LSP SERVER MANAGEMENT
      require("null-ls").setup({})
      require("mason").setup({})
      require("mason-lspconfig").setup({
        handlers = {
          function(server) require("lspconfig")[server].setup({}) end,
        },
        ensure_installed = {},
      })
      require("mason-null-ls").setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        handlers = {},
        ensure_installed = {},
        automatic_installation = {},
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    opts = {},
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}
