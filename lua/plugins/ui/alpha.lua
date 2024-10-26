return {
  -- Dashboard. This runs when neovim starts, and is what displays
  -- the "LAZYVIM" banner.
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
          ███╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
          ████╗  ██║██║   ██║██║████╗ ████║      Z    
          ██╔██╗ ██║██║   ██║██║██╔████╔██║   z       
          ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ z         
          ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("f",     " " .. " Find File",         "<cmd>Telescope find_files<CR>", {}),
        -- dashboard.button("g",     " " .. " Find Word",         "<cmd>Telescope live_grep<CR>", {}),
        dashboard.button("h",     " " .. " Recents",           "<cmd>Telescope oldfiles hidden=true<CR>", {}),
        -- dashboard.button("l",     " " .. " Load Last Session", "<cmd>SessionManager load_last_session<CR>", {}),
        dashboard.button("u",     "󰏔 " .. " Update Plugins",    "<cmd>Lazy update<CR>", {}),
        dashboard.button("m",     "󰏓 " .. " Manage Plugins",    "<cmd>Lazy<CR>", {}),
        dashboard.button("s",     " " .. " Settings",          "<cmd>e $MYVIMRC<CR>", {}),
        dashboard.button("<ESC>", " " .. " Exit",              "<cmd>exit<CR>", {}),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      local thingy =
        io.popen('echo "$(LANG=en_us_88591; date +%a) $(date +%d) $(LANG=en_us_88591; date +%b)" | tr -d "\n"')
      if thingy == nil then
        return dashboard
      end
      local date = thingy:read("*a")
      thingy:close()
      local now = os.date("  %H:%M ")

      dashboard.section.content = {
        -- stylua: ignore
        val = {
          "╭────────────   Today is "..date.." ────────────╮",
          "│                                                │",
          "╰───══───══───══─── "..now.." ───══───══───══────╯",
        },
        type = "text",
        opts = { position = "center", hl = "AlphaFooter" },
      }
      dashboard.opts.layout = {
        { type = "padding", val = 3 },
        dashboard.section.header,
        { type = "padding", val = 1 },
        dashboard.section.content,
        -- hi_top_section,
        -- hi_middle_section,
        -- hi_bottom_section,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Hide tabline and statusline on startup screen            │
      -- ╰──────────────────────────────────────────────────────────╯
      -- TODO:
      -- make this work
      -- try to use ftplugin instead
      -- vim.api.nvim_create_augroup("alpha_tabline", { clear = true })
      --
      -- vim.api.nvim_create_autocmd("FileType", {
      --   group = "alpha_tabline",
      --   pattern = "alpha",
      --   command = "set showtabline=0 laststatus=0 noruler",
      -- })
      --
      -- vim.api.nvim_create_autocmd("FileType", {
      --   group = "alpha_tabline",
      --   pattern = "alpha",
      --   callback = function()
      --     vim.api.nvim_create_autocmd("BufUnload", {
      --       group = "alpha_tabline",
      --       buffer = 0,
      --       command = "set showtabline=2 ruler laststatus=3",
      --     })
      --   end,
      -- })
    end,
  },
}
