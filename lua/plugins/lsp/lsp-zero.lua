return {
  {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    branch = "v2.x",
    dependencies = {
      -- LSP
      "neovim/nvim-lspconfig",
      "nvimtools/none-ls.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "folke/neodev.nvim",
      { "j-hui/fidget.nvim", opts = {} },

      -- CMP
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("neodev").setup({})

      local lsp = require("lsp-zero").preset("recommended")

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      end)

      lsp.set_sign_icons({
        error = "",
        warn = "",
        hint = "",
        information = "",
        other = "",
      })

      lsp.setup()

      vim.diagnostic.config({ virtual_text = false })

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip/loaders/from_vscode").lazy_load()

      cmp.setup({
        experimental = { ghost_text = false },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        sorting = {
          priority_weight = 0,
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.locality,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.offset,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
          },
        },
      })

      -- null-ls
      require("null-ls").setup({})
      require("mason-null-ls").setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        handlers = {},
        ensure_installed = {},
        automatic_installation = {},
      })

      vim.keymap.set("n", "<C-i>", function()
        vim.lsp.buf.format({
          filer = function(client)
            return client.name == "null-ls"
          end,
        })
      end)
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    opts = {},
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
  -- {
  --   "williamboman/mason.nvim", -- Optional
  --   cmd = "Mason",
  -- },
  -- {
  --   "dmmulroy/tsc.nvim",
  --   cmd = { "TSC" },
  --   config = true,
  -- },
}
