return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",
		win = {
			title_pos = "center",
			padding = { 2, 5 },
			wo = { winblend = 0 }, -- Change from 20 to 0 to fix transparency issues
		},
	},
	config = function(_, opts)
		require("which-key").setup(opts)

		-- Simple highlight fixes for neopywal
		vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "FloatBorder" })
	end,
}
