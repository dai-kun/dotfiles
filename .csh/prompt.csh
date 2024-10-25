setenv COLUMNS 120
set _reset   = "%{\e0m%}"
set _red     = "%{\e1:31m%}"
set _green   = "%{\e1:32m%}"
set _yellow  = "%{\e1:33m%}"
set _blue    = "%{\e1:34m%}"
set _magenta = "%{\e1:35m%}"
set _cyan    = "%{\e1:36m%}"
set _white   = "%{\e1:37m%}"

set _black_on_red     = "%{\e0:30:41m%}"
set _black_on_green   = "%{\e0:30:42m%}"
set _black_on_yellow  = "%{\e0:30:43m%}"
set _black_on_blue    = "%{\e0:30:44m%}"
set _black_on_magenta = "%{\e0:30:45m%}"
set _black_on_cyan    = "%{\e0:30:46m%}"
set _black_on_white   = "%{\e0:30:47m%}"

set _grey   = "%{\e38:5:241m%}"

set _yellow_on_blue   = "%{\e0:33:44m%}"
set _blue_on_green    = "%{\e0:34:42m%}"
set _green_on_magenta = "%{\e0:32:45m%}"

set _head = "${_yellow}%W-%D ${_blue}%T ${_green}%n@%m ${_magenta}%~ ${_reset}${_grey}"
@ dwc = $COLUMNS - 29 - `pwd -L | sed "s#$HOME#~#"|wc -c`
if (`date +%H | sed 's/[0-9]$//'` == "0") then
@ dwc = $dwc + 1
endif

set _sep = '~/.csh/prompt.pl $dwc`
set _tail = "${_reset} \n${_yellow}>>>${_reset} "
set prompt = "${_head}${_sep}${_tail}"

unset _reset
unset _red _green _yellow _blue _magenta _cyan _white 
unset _black_on_red _black_on_green _black_on_yellow _black_on_blue _black_on_magenta _black_on_cyan _black_on_white 
unset _grey
unset _yellow_on_blue _blue_on_green _green_on_magenta 

alias cwdcmd 'ls'
alias precmd '@ dwc = $COLUMNS - 29 - `pwd -L | sed "s#$HOME#~#"|wc -c`; set _sep = '~/.csh/prompt.pl $dwc`; set prompt = "${_head}${_sep}${_tail}";'