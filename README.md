Neovim configuration
===

![dotnvim_preview](https://github-production-user-asset-6210df.s3.amazonaws.com/807237/267065019-d745cfe6-f5ad-46a9-8749-72b8c5459a36.png)

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
