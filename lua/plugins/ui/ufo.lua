-- Make Neovim's fold look modern and keep high performance.
-- zo: open fold, zc: close fold
return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "indent"
  end,
  opts = {
    provider_selector = function(_, _, _)
      return { "treesitter", "indent" }
    end,
  },
}
