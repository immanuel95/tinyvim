local M = {}

M.opts = {
  completions = { lsp = { enabled = true } },
  render_modes = true,
  bullet = {
    enabled = true,
    left_pad = 2,
    right_pad = 0,
  },
  win_options = {
    conceallevel = { default = vim.o.conceallevel, rendered = 2 },
    concealcursor = { default = vim.o.concealcursor, rendered = "" },
  },
}

return M
