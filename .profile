
export SVN_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim '
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim '

alias iftop="sudo iftop -B"
alias rm="rm -i"
alias la="ls -a"
alias ll="ls -ahl"
alias du="du -d 1 -h"
alias v="/Applications/MacVim.app/Contents/MacOS/MacVim"
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias node-debug="node --debug-brk --inspect"

export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
export PS1='\[\e[0;36m\]\u\[\e[0m\]:\[\e[0m\]\W\[\e[0m\]\$ '

export NODE_PATH=/usr/local/lib/node_modules


##
# Your previous /Users/yuan/.profile file was backed up as /Users/yuan/.profile.macports-saved_2015-12-20_at_15:37:03
##

# MacPorts Installer addition on 2015-12-20_at_15:37:03: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
