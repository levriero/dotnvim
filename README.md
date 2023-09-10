Neovim configuration
===

# Pre-requisites

- [Neovim](https://github.com/neovim/neovim/releases/tag/v0.9.0) `0.9.0`
- [Nerd Font](https://www.nerdfonts.com/)
- [Git](https://git-scm.com/downloads)
- Delete Neovim directory (if exists)

# Recommended

- [ripgrep](https://github.com/BurntSushi/ripgrep)

# Installation

```bash
git clone https://github.com/levriero/dotnvim.git ~/.config/nvim
```

# Post Install

Run `checkhealth` and fix any errors if needed. You may want to ignore dependencies you don't need (e.g. python runtime, julia, node, etc)

```bash
nvim +checkhealth
```
