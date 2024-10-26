-- Options are automatically loaded before lazy.nvim startup
--
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- hola nuevo comment
vim.opt.wrap = true
vim.opt.autoread = true
vim.opt.spell = false

-- thats option only do transparent the right content, the tree ui not
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
--     vim.cmd("hi! NonText guibg=NONE ctermbg=NONE")
--   end,
-- })
