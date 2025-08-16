# My Dotfiles

This repository contains my personal dotfiles for various applications, managed with GNU Stow.

## Prerequisites

Before using these dotfiles, you need to install the following tools:

- **GNU Stow**: A symlink farm manager which takes distinct packages of software and symlinks them into place.
- **fd**: A simple, fast and user-friendly alternative to `find`.
- **ripgrep (rg)**: A line-oriented search tool that recursively searches the current directory for a regex pattern.

### Installing Prerequisites

**GNU Stow:**

```bash
# Arch Linux
sudo pacman -Syu stow

# Debian or Ubuntu
sudo apt install stow

# Fedora, RHEL, CentOS, Rocky, Alma Linux etc...
sudo dnf -y install stow

# macOS
brew install stow
```

**fd and ripgrep:**

```bash
# Arch Linux
sudo pacman -Syu fd ripgrep

# Debian or Ubuntu
sudo apt install fd-find ripgrep

# Fedora, RHEL, CentOS, Rocky, Alma Linux etc...
sudo dnf -y install fd-find ripgrep

# macOS
brew install fd ripgrep
```

## Installation and Usage

This repository uses a `Makefile` to simplify the process of setting up and removing configurations.

### Zsh Configuration

- **To apply the Zsh configuration:**

  ```bash
  make zshell
  ```

- **To remove the Zsh configuration:**
  ```bash
  make clean_zshell
  ```

### Neovim Configuration

- **To apply the Neovim configuration:**

  ```bash
  make nvim
  ```

- **To remove the Neovim configuration:**
  ```bash
  make clean_nvim
  ```

## Utility Scripts

### Remove Duplicates from Zsh History

This script removes duplicate entries from your Zsh history file.

```bash
./remove_duplicates_zsh_history.sh ${HISTFILE}
```
