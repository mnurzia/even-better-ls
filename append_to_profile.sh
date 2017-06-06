#put this at the end of .zshrc
export LS_COLORS=$(ls_colors_generator)

alias ls='ls-i --color=auto -w $(tput cols)'
alias  dir='dir-i --color=auto -w $(tput cols)'
alias vdir='vdir-i --color=auto -w $(tput cols)'
##bonus : auto ls when cd :
#function chpwd() {
#    ls-i --color=auto -w $(tput cols)
#}

