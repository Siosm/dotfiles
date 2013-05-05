# Key bindings related to zsh

# Load Zsh Line Editor
zmodload zsh/zle

# Default to emacs-like bindings
setopt emacs
bindkey -e

# http://zshwiki.org/home/examples/zlewordchar
my_extended_wordchars='*?_-.[]~=&;!#$%^(){}<>:@,\\'
my_extended_wordchars_space="${my_extended_wordchars} "
my_extended_wordchars_slash="${my_extended_wordchars}/"

backward-to-/ () {
    local WORDCHARS=${my_extended_wordchars}
    zle .backward-word
    unquote-backward-word
}

dirname-previous-word () {
    autoload -U modify-current-argument
    modify-current-argument '${ARG:h}$(test "$ARG:h" = "/" || echo "/")'
}
zle -N dirname-previous-word

basename-previous-word () {
    autoload -U modify-current-argument
    modify-current-argument '${ARG:t}'
}
zle -N basename-previous-word

# # Rewrite multiple dots in a path (... -> ../..)
# rationalise-dot() {
# 	if [[ $LBUFFER = *.. ]]; then
# 		LBUFFER+=/..
# 	else
# 		LBUFFER+=.
# 		fi
# }
# zle -N rationalise-dot

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
#typeset -A key

#key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
#key[Up]=${terminfo[kcuu1]}
#key[Down]=${terminfo[kcud1]}
#key[Left]=${terminfo[kcub1]}
#key[Right]=${terminfo[kcuf1]}
#key[Home]=${terminfo[khome]}
#key[End]=${terminfo[kend]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}

# setup key accordingly
#[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
#[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
#[[ -n "${key[Up]}"     ]] && bindkey "${key[Up]}"     up-line-or-history
#[[ -n "${key[Down]}"   ]] && bindkey "${key[Down]}"   down-line-or-history
#[[ -n "${key[Left]}"   ]] && bindkey "${key[Left]}"   backward-char
#[[ -n "${key[Right]}"  ]] && bindkey "${key[Right]}"  forward-char
#[[ -n "${key[Home]}"   ]] && bindkey "${key[Home]}"   beginning-of-line
#[[ -n "${key[End]}"    ]] && bindkey "${key[End]}"    end-of-line

# Force some bindings
case $TERM in
	rxvt*)
		bindkey '^[[7~' beginning-of-line
		bindkey '^[[8~' end-of-line
		bindkey '^[[2~' overwrite-mode
		bindkey '^[[3~' delete-char
		bindkey '^[[5~' up-line-or-history
		bindkey '^[[6~' down-line-or-history
		bindkey '^[Od'  emacs-backward-word
		bindkey '^[Oc'  emacs-forward-word
		bindkey '^[Oa' dirname-previous-word
		bindkey '^[Ob' basename-previous-word
	;;
	# Konsole bindings
	xterm-256color)
		bindkey '^[[H' beginning-of-line
		bindkey '^[[F' end-of-line
		bindkey '^[[2~' overwrite-mode
		bindkey '^[[3~' delete-char
		bindkey '^[[5~' up-line-or-history
		bindkey '^[[6~' down-line-or-history
		bindkey '^[[1;5D'  emacs-backward-word
		bindkey '^[[1;5C'  emacs-forward-word
		bindkey '^[[1;5A' dirname-previous-word
		bindkey '^[[1;5B' basename-previous-word
    ;;
esac

# Common bindings
#bindkey '.' rationalise-dot

## Finally, make sure the terminal is in application mode, when zle is
## active. Only then are the values from $terminfo valid.
#if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
#    function zle-line-init () {
#        printf '%s' "${terminfo[smkx]}"
#    }
#    function zle-line-finish () {
#        printf '%s' "${terminfo[rmkx]}"
#    }
#    zle -N zle-line-init
#    zle -N zle-line-finish
#fi

