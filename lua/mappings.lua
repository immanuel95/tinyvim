local map = vim.keymap.set

-- ============================================================================
-- General Mappings
-- ============================================================================

map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode" })
map("n", ";", ":", { noremap = true, silent = true, desc = "CMD enter command mode" })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save" })
map("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Exit Insert mode" })
map(
  "n",
  "<leader>sc",
  ":setlocal spell spelllang=en_us<CR>",
  { noremap = true, silent = true, desc = "Check English spelling" }
)

-- Navigation in insert mode
map("i", "<C-h>", "<Left>", { noremap = true, silent = true, desc = "Move left" })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true, desc = "Move right" })
map("i", "<C-j>", "<Down>", { noremap = true, silent = true, desc = "Move down" })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true, desc = "Move up" })

-- Scrolling
map("n", "<C-e>", "10<C-e>", { noremap = true, silent = true, desc = "Scroll down 10 lines" })
map("n", "<C-y>", "10<C-y>", { noremap = true, silent = true, desc = "Scroll up 10 lines" })

-- ============================================================================
-- Window Management
-- ============================================================================

-- Window navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Switch window up" })

-- Window resizing
map(
  "n",
  "<A-Right>",
  ":vertical resize -10<CR>",
  { noremap = true, silent = true, desc = "Resize vertical split (widen right)" }
)
map(
  "n",
  "<A-Left>",
  ":vertical resize +10<CR>",
  { noremap = true, silent = true, desc = "Resize vertical split (narrow left)" }
)
map(
  "n",
  "<A-Up>",
  ":resize +5<CR>",
  { noremap = true, silent = true, desc = "Resize horizontal split (increase height)" }
)
map(
  "n",
  "<A-Down>",
  ":resize -5<CR>",
  { noremap = true, silent = true, desc = "Resize horizontal split (decrease height)" }
)

-- Window splitting
map("n", "<leader>wh", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontal" })
map("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split vertical" })
map("n", "<leader>wch", ":new<CR>", { noremap = true, silent = true, desc = "Split horizontal new buffer" })
map("n", "<leader>wcv", ":vnew<CR>", { noremap = true, silent = true, desc = "Split vertical new buffer" })

-- Window closing
map("n", "<leader>wd", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" })
map("n", "<leader>wo", ":only<CR>", { noremap = true, silent = true, desc = "Close all other windows" })

-- ============================================================================
-- Buffer Management
-- ============================================================================

map("n", "H", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev Buffer" })
map("n", "L", ":BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next Buffer" })
map("n", "<leader>bo", ":BufferLineCloseOthers<cr>", { noremap = true, silent = true, desc = "Close Other Buffers" })
map("n", "<leader>bd", ":bdelete<cr>", { noremap = true, silent = true, desc = "Delete Current Buffer" })

-- ============================================================================
-- Text Operations
-- ============================================================================

-- Copy lines in visual mode
map(
  "v",
  "<leader>J",
  ":t '><CR>gv=gv",
  { noremap = true, silent = true, desc = "Copy selected lines below in visual mode" }
)
map(
  "v",
  "<leader>K",
  ":t '< -1<CR>gv=gv",
  { noremap = true, silent = true, desc = "Copy selected lines top in visual mode" }
)

-- ============================================================================
-- Plugin: mini.nvim
-- ============================================================================

map("n", "<C-n>", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
end, { noremap = true, silent = true, desc = "Open mini files" })

map("n", "<leader>ff", ":Pick files<CR>", { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fw", ":Pick grep live<CR>", { noremap = true, silent = true, desc = "Find text" })

map("n", "<leader>n", function()
  require("mini.notify").show_history()
end, { noremap = true, silent = true, desc = "Notify history" })

-- ============================================================================
-- Plugin: iron.nvim
-- ============================================================================

map("n", "<leader>rf", ":IronFocus<cr>", { noremap = true, silent = true, desc = "Focus REPL" })
map("n", "<leader>rh", ":IronHide<cr>", { noremap = true, silent = true, desc = "Hide REPL" })

-- ============================================================================
-- Terminal
-- ============================================================================

map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })
map("n", "<leader>tt", ":terminal<CR>", { noremap = true, silent = true, desc = "Open terminal" })

-- ============================================================================
-- Plugin Manager
-- ============================================================================

map("n", "<leader>L", ":Lazy<CR>", { noremap = true, silent = true, desc = "Lazy Command" })
