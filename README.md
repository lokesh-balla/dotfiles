# dotfiles

## Installing GNU Stow

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

## Configuring neovim

```bash
make nvim
```

## Removing config

```bash
make clean_nvim
```

## Configuring ZSH

```bash
make zshell
```

## Removing ZSH

```bash
make clean_zshell
```
