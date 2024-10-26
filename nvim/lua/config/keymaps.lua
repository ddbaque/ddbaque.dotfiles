vim.keymap.set("i", "<A-i>", "<Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>f",
  ":!java -jar ~/custom-scripts/google-java-format.jar --replace %<CR>",
  { noremap = true, silent = true }
)
