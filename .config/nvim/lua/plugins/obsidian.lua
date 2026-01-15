return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "Notes",
				path = "~/Documents/Notes",
			},
		},
		ui = {
			enable = false,
		},
		daily_notes = {
			folder = "/dailies",
			date_format = "%m-%d-%Y",
		},
	},
}
