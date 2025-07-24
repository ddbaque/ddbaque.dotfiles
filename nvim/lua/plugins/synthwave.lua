return {
  "samharju/synthweave.nvim",
  config = function()
    -- vim.cmd("colorscheme synthweave")

    -- Habilitar el highlight de la línea actual
    vim.opt.cursorline = true

    -- Cambiar el color de fondo
    vim.api.nvim_set_hl(0, "CursorLine", {
      bg = "#4e2a69",
    })
  end,
}
