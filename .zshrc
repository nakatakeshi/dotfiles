#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

stty stop undef

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
#
#ディレクトリ名を入力するとそのディレクトリに移動
setopt auto_cd
#cd時に-[tab]で過去の移動先を補完
setopt auto_pushd

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

TERM=xterm-256color
eval $(dircolors -b ~/.dir_color)

#ssh-agent in screen
# screen起動時にssh-agent設定
# if [ "$TERM" = "xterm-256color" ]; then
#     eval `ssh-agent`
#     ssh-add ~/.ssh/id_rsa
# fi

# for github
# ssh-add /path/to/github_key

agent="$HOME/tmp/ssh-agent-$USER"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi

# User specific aliases and functions
alias vi='vim'
alias diff='colordiff'
alias perldoc='env LANG=C perldoc'
alias ll="ls -ltr"
alias la="ls -ltra"
alias w3m='w3m -cookie'
# for svn
alias svn_grep_c="svn status | grep '^C' | awk '{ print $2}'"
alias ack='ack --ignore-file=is:tags '
alias ag='ag --ignore tags '
alias ack_app='ack --ignore-dir coverage --ignore-dir log --ignore-dir vendor '
alias st_server='ruby -run -e httpd . -p 9999'
alias ipython='ipython --pylab'
alias start_ds="gcloud beta emulators datastore start --no-store-on-disk"
#alias svn_resol_c="svn resolved `svn status | grep '^C' | awk '{ print $2}'`" # can't escape back qupte `
# key bind
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line


# # 最後に打ったコマンドステータス行に
# if [ "$TERM" = "xterm-256color" ]; then
#         chpwd () { echo -n "_`dirs`^[\\" }
#         preexec() {
#                 # see [zsh-workers:13180]
#                 # http://www.zsh.org/mla/workers/2000/msg03993.html
#                 emulate -L zsh
#                 local -a cmd; cmd=(${(z)2})
#                 case $cmd[1] in
#                         fg)
#                                 if *1; then
#                                         cmd=(builtin jobs -l %+)
#                                 else
#                                         cmd=(builtin jobs -l $cmd[2])
#                                 fi
#                                 ;;
#                         %*)
#                                 cmd=(builtin jobs -l $cmd[1])
#                                 ;;
#                         cd)
#                                 if *2; then
#                                         cmd[1]=$cmd[2]
#                                 fi
#                                 ;&
#                         *)
#                                 echo -n "k$cmd[1]:t\\"
#                                 return
#                                 ;;
#                 esac
#
#                 local -A jt; jt=(${(kv)jobtexts})
#
#                 $cmd >>(read num rest
#                         cmd=(${(z)${(e):-\$jt$num}})
#                         echo -n "k$cmd[1]:t\\") 2>/dev/null
#         }
#         chpwd
# fi

function chpwd() {
  ls
  echo "$TERM"
  if [ "$TERM" = "xterm-256color" ]; then
    echo -n "k[`basename $PWD`]\\"
  fi
}

# back
setopt autopushd
alias b='popd > /dev/null'

# zshのRPROMPTにブランチ名表示
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
# precmd () {
#     psvar=()
#     LANG=en_US.UTF-8 vcs_info
#     [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# }
# RPROMPT="%1(v|%F{green}%1v%f|)"
# git completion
autoload bashcompinit
bashcompinit
source ~/.git-completion.bash
source ~/.git-prompt.sh
# http://qiita.com/items/325cffc755fc1ff91928
# setopt prompt_subst
# autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

# function rprompt-git-current-branch {
#   local name st color gitdir action
#   if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
#     return
#   fi
#   name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
#   if [[ -z $name ]]; then
#     return
#   fi
#
#   gitdir=`git rev-parse --git-dir 2> /dev/null`
#   action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
#
#   color=%F{green}
#   echo "$color$name$action%f%b "
# }

# -------------- how to use ---------------- #
# RPROMPT='`rprompt-git-current-branch`'

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# history
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY
export PATH="$HOME/bin:/usr/local/bin:$HOME/.plenv/bin:/usr/local/share/dotnet:$PATH"

# plenv
#eval "$(plenv init -)"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
export GO111MODULE=on
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# http://postd.cc/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

ulimit -n 10240
# pyenv
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# gue-sed
# alias sed="gsed"
# export PS1="%F{green}[%D{%m-%d %T}](%m)[%d]%f($(__git_ps1)) %# "
setopt PROMPT_SUBST ; PS1='%F{green}[%D{%m-%d %T}](%m)[%d]%f$(__git_ps1) {$(kube_ctx)} gcloud:$(gcloud-current)
%'

# flutter
export PATH=~/flutter/flutter/bin:$PATH

# gcloud
#source $HOME/Downloads/google-cloud-sdk/completion.bash.inc
#source $HOME/Downloads/google-cloud-sdk/path.bash.inc
# なぜかpathがとおならい
export PATH=$HOME/Downloads/google-cloud-sdk/bin:$PATH

# elixir
export PATH="$HOME/.exenv/bin:$PATH"
export PATH=/usr/local/opt/openssl/bin:$PATH
#export PATH="$HOME/.erlenv/bin:$PATH"
#eval "$(erlenv init -)"
export PATH="/usr/local/opt/erlang@20/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

export PATH=$HOME/bin:$PATH
export KUBECONFIG=~/.kube/config

function kube_ctx  {
  k=`kubectl config current-context | sed -e 's/.*\/\(.*\)/\1/'`
    # prod
    if [ "${k}" = "" ]; then
      echo "\e[31m$k\e[0m"
    else
      echo $k
    fi
}

function gcloud-current() {
    g=`cat $HOME/.config/gcloud/active_config`
    # prod
    if [ "${g}" = "" ]; then
      echo "\e[31m$g\e[0m"
    else
      echo $g
    fi
}

function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

function kubesw {
    selected_ctx=$(kubectl config get-contexts --no-headers | awk '{print $2}' | xargs printf "%s\n" | sort | peco --query "$1" --prompt '>' | cut -f 3)

    echo ${selected_ctx}
    if [ -n "${selected_ctx}" ]; then
        kubectl config use-context ${selected_ctx}
    fi
}
export PATH="/usr/local/opt/libxslt/bin:$PATH"
autoload -Uz compinit && compinit
export PATH=$HOME/.asdf/bin:$HOME/bin:$HOME/Library/Android/sdk/platform-tools:/usr/local/opt/erlang@20/bin:/usr/local/opt/openssl/bin:$HOME/.exenv/bin:$HOME/flutter/flutter/bin:$HOME/.pyenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:/usr/local/bin:$HOME/.plenv/bin:/usr/local/share/dotnet:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin/:$HOME/bin:$HOME/go/bin:/usr/local/go/bin:${PATH}
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

eval "$(direnv hook zsh)"

PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# gconf.zsh
function gconf() {
  projData=$(gcloud config configurations list | peco)
  if echo "${projData}" | grep -E "^[a-zA-Z].*" > /dev/null ; then
    config=$(echo ${projData} | awk '{print $1}')
    gcloud config configurations activate ${config}

    echo "=== The current account is as follows ==="
    gcloud config configurations list | grep "${config}"

    kubesw
  fi
}

# install go version
function installgo() {
  go get golang.org/dl/go$1
  go$1 download
  go$1 version
  which go$1
}
alias go="$HOME/go/bin/go1.17"
alias f="fzf"
alias k="kubectl"

# rust
source $HOME/.cargo/env

# jenv
eval export PATH="$HOME/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# export KUBECONFIG=/path/to/kubeconfig
