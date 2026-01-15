return {
	{
		"OXY2DEV/markview.nvim",
		lazy = true, -- Recommended
		ft = { "markdown", "Avante" },
		opts = {
			preview = {
				filetypes = { "markdown", "Avante" },
			},
		},
		-- config = function()
		-- 	-- Require the presets module
		-- 	local presets = require("markview.presets")
		-- 	require("markview").setup({
		-- 		preview = {
		-- 			modes = { "n", "i", "no", "c" },
		-- 			hybrid_modes = { "i" },
		--
		-- 			checkboxes = presets.checkboxes.nerd,
		-- 			headings = presets.headings.arrowed,
		-- 			horizontal_rules = presets.horizontal_rules.thick,
		-- 			-- This is nice to have
		-- 			callbacks = {
		-- 				on_enable = function(_, win)
		-- 					vim.wo[win].conceallevel = 2
		-- 					vim.wo[win].concealcursor = "nc"
		-- 				end,
		-- 			},
		-- 		},
		-- 	})
		-- end,

		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
