Neovim configuration
===

![dotnvim_preview](https://github.com/levriero/dotnvim/assets/807237/81ac0b70-662a-4494-9ecb-52a8fb1292b3)

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
