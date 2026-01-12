local M = {}

M.setup = function()
  -- Mouse Scroll Logic
  local mouse_scrolled = false
  for _, scroll in ipairs { "Up", "Down" } do
    local key = "<ScrollWheel" .. scroll .. ">"
    vim.keymap.set({ "", "i" }, key, function()
      mouse_scrolled = true
      return key
    end, { expr = true })
  end

  -- mini.animate
  local animate = require "mini.animate"
  animate.setup {
    scroll = {
      timing = animate.gen_timing.linear { duration = 150, unit = "total" },
      subscroll = animate.gen_subscroll.equal {
        predicate = function(total_scroll)
          if mouse_scrolled then
            mouse_scrolled = false
            return false
          end
          return total_scroll > 1
        end,
      },
    },
    cursor = {
      enable = false,
    },
  }

  require("mini.jump2d").setup {
    allowed_windows = { not_current = true },
    allowed_lines = { blank = false },
    mappings = { start_jumping = "<leader><leader>" },
  }

  require("mini.surround").setup {
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
      suffix_last = "l",
      suffix_next = "n",
    },
  }

  local latex_patterns = { "latex/**/*.json", "**/latex.json" }
  local lang_patterns = {
    tex = latex_patterns,
    plaintex = latex_patterns,
    markdown_inline = { "markdown.json" },
  }
  local gen_loader = require("mini.snippets").gen_loader
  require("mini.snippets").setup {
    snippets = {
      gen_loader.from_lang { lang_patterns = lang_patterns },
    },
  }

  require("mini.pairs").setup {
    modes = { insert = true, command = true, terminal = false },
  }

  require("mini.indentscope").setup {
    symbol = "│",
    options = { try_as_border = true },
  }

  -- ================== Mini.files configuration ================
  require("mini.files").setup {
    windows = {
      preview = true,
      width_focus = 50,
      width_nofocus = 15,
      width_nofocus_detailed = 30,
      width_preview = 70,
    },
    options = {
      use_as_default_explorer = true,
    },
  }

  -- Quick look on MacOS
  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
      local b = args.data.buf_id
      vim.keymap.set("n", "g<leader>", function()
        local path = (require("mini.files").get_fs_entry() or {}).path
        if path == nil then
          return vim.notify "Cursor is not on valid entry"
        end
        vim.system({ "qlmanage", "-p", path }, {}, function(result)
          if result.code ~= 0 then
            vim.schedule(function()
              vim.notify("'qlmanage -p' failed with code:" .. result.code)
              vim.notify("Stderr:\n" .. result.stderr)
            end)
          end
        end)
      end, { buffer = b, desc = "Quick Preview" })
    end,
  })

  require("mini.icons").setup()
  require("mini.icons").mock_nvim_web_devicons()
  require("mini.move").setup()
  require("mini.cursorword").setup()
  require("mini.cmdline").setup()
  require("mini.pick").setup()
  require("mini.statusline").setup { use_icons = vim.g.have_nerd_font }
  require("mini.notify").setup()
end

return M
