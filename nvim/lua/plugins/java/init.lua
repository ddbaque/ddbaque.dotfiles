return {
  {
    "neovim/nvim-lspconfig",
    -- No necesitas especificar un plugin aquí, pero debe estar envuelto.
    vim.api.nvim_create_user_command("JavaFormatter", function(_)
      local dialect = "postgres" -- Cambia esto según tu dialecto preferido
      local cmd = string.format("sqlfluff format --dialect %s", dialect)
      vim.fn.system(cmd)
      vim.cmd("edit!") -- Recarga el archivo después del formateo
      print("File formatted with SQLFluff")
    end, {}),

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.java", --  Only .sql files
      callback = function()
        local full_path = vim.fn.expand("%:p")
        local command =
          string.format("java -jar ~/.config/nvim/lua/plugins/java/google-java-format.jar --replace %s", full_path)
        print(command)
        vim.fn.system(command)
        vim.cmd("edit!") -- Recarga el archivo después del formateo
        print("File formatted with Google Java Format on save")
      end,
    }),
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Configuración del LSP para Java usando jdtls
      local lspconfig = require("lspconfig")

      lspconfig.jdtls.setup({
        cmd = { "jdtls" },
        root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "gradlew", "mvnw"),
        settings = {
          java = {
            eclipse = { downloadSources = true },
            configuration = { updateBuildConfiguration = "automatic" },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            format = { enabled = true },
          },
        },
        init_options = {
          bundles = {},
        },
      })
    end,
  },
}
