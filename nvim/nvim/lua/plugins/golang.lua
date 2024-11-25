return {
  -- LSP for Golang
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = opts.on_attach,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              fieldalignment = true,
            },
            staticcheck = true,
            completeUnimported = true, -- Completar paquetes no importados
            usePlaceholders = true,
          },
        },
      })
    end,
  },

  -- Mason for Golang
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "gopls", "goimports", "gofumpt", "gomodifytags", "impl", "delve" } },
  },

  -- Teresitter for Golang
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go", "gomod", "gowork", "gosum" },
      highlight = {
        enable = true, -- Habilitar resaltado basado en Treesitter
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
