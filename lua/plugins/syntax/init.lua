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
				ensure_installed = {},
				modules = {},
				ignore_install = {},
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
}
