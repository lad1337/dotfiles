_fuzzy_edit(){
    zle kill-whole-line
    local files="$(__fsel)"
    zle -U "e $files"
    zle .accept-line
}
zle -N _fuzzy_edit
bindkey ^e _fuzzy_edit
