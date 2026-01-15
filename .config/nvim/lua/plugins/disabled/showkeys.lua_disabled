return {
	{
		"siduck/showkeys",
		cmd = "ShowkeysToggle",
		opts = {
			timeout = 2,
			maxkeys = 8,
			position = "bottom-center",
			keyformat = {
				["<BS>"] = "󰁮",
				["<PageUp>"] = "pg 󰁝",
				["<PageDown>"] = "pg 󰁞",
			},
		},
		vim.keymap.set("n", "<leader>uk", "<CMD>ShowkeysToggle<CR>", { desc = "Showkeys" }),
		-- vim.schedule(function()
		--   vim.cmd("ShowkeysToggle")
		-- end),
	},
}
