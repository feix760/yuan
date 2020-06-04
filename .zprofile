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
alias mongod="mongod --dbpath $HOME/.mongod/data"

export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
export PS1='\[\e[0;36m\]\u\[\e[0m\]:\[\e[0m\]\W\[\e[0m\]\$ '

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

export NODE_PATH=/usr/local/lib/node_modules

# MacPorts Installer addition on 2015-12-20_at_15:37:03: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$HOME/sbin:$HOME/Library/Android/sdk/platform-tools:$PATH"
