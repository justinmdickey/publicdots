return {

	{
		"nomnivore/ollama.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		-- All the user commands added by the plugin
		cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

		keys = {
			-- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
			{
				"<leader>oo",
				":<c-u>lua require('ollama').prompt()<cr>",
				desc = "ollama prompt",
				mode = { "n", "v" },
			},

			-- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
			{
				"<leader>oG",
				":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
				desc = "ollama Generate Code",
				mode = { "n", "v" },
			},
		},

		---@type Ollama.Config
		opts = {
			url = "http://192.168.0.36:11434",
			model = "gemma3",
		},
	},

	{
		"NickvanDyke/opencode.nvim",
		dependencies = { "folke/snacks.nvim" },
		---@type opencode.Config
		opts = {
			-- Your configuration, if any
		},
  -- stylua: ignore
    keys = {
      { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
      { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = 'n', },
      { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
      { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
      { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
      { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
      { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
      { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
    },
	},

	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	version = false,
	-- 	opts = {
	-- 		providers = {
	-- 			openai = {
	-- 				endpoint = "https://api.openai.com/v1/chat/completions", -- OpenAI API endpoint is working
	-- 				model = "gpt-5",
	-- 				timeout = 30000,
	-- 				extra_request_body = {
	-- 					temperature = 0,
	-- 					max_completion_tokens = 8192,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	build = "make",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"zbirenbaum/copilot.lua",
	-- 		{
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			"OXY2DEV/markview.nvim",
	-- 			enabled = true,
	-- 			lazy = false,
	-- 			ft = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
	-- 			opts = {
	-- 				preview = {
	-- 					filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
	-- 					ignore_buftypes = {},
	-- 				},
	-- 				max_length = 99999,
	-- 			},
	-- 		},
	-- 	},
	-- },

	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		require("codecompanion").setup()
	-- 		vim.keymap.set("n", "<leader>ct", ":CodeCompanionChat toggle<CR>", { desc = "CodeCompanionChat toggle" })
	-- 		vim.keymap.set("n", "<leader>cc", ":CodeCompanion<CR>", { desc = "CodeCompanion" })
	-- 	end,
	-- },
}
