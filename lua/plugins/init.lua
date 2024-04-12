local plugins = {
  "nvim-lua/plenary.nvim",

  -- language server configuration
  require("plugins.lsp.lsp-zero"),
  require("plugins.lsp.utils"),
  require("plugins.lsp.code-action"),

  -- switching between files/projects, searching, etc
  require("plugins.navigation.harpoon"),
  require("plugins.navigation.oil"),
  require("plugins.navigation.telescope"),
  require("plugins.navigation.persisted"),

  -- related to syntax and highlighting
  require("plugins.syntax.treesitter"),

  -- all visual settings, tab/buffer lines, colors, etc.
  require("plugins.ui.colorscheme"),
  require("plugins.ui.gitsigns"),
  require("plugins.ui.indentline"),
  require("plugins.ui.indicators"),
  require("plugins.ui.colorizer"),
  require("plugins.ui.ufo"),
  require("plugins.ui.scrollbar"),
  require("plugins.ui.neoscroll"),
  require("plugins.ui.statusline"),
  require("plugins.ui.devicons"),

  -- utility tools
  require("plugins.utility.autopairs"),
  require("plugins.utility.comment"),
  require("plugins.utility.numb"),
  require("plugins.utility.whichkey"),
  require("plugins.utility.motion"),
  require("plugins.utility.surround"),
  require("plugins.utility.bracey"),
  require("plugins.utility.lazygit")
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

lazy.setup(plugins, {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "terPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = { border = "rounded" },
})
