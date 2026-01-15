return {
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	lazy = false,
	-- 	opts = {
	-- 		auto_install = true,
	-- 	},
	-- 	config = function()
	-- 		require("mason").setup()
	-- 	end,
	-- },

	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		cmd = "Mason",
		opts = {
			automatic_installation = true,
			ensure_installed = { "docker_compose_language_service" },
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},

	{
		"theRealCarneiro/hyprland-vim-syntax",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "hypr",
	},

	-- {
	--   "neovim/nvim-lspconfig",
	--   lazy = false,
	--   config = function()
	--     local capabilities = require("cmp_nvim_lsp").default_capabilities()

	--     local lspconfig = require("lspconfig")
	--     lspconfig.html.setup({
	--       capabilities = capabilities,
	--     })
	--     lspconfig.lua_ls.setup({
	--       capabilities = capabilities,
	--     })
	--     lspconfig.denols.setup({
	--       capabilities = capabilities,
	--     })
	--     lspconfig.gopls.setup({
	--       capabilities = capabilities,
	--     })

	--     vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	--     vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
	--     vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
	--     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
	--   end,
	-- },
}
