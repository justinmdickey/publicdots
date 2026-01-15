return {
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				require("duck").hatch("🦖", 4)
			end, { desc = "Hatch" })
			vim.keymap.set("n", "<leader>dk", function()
				require("duck").cook()
			end, { desc = "Cook" })
			vim.keymap.set("n", "<leader>da", function()
				require("duck").cook_all()
			end, { desc = "Cook All" })
		end,
	},
}
