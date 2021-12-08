# Clone the following repos in this directory

```bash
$ mkdir -p ~/.zsh_user_configs && mkdir -p ~/.zsh_user_configs/themes && mkdir -p ~/.zsh_user_configs/plugins
```

```bash
export ZSH_PLUGINS_PATH=~/.zsh_user_configs/plugins/

cd $ZSH_PLUGINS_PATH

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/ael-code/zsh-colored-man-pages.git
git clone https://github.com/zpm-zsh/colorize.git

export ZSH_THEMES_PATH=~/.zsh_user_configs/themes/

cd $ZSH_THEMES_PATH

git clone https://github.com/toytag/robbyrussell-fullpath.zsh-theme
```
