-- add pyright to lspconfig
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      -- gopls = {
      --   on_attach = on_attach, -- Puedes definir esta función si necesitas personalizarla
      --   capabilities = capabilities, -- Asegúrate de definir esto si lo usas
      --   cmd = { "gopls" },
      --   filetypes = { "go", "gomod", "gowork", "gotmpl" },
      --   root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
      -- },
    },
  },
}
