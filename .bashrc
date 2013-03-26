# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#export LANG=ja_JP.EUC-JP
export LANG=ja_JP.UTF-8

TERM=xterm-256color
eval $(dircolors -b ~/.dir_color)
# User specific aliases and functions
alias diff='colordiff'
alias perldoc='env LANG=C perldoc'
alias cpanm="cpanm -l ~/perl5"
alias ll="ls -ltr"
alias la="ls -ltra"
alias w3m='w3m -cookie'
alias screen='~/local/bin/screen'

# screen起動時にssh-agent設定
if [ "$TERM" = "xterm-256color" ]; then
    eval `ssh-agent`
    ssh-add ~/.ssh/id_rsa
fi
screen
function chpwd() {
  ls
  if [ "$TERM" = "screen" ]; then
    echo -n "^[k[`basename $PWD`]^[\\"
  fi
}
alias dfsls='hadoop dfs -ls'
alias dfsrm='hadoop dfs -rm'       # rm
alias dfscat='hadoop dfs -cat'     # cat
alias dfsrmr='hadoop dfs -rmr'     # rm -r
alias dfsmkdir='hadoop dfs -mkdir' # mkdir
alias dfsput='hadoop dfs -put'     # HDFS
alias dfsget='hadoop dfs -get'     # HDFS

export JAVA_HOME=/usr/java/jdk1.6.0_24
export PATH=$JAVA_HOME/bin:$PATH
export HADOOP_HOME=/usr/lib/hadoop
export PIG_CLASSPATH=$HADOOP_HOME/conf

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

# Source local definitions
if [ -f $HOME/.bashrc_local ]; then
	. $HOME/.bashrc_local
fi

