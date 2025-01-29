return {
  {
    "tpope/vim-dadbod",
    cmd = "DB",
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "sqlfluff" } },
  },
  {
    "kristijanhusak/vim-dadbod-completion",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Define un comando para formatear usando sqlfluff
      vim.api.nvim_create_user_command("SqlFormat", function(_)
        local dialect = "postgres" -- Cambia esto según tu dialecto preferido
        local cmd = string.format("sqlfluff format --dialect %s", dialect)
        vim.fn.system(cmd)
        vim.cmd("edit!") -- Recarga el archivo después del formateo
        print("File formatted with SQLFluff")
      end, {})

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.sql", --  Only .sql files
        callback = function()
          local dialect = "postgres" -- change to favorite
          local cmd = string.format("sqlfluff format --dialect %s", dialect)
          vim.fn.system(cmd)
          vim.cmd("edit!") -- Recarga el archivo después del formateo
          print("File formatted with SQLFluff on save")
        end,
      })
    end,
  },
}
