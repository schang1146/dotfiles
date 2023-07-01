if ! terraform_loc="$(type -p terraform)" || [[ -z terraform_loc ]]
then
    export PATH="$PATH:$HOME/bin"
fi