return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- 👈 Habilita los atajos de teclado
        disable_diagnostics = false,
        highlights = {
          incoming = "DiffAdd",
          current = "DiffText",
        },
      })

      vim.keymap.set("n", "co", "<Plug>(git-conflict-ours)", { desc = "Choose Ours" })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup()
    end,
    keys = {
      {
        "<leader>gg",
        function()
          require("neogit").open()
        end,
        desc = "Abrir Neogit",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  {
    "APZelos/blamer.nvim",
    event = "BufReadPost",
    config = function()
      vim.g.blamer_enabled = 1
      vim.g.blamer_delay = 500
      vim.g.blamer_show_in_insert_modes = 0
      vim.g.blamer_prefix = "    "
    end,
  },
}
