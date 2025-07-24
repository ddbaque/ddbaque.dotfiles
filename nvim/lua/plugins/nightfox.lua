-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- Configuración de iconos
      config = {
        icons = {
          -- Iconos por tipo de nodo
          ["directory"] = "",
          ["directory.open"] = "",
          ["file"] = "",
          ["file.executable"] = "",
          ["file.readonly"] = "",
          ["symlink"] = "",
          ["symlink.directory"] = "",
        },
        -- Iconos por extensión de archivo
        file_icons = {
          [".gitignore"] = "",
          ["package.json"] = "",
          ["tsconfig.json"] = "",
          [".env"] = "",
          ["dockerfile"] = "",
          ["makefile"] = "",
          -- Extensiones
          ["js"] = "",
          ["ts"] = "",
          ["jsx"] = "",
          ["tsx"] = "",
          ["lua"] = "",
          ["py"] = "",
          ["md"] = "",
          ["json"] = "",
          ["css"] = "",
          ["html"] = "",
          ["vim"] = "",
        },
      },
    },
  },
}
