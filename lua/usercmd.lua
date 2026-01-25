local tools = {
  "css-lsp",
  "html-lsp",
  "lua-language-server",
  "vtsls",
  "eslint_d",
  "pyright",
  "svelte-language-server",
  "gopls",
  "goimports",
  "gofumpt",
  "tailwindcss-language-server",
  "ruff",
  "yaml-language-server",
  "stylua",
  "prettierd",
  "marksman",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  local mr = require "mason-registry"

  local tools_to_install = {}
  for _, tool in ipairs(tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      table.insert(tools_to_install, tool)
    end
  end

  if #tools_to_install > 0 then
    vim.cmd("MasonInstall " .. table.concat(tools_to_install, " "))
  else
    vim.notify("All tools are already present.", vim.log.levels.INFO, { title = "Mason" })
  end
end, { desc = "Install all Mason tools" })
