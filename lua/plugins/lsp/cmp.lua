return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip/loaders/from_vscode").lazy_load()

      cmp.setup({
        experimental = { ghost_text = false },
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
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
    end,
  },
  {
    -- DOCUMENT/CODE SYNTAX TREE
    -- h: close, l: open, W: close all, E: open all
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "gs", "<cmd>Outline<CR>", desc = "List document symbols in a tree" },
      {
        "<leader><leader>of",
        "<cmd>OutlineFollow<CR>",
        desc = "Focus cursor inside symbols outline window on current node"
      }
    },
    opts = { outline_window = { position = "left", width = 25 } }
  }, {
  -- MINIMAP
  "gorbit99/codewindow.nvim",
  config = function()
    require("codewindow").setup({
      auto_enable = false,
      use_treesitter = true,           -- disable to lose colours
      exclude_filetypes = {
        "Outline", "neo-tree", "qf", "packer", "help", "noice",
        "Trouble"
      }
    })
    vim.keymap.set("n", "<leader><leader>m",
      "<cmd>lua require('codewindow').toggle_minimap()<CR>",
      {
        noremap = true,
        silent = true,
        desc = "Toggle minimap"
      })
  end
}
}
