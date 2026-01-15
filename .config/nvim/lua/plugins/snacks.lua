return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = {
			enabled = true,
			layout = {
				-- The default layout for "telescopy" pickers, e.g. `files`, `commands`, ...
				-- It will not override non-standard pickers, e.g. `explorer`, `lines`, ...
				preset = function()
					return vim.o.columns >= 120 and "telescope" or "vertical"
				end,
			},
			layouts = {
				telescope = {
					-- Copy from https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#telescope
					reverse = false,
					layout = {
						box = "horizontal",
						backdrop = true,
						width = 0.8, -- Change the width
						height = 0.9,
						border = "none",
						{
							box = "vertical",
							{
								win = "input",
								height = 1,
								border = "rounded",
								title = "{title} {live} {flags}",
								title_pos = "center",
							},
							{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
						},
						{
							win = "preview",
							title = "{preview:Preview}",
							width = 0.65, -- Change the preview width
							border = "rounded",
							title_pos = "center",
						},
					},
				},
			},
			sources = {
				files = {},
				explorer = {
					show_hidden = true,
					layout = {
						layout = {
							position = "left",
						},
					},
				},
				lines = {
					layout = {
						preset = function()
							return vim.o.columns >= 120 and "telescope" or "vertical"
						end,
					},
				},
			},
		},
		styles = {},
		image = {
			enabled = true,
			max_height = 12,
		},
		bigfile = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 10000,
		},
		quickfile = { enabled = true },
		animate = {
			enabled = true,
		},
		statuscolumn = { enabled = true },
		scroll = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
		dim = {
			enabled = false,
			scope = {
				min_size = 5,
				max_size = 20,
				siblings = false,
			},
		},
		zen = {
			enabled = true,
			win = {
				width = 100,
				backdrop = { transparent = true, blend = 40 },
			},
			toggles = {
				dim = false,
			},
		},
		indent = {
			enabled = true,
			indent = {
				enabled = true, -- enable indent guides
				char = "│",
				blank = " ",
				--blank = "∙",
				only_scope = true, -- only show indent guides of the scope
				only_current = false, -- only show indent guides in the current window
				hl = {
					"SnacksIndent1",
					"SnacksIndent2",
					"SnacksIndent3",
					"SnacksIndent4",
					"SnacksIndent5",
					"SnacksIndent6",
					"SnacksIndent7",
					"SnacksIndent8",
				},
			},
			chunk = {
				enabled = true,
			},
		},
		input = {
			enabled = true,
		},
		terminal = {
			layout = {
				height = 0.2,
			},
		},
		dashboard = {
			enabled = true,
			preset = {
				header = [[

	  ██████   █████                   █████   █████  ███                  
	 ░░██████ ░░███                   ░░███   ░░███  ░░░                   
	  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   
	  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  
	  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  
	  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  
	  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ 
	 ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  
	                                                                       
    ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
	keys = {

		{
			"<leader>uD",
			function()
				Snacks.dim.enable()
			end,
			desc = "Enable Dim",
		},

		-- Picker

		{
			"<leader>e",
			function()
				Snacks.picker.explorer({ layout = { layout = { width = 28 } } })
			end,
			desc = "Explorer",
		},

		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
				-- Snacks.picker.smart({ layout = { preset = "default" } })
			end,
			desc = "Smart",
		},
		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fC",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>gF",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- git
		{
			"<leader>gc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			-- This is my reference comment
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>qp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},

		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},

		{
			"<leader>uz",
			function()
				Snacks.zen()
			end,
		},

		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gh",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename()
			end,
			desc = "Rename File",
		},
		-- {
		-- 	"<c-/>",
		-- 	function()
		-- 		Snacks.terminal()
		-- 	end,
		-- 	desc = "Toggle Terminal",
		-- },
		{
			"<leader>t",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
		},
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
				})
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
			end,
		})
	end,
}
