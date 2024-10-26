return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  opts = function()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    return {
      sources = {
        { name = "nvim_lsp" },
        { name = "lazydev", group_index = 0 },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      }),
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      formatting = {
        -- color indicator when using something like tailwind
        format = require("nvim-highlight-colors").format,
      },
    }
  end,

  -- example code of opts
  -- opts = function(_, opts)
  --   opts.sources = opts.sources or {}
  --   table.insert(opts.sources, {
  --     name = "lazydev",
  --     group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --   })
  -- end,
}
