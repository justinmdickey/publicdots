return {

	{
		"giuxtaposition/blink-cmp-copilot",
	},

	{
		"saghen/blink.cmp",
		lazy = true,
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = { preset = "super-tab" },
			completion = {
				trigger = {
					show_on_trigger_character = true,
					show_on_blocked_trigger_characters = function()
						if vim.api.nvim_get_mode().mode == "c" then
							return {}
						end
						return {}
					end,
				},
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 250,
					treesitter_highlighting = true,
					window = { border = "rounded" },
				},
				menu = {
					border = "rounded",
					max_height = 12,
					min_width = 10,
					draw = {
						treesitter = { "lsp" },
					},
				},
				ghost_text = { enabled = false },
			},
			signature = { window = { border = "single" } },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
				kind_icons = {
					Minuet = "",
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
			sources = {
				default = {
					-- "minuet",
					"lsp",
					"path",
					"snippets",
					"buffer",
					-- "ollama",
					"copilot",
				},
				providers = {

					minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 100, -- Gives minuet higher priority among suggestions
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Minuet"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},

					copilot = {
						name = "copilot",
						override = {
							get_trigger_characters = function(self)
								local trigger_characters = self:get_trigger_characters()
								vim.list_extend(trigger_characters, { "\n", "\t", " " })
								return trigger_characters
							end,
						},
						module = "blink-cmp-copilot",
						score_offset = 99,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
