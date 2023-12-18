return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("barbecue").setup({
        attach_navic = false,
      })
    end,
  },
}
