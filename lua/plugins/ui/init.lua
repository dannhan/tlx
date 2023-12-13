return {
	-- colorscheme
	{
		{ "bluz71/vim-moonfly-colors", name = "moonfly" },
		{ "rose-pine/neovim", name = "rose-pine" },
		{ "catppuccin/nvim", name = "catppuccin" },
		{ "EdenEast/nightfox.nvim" },
		{ "Shatur/neovim-ayu" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local indent = { char = "┊" }
			require("ibl").setup({ indent = indent })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
}
