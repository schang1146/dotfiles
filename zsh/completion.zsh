# GitHub - zsh-users/zsh-completions/zsh-completions-howto.org
# https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org

# Use modern completion system
autoload -Uz compinit && compinit

# Adds categories to command completion and groups them
zstyle ':completion:*' format 'Completing %F{blue}%d%f'
zstyle ':completion:*' group-name ''

# Autocompletion with an arrow-key driven interface
# To activate the menu, press `Tab` twice
zstyle ':completion:*' menu select=2

# For long select prompts, show scroll progress at the bottom
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Avoid old-style completion black magic incantation
# https://zsh.sourceforge.io/Guide/zshguide06.html
zstyle ':completion:*' use-compctl false

# The function generating matches may, at its discretion, show more information
zstyle ':completion:*' verbose true

# Output Bourne shell code to set LS_COLORS
eval "$(dircolors -b)"


zstyle ':completion:*' list-colors ''

# Use any color specifications already set up for the GNU version of the ls
# command
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Adds custom completion table for kill command and colors PID
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd --sort %cpu'

# This style’s value will be used as the description for options that are not
# described by the completion functions, but that have exactly one argument
# (This may not work for some commands)
zstyle ':completion:*' auto-description 'specify: %d'

# For more documentation:
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html
zstyle ':completion:*' completer _expand _complete _correct _approximate
