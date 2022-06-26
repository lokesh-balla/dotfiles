# Clone the following repos in this directory

```bash
$ mkdir -p ~/.zsh_user_configs && mkdir -p ~/.zsh_user_configs/themes && mkdir -p ~/.zsh_user_configs/plugins
```

```bash
export ZSH_PLUGINS_PATH=~/.zsh_user_configs/plugins/

cd $ZSH_PLUGINS_PATH

git clone --depth=1 https://github.com/woefe/git-prompt.zsh.git git-prompt
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git clone --depth=1 https://github.com/ael-code/zsh-colored-man-pages.git colored-man-pages
```
