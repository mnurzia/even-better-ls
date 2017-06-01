LS_COLORS=$(ls_colors_generator)

alias ls="ls-i --color=auto -w $(tput cols) -C"
alias dir="dir-i --color=auto -w $(tput cols)"
alias vdir="vdir-i --color=auto -w $(tput cols)"