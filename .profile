
export SVN_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim '
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim '

alias iftop="sudo iftop -B"
alias rm="rm -i"
alias la="ls -a"
alias ll="ls -ahl"
alias du="du -d 1 -h"
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias highlight="highlight -O rtf --style fine_blue"
alias tnpm="npm --registry http://registry.npm.alibaba-inc.com"
alias cnpm="npm --registry https://registry.npm.taobao.org"
alias aliyun="ssh root@120.78.205.183"
alias coo="UAE_TOKEN=NnY2R3YWJqdGFtc2h6eWdqMjJxZHu coo"
alias canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222"

export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
export PS1='\[\e[0;36m\]\u\[\e[0m\]:\[\e[0m\]\W\[\e[0m\]\$ '

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

export NODE_PATH=/usr/local/lib/node_modules

##
# Your previous /Users/yuan/.profile file was backed up as /Users/yuan/.profile.macports-saved_2015-12-20_at_15:37:03
##

# MacPorts Installer addition on 2015-12-20_at_15:37:03: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$HOME/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
