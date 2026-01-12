# TinyVim

- Minimal Neovim config meant to be a starting point for new neovim users.

## Requirements

- Neovim 0.11.0 or later (nightly)
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) (0.26.1 or later)

# Install

- Linux or MacOS

```bash
git clone https://github.com/immanuel95/tinyvim.git ~/.config/nvim && nvim
```

Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins, then execute `:TSInstallAll` to install the nvim-treesitter parsers and queries.

# Reset

```bash
rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim/lazy-lock.json
```

# Dir structure

```bash
├── init.lua
├── lua
    ├── autocmd.lua
    ├── lazy_config.lua
    ├── mappings.lua
    ├── options.lua
    ├── usercmd.lua
    └── plugins
        ├── init.lua
        └── configs
            ├── blink.lua
            ├── bufferline.lua
            ├── conform.lua
            ├── iron.lua
            ├── lspconfig.lua
            ├── mini.lua
            ├── render-markdown.lua
            ├── treesitter.lua
            └── ( more ... )
```

# About

- Dont expect this config to be beautiful or blazing fast (no hardcore lazyloading is done)!
- I'm just using some plugins with their default configs
- This config only uses only lesser plugins which I think are important for any config.

# Important Plugins used

Below is the list of some very important plugins which I think should be must for any neovim config.

| Name                 | Description                                               |
| -------------------- | --------------------------------------------------------- |
| gitsigns.nvim        | Git-related features                                      |
| catppuccin/nvim      | Theme                                                     |
| nvim-treesitter      | Configure treesitter                                      |
| bufferline.nvim      | Tab + bufferline plugin                                   |
| blink.cmp            | Autocompletion                                            |
| nvim-lspconfig       | LSP configuration                                         |
| mason.nvim           | Download binaries of various lsps, daps, formatters, etc. |
| conform.nvim         | Formatter                                                 |
| mini.nvim            | Helper library for various plugins                        |
| grug-far.nvim        | Search and Replace                                        |
| nvim-lint            | Linting                                                   |
| nvim-ts-autotag      | Auto-close and auto-rename HTML/XML tags                  |
| iron.nvim            | REPL integration                                          |
| render-markdown.nvim | Markdown rendering                                        |
