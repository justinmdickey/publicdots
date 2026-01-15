local colors = vim.api.nvim_get_hl(0, { name = "Normal" })
local bg0 = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "NONE"
local bg1 = vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg or "NONE"
local fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg or "#c0caf5"

-- Get colors from existing highlights
local blue = vim.api.nvim_get_hl(0, { name = "Function" }).fg or "#7aa2f7"
local green = vim.api.nvim_get_hl(0, { name = "String" }).fg or "#9ece6a"
local red = vim.api.nvim_get_hl(0, { name = "ErrorMsg" }).fg or "#f7768e"
local comment = vim.api.nvim_get_hl(0, { name = "Comment" }).fg or "#45475A"
local orange = vim.api.nvim_get_hl(0, { name = "@constant" }).fg or "#ff9e64"
local purple = vim.api.nvim_get_hl(0, { name = "Statement" }).fg or "#bb9af7"
local yellow = vim.api.nvim_get_hl(0, { name = "@constructor" }).fg or "#7dcfff"

-- Bufferline highlight groups
vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = bg, fg = red })
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = bg0, fg = fg })
vim.api.nvim_set_hl(0, "BufferLineTabSelected", { bg = fg, fg = comment })
vim.api.nvim_set_hl(0, "BufferLineTabSeparator", { bg = bg0, fg = fg })

vim.api.nvim_set_hl(0, "MarkviewCheckboxUnchecked", { bg = bg0, fg = fg })
vim.api.nvim_set_hl(0, "MarkviewCheckboxChecked", { bg = bg0, fg = green })

vim.api.nvim_set_hl(0, "AvanteTitle", { bg = green, fg = bg1 })
vim.api.nvim_set_hl(0, "AvanteReversedTitle", { fg = green })
vim.api.nvim_set_hl(0, "AvanteSubtitle", { bg = blue, fg = bg1 })
vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { fg = blue })
vim.api.nvim_set_hl(0, "AvanteThirdTitle", { bg = yellow, fg = bg1 })
vim.api.nvim_set_hl(0, "AvanteReversedThirdTitle", { fg = yellow })
vim.api.nvim_set_hl(0, "AvanteSidebarNormal", { bg = bg0, fg = fg })
vim.api.nvim_set_hl(0, "AvanteSidebarWinSeparator", { bg = bg1, fg = bg0 })
vim.api.nvim_set_hl(0, "AvanteSidebarWinHorizontalSeparator", { bg = bg1, fg = bg0 })

vim.api.nvim_set_hl(0, "SnacksPickerBackground", { bg = "#ff0000" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = comment, bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { bg = blue, fg = bg1 })
vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = bg0 })
vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = bg0 })
vim.api.nvim_set_hl(0, "SnacksPickerListTitle", { bg = green, fg = bg1 })
vim.api.nvim_set_hl(0, "SnacksPickerInputTitle", { bg = red, fg = bg1 })
vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { bg = bg, fg = comment })
vim.api.nvim_set_hl(0, "SnacksPickerInputSearch", { bg = red, fg = bg1 })
vim.api.nvim_set_hl(0, "SnacksPickerInput", { bg = bg0 })
