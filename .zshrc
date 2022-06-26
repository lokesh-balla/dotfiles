## Main PATH for all ZSH Configs
export ZSH=~/.zsh_user_configs

## History Command Configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

## Misc
setopt beep notify
unsetopt autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

## enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## Completion Configs
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# hightlight the tab completion word
zstyle ':completion:*' menu select

# match case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# more details for tab complete (colors wont work with this)
# zstyle ':completion:*' file-list all

# setting colors for tab completion (uses same colors as ls --color=auto)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## Load Plugins
plugins=(git-prompt zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)

is_plugin() {
  local base_dir=$1
  local name=$2
  builtin test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || builtin test -f $base_dir/plugins/$name/_$name
}

for plugin ($plugins); do
  if is_plugin "$ZSH" "$plugin"; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  else
    echo "plugin '$plugin' not found"
  fi
done

## Load Theme
setopt PROMPT_SUBST # the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion. 
autoload -U colors && colors
source $ZSH/themes/default.zsh-theme

## Alias
alias history="history 0"
alias sudo="sudo "
alias vim="nvim"

#################################################################
################## Additonal User Config Below ##################
#################################################################

## Setting alias for kitty terminal
if [ "$TERM" == "xterm-kitty" ]
then
	alias ssh="kitty +kitten ssh"
fi