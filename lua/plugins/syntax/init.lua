return {
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"HiPhish/rainbow-delimiters.nvim",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				autotag = {
					enable = true,
					enable_close_on_slash = false,
				},
			})

			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
					tsx = "rainbow-parens",
					-- javascript = 'rainbow-parens',
				},
				highlight = {
					"RainbowDelimiterCyan",
					"RainbowDelimiterViolet",
					"RainbowDelimiterGreen",
				},
			}
		end,
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					c = { "astyle" },
					cpp = { "astyle" },
					javascript = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					html = { { "prettierd", "prettier" } },
					css = { { "prettierd", "prettier" } },
				},
			})
		end,
	},

	-- highlight
	{
		{
			-- WORD USAGE HIGHLIGHTER
			"RRethy/vim-illuminate",
		},
		{
			-- HIGHLIGHT YANKED REGION
			"machakann/vim-highlightedyank",
		},
	},
}
