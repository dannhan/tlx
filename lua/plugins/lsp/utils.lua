return {
	{
		-- LSP VIRTUAL TEXT
		"dgagn/diagflow.nvim",
    event = "VeryLazy",
		opts = {
			scope = "line",
			padding_right = 1,
			show_sign = true,
		},
	},
	{
		-- LSP BREADCRUMBS NAVIGATION
		"SmiteshP/nvim-navbuddy",
		opts = { lsp = { auto_attach = true } },
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
	},
}
