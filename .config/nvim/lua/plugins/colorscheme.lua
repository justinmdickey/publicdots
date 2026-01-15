return {

	-- Shades & Huefy

	{
		"NvChad/nvim-colorizer.lua", -- or "catgoose/nvim-colorizer.lua" depending on which fork you want
		lazy = false,
		opts = {
			filetypes = {
				"*",
				conf = { rgb_fn = true, mode = "background" },
			}, -- Enable for all filetypes
			user_default_options = {
				rgb_fn = true, -- Enable highlighting for rgb() functions
				css_fn = true,
				css = true,
				-- You can keep all the defaults and just add what you need to override
				mode = "background", -- Set how colors are displayed (background, foreground, virtualtext)
			},
		},
	},

	-- {
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup(nil, {
	-- 			rgb_fn = true,
	-- 		})
	-- 	end,
	-- },

	{ "nvzone/volt", lazy = true },
	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},

	-- Color Schemes

	-- {
	-- 	"atelierbram/Base2Tone-nvim",
	-- },

	{
		"RedsXDD/neopywal.nvim",
		name = "neopywal",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			custom_colors = {},
			plugins = {
				which_key = true,
			},
		},
		config = function(_, opts)
			require("neopywal").setup(opts)
			vim.cmd("colorscheme neopywal")
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},

	--  {
	--    "tinted-theming/base16-vim",
	--    config = function()
	--      vim.g.base16_background_transparent = 1
	--    end,
	--  },

	{
		"bettervim/yugen.nvim",
		lazy = true,
		config = function() end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = {
			flavour = "mocha",
			transparent_background = false,
		},
		config = function()
			-- vim.cmd("colorscheme catppuccin")
		end,
	},

	{
		"neanias/everforest-nvim",
		lazy = true,
		version = false,
		opts = {
			background = "hard",
			transparent_background_level = 0,
		},
		config = function()
			-- vim.cmd("colorscheme everforest")
		end,
	},

	{
		"sainnhe/gruvbox-material",
		lazy = true,
		config = function()
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			require("kanagawa").setup({
				transparent = false,
			})
		end,
	},

	{
		"rose-pine/neovim",
		lazy = true,
	},

	{
		"marko-cerovac/material.nvim",
		lazy = true,
		config = function()
			require("material").setup()
			-- vim.cmd("colorscheme material-deep-ocean")
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		name = "github-theme",
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})
			-- vim.cmd("colorscheme github_dark_default")
		end,
	},

	{
		"AlexvZyl/nordic.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			-- require("nordic").load()
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night", -- "storm", "day", "night", "moon"
			transparent = false, -- Enable transparent background
		},
	},

	{
		"idr4n/github-monochrome.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			colors = {

				black = "#0c0e15",
				-- bg0 = "#171922",
				-- bg1 = "#1c2029",
				-- bg2 = "#283347",
				-- bg3 = "#2a324a",
				-- bg_d = "#141b24",
				--
				-- fg = "#becfea",

				bg0 = "#101012",
				bg1 = "#1d1d20",
				bg2 = "#29292d",
				bg3 = "#35353a",
				bg4 = "#414147",
				bg_d = "#28282c",

				fg = "#eaeaec",

				purple = "#c75ae8",
				green = "#8bcd5b",
				orange = "#dd9046",
				blue = "#41a7fc",
				yellow = "#efbd5d",
				cyan = "#34bfd0",
				red = "#f65866",
				-- grey = "#455574",
				grey = "#6c7d8c",

				bg_green = "#3f6c20",
				bg_yellow = "#e48a23",
				bg_blue = "#1e75bd",
				dark_cyan = "#008b9c",
				dark_purple = "#77328c",
				dark_yellow = "#e48a23",
				light_grey = "#6c7d9c",
				dark_red = "#992f38",
				diff_add = "#27341c",
				diff_delete = "#331c1e",
				diff_change = "#102b40",
				diff_text = "#1c4a6e",
			},
			style = "deep",
			transparent = true,
		},
	},

	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	-- 	opts = {
	-- 		colors = {
	-- 			black = "#f0f2f9",
	-- 			bg0 = "#f5f6fd",
	-- 			bg1 = "#ebedf6",
	-- 			bg2 = "#dfe3ec",
	-- 			bg3 = "#d5dae6",
	-- 			bg_d = "#e8eaf2",
	--
	-- 			fg = "#2d3748",
	--
	-- 			purple = "#c75ae8",
	-- 			green = "#8bcd5b",
	-- 			orange = "#dd9046",
	-- 			blue = "#41a7fc",
	-- 			yellow = "#efbd5d",
	-- 			cyan = "#34bfd0",
	-- 			red = "#f65866",
	-- 			-- grey = "#455574",
	-- 			grey = "#6c7d8c",
	--
	-- 			bg_green = "#3f6c20",
	-- 			bg_yellow = "#e48a23",
	-- 			bg_blue = "#1e75bd",
	-- 			dark_cyan = "#008b9c",
	-- 			dark_purple = "#77328c",
	-- 			dark_yellow = "#e48a23",
	-- 			light_grey = "#6c7d9c",
	-- 			dark_red = "#992f38",
	-- 			diff_add = "#27341c",
	-- 			diff_delete = "#331c1e",
	-- 			diff_change = "#102b40",
	-- 			diff_text = "#1c4a6e",
	-- 		},
	-- 		style = "deep",
	-- 		transparent = false,
	-- 	},
	-- },

	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
		end,
	},

	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_enable_italic = true
		end,
	},

	{
		"uZer/pywal16.nvim",
		-- for local dev replace with:
		-- dir = '~/your/path/pywal16.nvim',
		config = function()
			-- vim.cmd.colorscheme("pywal16")
		end,
	},

	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = true,
	-- 	opts = {
	-- 		colors = {
	-- 			bg0 = "#1d1d20",
	-- 			fg = "#eaeaec",
	-- 		},
	-- 		style = "warmer",
	-- 		transparent = true,
	-- 	},
	-- },
}
