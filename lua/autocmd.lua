local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "YankHighlight", timeout = 300 }
  end,
})

api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.csv", "*.md" },
  callback = function()
    vim.wo.wrap = true
  end,
})

api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ok = pcall(vim.treesitter.start)
    if ok then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
