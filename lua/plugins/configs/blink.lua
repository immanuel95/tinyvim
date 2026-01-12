return {
  snippets = { preset = "mini_snippets" },
  cmdline = { enabled = false },
  appearance = { nerd_font_variant = "normal" },
  fuzzy = { implementation = "prefer_rust" },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },

  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
  },

  completion = {
    ghost_text = { enabled = true },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "single" },
    },
  },
}
