export SVN_EDITOR='/Applications/MacVim.app/Contents/bin/vim'
export GIT_EDITOR='/Applications/MacVim.app/Contents/bin/vim'

# alias iftop="sudo iftop -B"
alias rm="rm -i"
alias la="ls -a"
alias ll="ls -ahl"
alias du="du -d 1 -h"
# ln -s /Applications/MacVim.app/Contents/bin/vim /usr/local/bin/vi
# highlight themes location: /usr/local/Cellar/highlight/4.1/share/highlight/themes
alias highlight="highlight -O rtf --style edit-eclipse --font-size 22"
alias ttnpm="npm --registry http://registry.npm.alibaba-inc.com"
alias cnpm="npm --registry https://registry.npm.taobao.org"
alias mongod="mongod --dbpath $HOME/.mongod/data"

export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
export PS1='\[\e[0;36m\]\u\[\e[0m\]:\[\e[0m\]\W\[\e[0m\]\$ '

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

export NODE_PATH=/usr/local/lib/node_modules

export PATH="$HOME/sbin:/usr/local/platform-tools:$PATH"
