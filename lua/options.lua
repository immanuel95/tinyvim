local o = vim.o
local opt = vim.opt

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
o.laststatus = 3
o.showmode = false
o.winborder = "rounded"
o.termguicolors = true
o.cursorline = true
o.number = true
o.signcolumn = "yes"
opt.fillchars = { eob = " " }

-- Window management
o.splitbelow = true
o.splitright = true

-- Editing
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.undofile = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Mouse
o.mouse = "a"

-- Clipboard
o.clipboard = "unnamedplus"

-- Cursor
opt.guicursor = {
  "n-v-c:block-Cursor",
  "i-ci-ve:ver25-Cursor",
  "r-cr:hor20-Cursor",
  "n-v-c-i-ci-ve-r-cr:blinkon500-blinkoff500",
}

-- Timeouts
o.timeoutlen = 2000
o.ttimeoutlen = 10

-- Highlight groups
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#df8e1d", fg = "NONE" })
vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

-- Mason binaries path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
