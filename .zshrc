export ZSH=~/.zsh_user_configs

# History Command Configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# set beep sound on error
setopt beep

# To mimic behaviour of BASH when there is no match
unsetopt nomatch

# Load all of the config files from "$ZSH_CONFIG_PATH/base_config/" that end in .zsh
for config_file ($ZSH/base_config/*.zsh); do
  source $config_file
done

# Load the theme
source $ZSH/themes/robbyrussell.zsh-theme

# Load all the plugins
for plugin ($ZSH/plugins/*/*.plugin.zsh); do
  source $plugin
done

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
