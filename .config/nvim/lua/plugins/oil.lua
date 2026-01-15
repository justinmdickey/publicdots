return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				case_insensitive = true,
				preview = {
					min_width = 0.85,
				},
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
			columns = {
				"icon",
			},
			keymaps = {
				["<esc>"] = { "actions.close", mode = "n" },
			},
			float = {
				padding = 1,
				border = "rounded",
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
				get_win_title = function()
					return "Oil"
				end,
				preview_split = "auto",
				preview_win = {
					-- Whether the preview window is automatically updated when the cursor is moved
					update_on_cursor_moved = true,
					-- How to open the preview window "load"|"scratch"|"fast_scratch"
					preview_method = "load",
					-- A function that returns true to disable preview on a file e.g. to avoid lag
					disable_preview = function(filename)
						return false
					end,
					-- Window-local options to use for preview window buffers
					win_options = {
						winblend = 0,
						winhighlight = "Normal:Normal,FloatBorder:Normal",
					},
				},
				-- win_options = {
				max_width = 0.9,
				max_height = 0.9,
			},
		})
	end,
	--  vim.api.nvim_set_keymap( "n", "<leader>of", [[<cmd>lua require("oil").toggle_float()<CR>]], { noremap = true, silent = true, desc = "Toggle Oil float" } )
}
