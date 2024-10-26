return {
  -- Highlight indent line and the current chunk (context) cursor stayed
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        duration = 50,
        delay = 0,
      },
      line_num = {
        enable = true,
      },
      indent = {
        enable = true,
        chars = { "┊" },
      },
    },
  },
  -- INFO: there is a bug in hlchunk indent currently use another plugin for indent
  -- {
  --   "lucastavaresa/simpleIndentGuides.nvim",
  --   lazy = false,
  --   config = function()
  --     require("simpleIndentGuides").setup("┊") -- · | ╎ ┊ │
  --     vim.opt.list = true -- enable in all buffers
  --   end,
  -- },
}
