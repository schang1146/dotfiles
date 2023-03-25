# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous
# event) 
setopt histignorealldups

# This option both imports new commands from the history file, and also causes
# your typed commands to be appended to the history file
setopt sharehistory

# If a pattern for filename generation has no matches, print an error, instead
# of leaving it unchanged in the argument list (also applies to file expansion
# of an initial ‘~’ or ‘=’)
setopt nomatch

# Beeping is annoying (sometimes doesn't work)
unsetopt BEEP

# Disables paste highlighting
# zle_highlight+=(paste:none)

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e