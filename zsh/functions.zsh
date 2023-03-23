function zsh_add_file() {
	[ -f "$DOTFILES_ROOT/$1" ] && source "$DOTFILES_ROOT/$1"
}

# TODO: SC_NOTE - Thinking about cloning plugins during the install step or
# something so that the user doesn't have to see a random git clone happen
# when starting their zsh instance
function zsh_add_plugin() {
	local PLUGIN_NAME="$(echo $1 | cut -d "/" -f 2)"

	if [ -d "$DOTFILES_ROOT/plugins/$PLUGIN_NAME" ]; then
		zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
		zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
	else
		git clone "https://github.com/$1.git" "$DOTFILES_ROOT/plugins/$PLUGIN_NAME"
	fi
}

# TODO: SC_NOTE - There should be a way to update plugins after installing them
function zsh_update_plugins() {}