return {
  "tiagovla/tokyodark.nvim",
  name = "andromeda",
  lazy = false,
  priority = 1000,
  styles = {
    comments = { italic = true }, -- style for comments
    keywords = { italic = true }, -- style for keywords
    identifiers = { italic = true }, -- style for identifiers
    functions = {}, -- style for functions
    variables = {}, -- style for variables
  },
  config = function()
    vim.g.tokyodark_transparent_background = true
    vim.g.tokyodark_enable_italic_comment = true
    vim.g.tokyodark_color_gamma = "1.0"

    --vim.cmd("colorscheme tokyodark")

    vim.api.nvim_set_hl(0, "Comment", { fg = "#9EABFF", italic = true })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#ff0000", bg = "NONE" }) -- <- Aquí línea roja
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#777EFF", bold = true }) -- Rojo brillante
  end,
}
