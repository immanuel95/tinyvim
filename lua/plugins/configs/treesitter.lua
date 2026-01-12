local M = {}

M.setup = function()
  vim.api.nvim_create_user_command("TSInstallAll", function()
    require("nvim-treesitter").install {
      "vim",
      "lua",
      "vimdoc",
      "http",
      "markdown",
      "markdown_inline",
      "yaml",
      "query",
      "printf",
      "dockerfile",
      "html",
      "css",
      "typescript",
      "javascript",
      "tsx",
      "svelte",
      "python",
      "go",
      "gomod",
      "gowork",
      "gosum",
    }
  end, {})
end

return M
