autoload -Uz vcs_info
precmd_vcs_info() {
    # As always first run the system so everything is setup correctly.
    vcs_info
    # And then just set PS1, RPS1 and whatever you want to. This $PS1
    # is (as with the other examples above too) just an example of a very
    # basic single-line prompt. See "man zshmisc" for details on how to
    # make this less readable. :-)
    if [[ -z ${vcs_info_msg_0_} ]]; then
        PROMPT='%F{blue}%~%f › '
    else
        PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f › '
    fi

    if [[ -z "${VIRTUAL_ENV}" ]]; then
        RPROMPT=""
    else
        RPROMPT="($(basename $VIRTUAL_ENV))"
    fi
}
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git:*' formats '(%b)'