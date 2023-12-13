return {
  { "lewis6991/gitsigns.nvim", opts = {}, },
  -- colorscheme
  { "rose-pine/neovim", name = "rose-pine", },
  { "bluz71/vim-moonfly-colors", name = "moonfly", },
  { "Shatur/neovim-ayu" },
  { -- auto pairs
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  { -- indent blankline
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local indent = { char = '┊'}
      require('ibl').setup({ indent = indent })
    end,
  },
  { -- vim sneak
    "ggandor/lightspeed.nvim",
    config = function()
      require("lightspeed").setup({})
    end,
  },
  { -- nvim surround
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },
  { -- tailwind sorter
    'laytan/tailwind-sorter.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = 'cd formatter && npm i && npm run build',
    config = function()
      require('tailwind-sorter').setup({
        on_save_enabled = true,
      })
    end,
  },
  { -- oil
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        keymaps = {
          ["g?"]    = "actions.show_help",
          ["l"]     = "actions.select",
          ["h"]     = "actions.parent",
          ["zh"]    = "actions.toggle_hidden",
          ["q"]     = "actions.close",
          ["<C-p>"] = "actions.preview",
          ["."]     = "actions.cd",
        },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "FileExplorer" })
    end,
  },
  { -- lsp and cmp
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lsp = require('lsp-zero').preset("recommended")
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)
      lsp.setup()
      vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = false,
      })

      local cmp = require("cmp")
      -- local luasnip = require("luasnip")
      -- cmp.setup({
      --   mapping = cmp.mapping.preset.insert({
      --     ["<CR>"] = cmp.mapping.confirm({
      --       behavior = cmp.ConfirmBehavior.Replace,
      --       select = false,
      --     }),
      --     ["<Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --         cmp.select_next_item()
      --       elseif luasnip.expand_or_jumpable() then
      --         luasnip.expand_or_jump()
      --       else
      --         fallback()
      --       end
      --     end, { "i", "s" }),
      --     ["<S-Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --         cmp.select_prev_item()
      --       elseif luasnip.jumpable(-1) then
      --         luasnip.jump(-1)
      --       else
      --         fallback()
      --       end
      --     end, { "i", "s" }),
      --   }),
      -- })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {'tsserver', 'rust_analyzer'},
        handlers = {
          lsp.default_setup,
        },
      })
    end,
  },
  { -- treesitter
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true, },
        -- context_commentstring = {
        --   enable = true,
        --   enable_autocmd = false,
        -- },
        auto_install = true,
        autotag = {
          enable=true;
          enable_close_on_slash=false;
        },
      }

      local rainbow_delimiters = require('rainbow-delimiters')
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
          tsx = 'rainbow-parens',
          -- javascript = 'rainbow-parens',
        },
        highlight = {
          'RainbowDelimiterCyan',
          'RainbowDelimiterViolet',
          'RainbowDelimiterGreen',
        },
      }
      require('ts_context_commentstring').setup {}
      vim.g.skip_ts_context_commentstring_module = true
    end
  },
  { -- fzf
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require 'fzf-lua'.setup {
        finder = {
          separator = "",
        },
        winopts = {
          on_create = function()
            vim.keymap.set("t", "<Tab>", "<Down>", { silent = true, buffer = true })
            vim.keymap.set("t", "<S-Tab>", "<Up>", { silent = true, buffer = true })
          end,
        },
        keymap = {
          builtin = { ["<C-h>"] = "toggle-help" },
          fzf = {
            ["ctrl-u"] = "unix-line-discard",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-a"]  = "toggle-all",
          },
        },
        git = {
          icons = {
            ["M"] = { icon = "*", color = "yellow" },
            ["D"] = { icon = "✗", color = "red" },
            ["A"] = { icon = "+", color = "green" },
            ["R"] = { icon = "➜", color = "yellow" },
            ["C"] = { icon = ">", color = "yellow" },
            ["T"] = { icon = "➜", color = "magenta" },
            ["?"] = { icon = "?", color = "magenta" },
          },
        },
      }
    end,
    keys = {
      { "<leader>pf", "<cmd>FzfLua files<CR>",                    mode = "n", desc = "files" },
      { "<leader>ps", "<cmd>FzfLua live_grep<CR>",                mode = "n", desc = "live grep" },
      { "<leader>pb", "<cmd>FzfLua buffers<CR>",                  mode = "n", desc = "buffers"},
      { "<leader>pt", "<cmd>FzfLua colorschemes<CR>",             mode = "n", desc = "colorschemes"},
      { "<leader>pc", "<cmd>FzfLua files cwd=~/.config/nvim<CR>", mode = "n", desc = "nvim" },
      { "<leader>pn", "<cmd>FzfLua files cwd=~/Notes<CR>",        mode = "n", desc = "nvim" },
    },
  },
}
