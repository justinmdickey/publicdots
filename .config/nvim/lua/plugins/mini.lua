return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- require("mini.pairs").setup({})
			require("mini.icons").setup({})
			require("mini.ai").setup({})
			-- require("mini.statusline").setup({})
			require("mini.files").setup({})
		end,
	},
}
