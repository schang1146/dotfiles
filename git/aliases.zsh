# Git

for al in `git --list-cmds=alias`; do
    alias g$al="git $al"
done