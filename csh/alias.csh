source /IT/common/alias.csh

# Del unneeded aliases set by IT
# unalias ...

# Add my most common aliases here, these are the basic alias settings.  aliases
# of special tools should add into the rc of the tool itself

alias b     "cd ../"
alias bb    "cd ../../"
alias bbb   "cd ../../../"
alias bbbb  "cd ../../../../"
alias v     "vim"
alias vi    "vim"
alias g     "gvim"
alias e     "emacs -nw"
alias ls    "ls --color=auto --human-readable --indicator-style=slash --group-directories-first"
alias srcme "cd ~/ && source ~/.cshrc && cd -"
alias bjobs "bjobs -w"
alias ll    "ls -al"