return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    require("nvim-web-devicons").set_icon({
      toml = {
        icon = "",
        name = "conf",
      },
    })
  end,
}
