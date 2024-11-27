return {

  {
    "mason.nvim",
    opts = { ensure_installed = { "erlang-ls" } },
  },
  -- sudo apt install rebar3
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        erlangls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "erlang" } },
  },
}
