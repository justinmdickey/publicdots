return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup()

			-- Set the keybind to toggle current line blame
			vim.keymap.set(
				"n",
				"<leader>gb",
				gitsigns.toggle_current_line_blame,
				{ noremap = true, silent = true, desc = "Toggle Blame" }
			)
		end,
	},
}
