return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>gf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" }, -- Add isort for import sorting
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true }, -- For TS
			jsx = { "prettierd", "prettier", stop_after_first = true }, -- For React
			tsx = { "prettierd", "prettier", stop_after_first = true }, -- For TSX
			json = { "jq" },
			markdown = { "prettier" }, -- For docs
			yaml = { "yamlfmt" }, -- For configs
			html = { "prettier" },
			css = { "prettier" },
			sh = { "shfmt" }, -- For shell scripts
			bash = { "shfmt" },
			rust = { "rustfmt" }, -- If you do Rust
			go = { "gofmt" }, -- If you do Go
			sql = { "sqlfluff" }, -- For SQL files
			xml = { "xmlformat" },
			tf = { "terraform_fmt" }, -- For Terraform files
			terraform = { "terraform_fmt" }, -- For Terraform files
			md = { "mdformat" }, -- For markdown files
		},

		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
