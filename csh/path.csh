# This file is for common configurations, which means they are independent from
# any eda tools or in-house tools
setenv PATH "./:$(PATH)"
...

setenv MANPATH `manpath -q`
setenv MANPATH "$(HOME)/.local/share/man:$(MANPATH)"
...

setenv LD_LIBRARY_PATH "."
setenv LD_LIBRARY_PATH "$(HOME)/.local/lib:$(LD_LIBRARY_PATH)"
...