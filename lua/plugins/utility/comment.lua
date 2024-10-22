return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    ft = "typescriptreact",
    opts = { enable_autocmd = false },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
}
