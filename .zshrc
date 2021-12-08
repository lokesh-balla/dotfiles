## Main PATH for all ZSH Configs
export ZSH=~/.zsh_user_configs

## History command configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

## Load Plugins
for plugin ($ZSH/plugins/*/*.plugin.zsh); do
  source $plugin
done

## Load Theme
setopt PROMPT_SUBST # the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion. 
autoload -U colors && colors
source $ZSH/themes/robbyrussell.zsh-theme

## Alias
alias history="history 0"
alias sudo="sudo "
alias vim="nvim"

setopt autocd beep extendedglob notify
unsetopt nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
## End of lines added by compinstall
