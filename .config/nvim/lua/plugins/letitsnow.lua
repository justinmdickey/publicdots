return {
  "marcussimonsen/let-it-snow.nvim",
  cmd = "LetItSnow", -- Wait with loading until command is run
  opts = {
    vim.keymap.set("n", "<leader>ls", ':LetItSnow<CR>', { desc = "LetItSnow" })
  },
}
