return {
  "tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl)
      hl.comment = { bg = "none", fg = "#C77DFF" }
      hl.perlComment = { bg = "#000000", fg = "#444444" }
      hl.Comment = { bg = "none", fg = "#C77DFF" }
      --hl.IlluminatedWordText = { bg = "#ffffff", fg = "#ffffff" }
    end,
  },
}
