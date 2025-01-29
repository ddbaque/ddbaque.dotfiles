return {
  {
    "neovim/nvim-lspconfig",
    -- No necesitas especificar un plugin aquí, pero debe estar envuelto.
    vim.api.nvim_create_user_command("ErlangFormatter", function(_)
      local target_dir = "/home/david/custom-scripts/erlfmt"
      local cmd_cd = string.format("cd %s && pwd", target_dir)
      local output = vim.fn.system(cmd_cd)
      print("Current directory after cd:", output)
    end, {}),

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.erl", -- Only .erl files
      callback = function()
        local full_path = vim.fn.expand("%:p")
        local target_dir = "/home/david/custom-scripts/erlfmt"
        local cmd_cd = string.format("cd %s && pwd && rebar3 fmt %s", target_dir, full_path)
        print(cmd_cd)
        local output = vim.fn.system(cmd_cd)
        vim.cmd("edit!") -- Recarga el archivo después del formateo
        print("Current directory after cd:", output)
      end,
    }),
  },
}
