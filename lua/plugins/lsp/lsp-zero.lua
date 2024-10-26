-- TODO: reduce the boilerplate code
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
  },
  { "nvimtools/none-ls.nvim" },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = "yes"
    end,
    config = function()
      local lsp_zero = require("lsp-zero")

      -- TODO: find out why client arg do not used here
      local lsp_attach = function(_, bufnr)
        -- this is where you enable features that only work
        -- if there is a language server active in the file
        vim.keymap.set(
          { "n", "x" },
          "gq",
          '<cmd>lua vim.lsp.buf.format({async = true, timeout_ms = 2000, filter = function(client) return client.name == "null-ls" end})<cr>',
          { buffer = bufnr, desc = "Format file" }
        )
        -- INFO: this might be deleted later
        vim.keymap.set(
          { "n", "v" },
          "gd",
          "<cmd>Telescope lsp_definitions<CR>",
          { buffer = bufnr, desc = "Go to definition" }
        )
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = true })
      end

      lsp_zero.extend_lspconfig({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        lsp_attach = lsp_attach,
        sign_text = {
          error = "✘",
          warn = "▲",
          hint = "⚑",
          info = "»",
        },
      })

      require("mason-lspconfig")
      -- TODO: why i need to call this setup
      -- INFO: might change to conform
      require("null-ls").setup()
      require("mason-null-ls")
    end,
  },
}
