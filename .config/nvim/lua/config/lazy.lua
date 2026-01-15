-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- General Settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.mousemoveevent = true
vim.opt.spell = true
vim.opt.cursorline = true

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"

-- Indentation and Formatting
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- vim.cmd("set number")
vim.opt.number = true
vim.opt.relativenumber = false
vim.cmd("set fillchars=eob:\\ ")
vim.cmd("set ww+=<,>,[,]")

-- Keymaps
-- General Keymaps
vim.keymap.set("n", "<leader>rn", "<CMD>set rnu!<CR>", { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm dir=. direction=horizontal<CR>", { desc = "Open Terminal" })
vim.keymap.set("n", "<leader>mp", "<CMD>Markview toggle<CR>", { desc = "Markview splitToggle" })
vim.keymap.set("v", "<leader>yc", '"+y', { desc = "yank selected to clipboard" })
vim.keymap.set("n", "<leader>yc", '"+y', { desc = "yank to clipboard" })
vim.keymap.set("n", "<C-a>", "%y+")
-- vim.keymap.set("n", "<leader>ae", "<CMD>AvanteEdit<CR>", { desc = "AvanteEdit" })

-- duplicate line and comment the first line
vim.keymap.set("n", "ycc", "yygccp", { remap = true })

-- autocorrect
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=gi<c-g>u", { noremap = true, silent = true })
-- inoremap <c-l> <c-g>u<Esc>[s1z=gi<c-g>u]

-- Mini Files
vim.keymap.set("n", "<leader>mf", "<CMD>:lua MiniFiles.open()<CR>", { desc = "MiniFiles" })

-- Tabs Navigation
vim.keymap.set("n", "<leader>p", ":bprevious<CR>")
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>T", "<CMD>Typr<CR>", { desc = "Typr" })

-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})
vim.cmd([[
  autocmd BufRead,BufNewFile config set filetype=json5
  autocmd BufRead,BufNewFile *.conf set filetype=sh
  autocmd BufRead,BufNewFile *.tpl set filetype=sh
  autocmd BufRead,BufNewFile *.tfvars* set filetype=sh
  autocmd BufRead,BufNewFile *lua_disabled set filetype=lua
  autocmd BufRead,BufNewFile *yml.example set filetype=yaml
  autocmd BufRead,BufNewFile *yaml.example set filetype=yaml
]])

-- Lazy.nvim Setup
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "tokyonight-night" } },
	-- automatically check for plugin updates
	checker = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = "rounded",
		backdrop = 60,
	},
})

-- Colorscheme
vim.cmd.colorscheme("onedark")
vim.opt.background = "dark"
-- vim.cmd("set bg=dark")

-- Highlight Adjustments
vim.api.nvim_set_hl(0, "@property", { link = "Normal" })
vim.api.nvim_set_hl(0, "@field", { link = "Normal" })
