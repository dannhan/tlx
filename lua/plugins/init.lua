local plugins = {
  "nvim-lua/plenary.nvim",

  -- language server configuration
  require("plugins.lsp.lsp-zero"),
  require("plugins.lsp.autocompletion"),
  require("plugins.lsp.mason"),
  require("plugins.lsp.misc"),

  -- switching between files/projects, searching, etc
  require("plugins.navigation.harpoon"),
  require("plugins.navigation.oil"),
  require("plugins.navigation.telescope"),
  require("plugins.navigation.persisted"),

  -- related to syntax and highlighting
  require("plugins.syntax.treesitter"),

  -- all visual settings, tab/buffer lines, colors, etc.
  require("plugins.ui.colorschemes"),
  require("plugins.ui.gitsigns"),
  require("plugins.ui.indentline"),
  require("plugins.ui.indicators"),
  require("plugins.ui.highlight-colors"),
  require("plugins.ui.ufo"),
  require("plugins.ui.scrollbar"),
  require("plugins.ui.neoscroll"),
  require("plugins.ui.statusline"),
  require("plugins.ui.devicons"),
  require("plugins.ui.alpha"),

  -- utility tools
  require("plugins.utility.autopairs"),
  require("plugins.utility.comment"),
  require("plugins.utility.numb"),
  require("plugins.utility.whichkey"),
  require("plugins.utility.motion"),
  require("plugins.utility.surround"),
  require("plugins.utility.sxhkd"),
  require("plugins.utility.todo"),
}

local config = {
  spec = nil,
  -- Configure any other settings here. See the documentation for more details.
  defaults = {
    -- always lazy loaded plugin
    lazy = true,
  },
  performance = {
    rtp = {
      ---@type string[] list any plugins you want to disable here
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
  -- automatically check for plugin updates
  checker = { enabled = false },
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup(plugins, config)
