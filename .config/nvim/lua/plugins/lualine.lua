return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "neopywal", -- Change from "auto" to "neopywal"
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {

				lualine_a = {
					{
						"mode",
						separator = { left = "" },
						fmt = function(str)
							return str:sub(1, 1)
						end,
						right_padding = 2,
					},
				},

				-- lualine_a = {
				-- 	{
				-- 		"mode",
				-- 		fmt = function(str)
				-- 			return str:sub(1, 1)
				-- 		end,
				-- 	},
				-- },
				lualine_b = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						colored = true,
						symbols = { added = "+", modified = "~", removed = "-" },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
						shorting_target = 40,
						symbols = {
							modified = "[+]",
							readonly = "[RO]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
					{ "diagnostics", sources = { "nvim_diagnostic" } },
				},
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if next(clients) == nil then
								return ""
							end
							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return " " .. table.concat(names, ", ")
						end,
					},
					-- {
					-- 	"filetype",
					-- 	-- For debugging
					-- 	fmt = function(str)
					-- 		print("Filetype detected: " .. str)
					-- 		if str == "bot" then
					-- 			return "lua" -- or return "" to hide it
					-- 		end
					-- 		return str
					-- 	end,
					-- },
				},
				lualine_y = {
					{ "progress", gui = "bold" },
				},
				lualine_z = {
					{ "location", separator = { right = "" }, gui = "bold" },
				},
			},
			extensions = { "nvim-tree", "mason", "toggleterm", "lazy" },
		})
	end,
}
