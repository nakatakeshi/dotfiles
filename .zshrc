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
alias diff='colordiff'
alias perldoc='env LANG=C perldoc'
alias ll="ls -ltr"
alias la="ls -ltra"
alias w3m='w3m -cookie'
# for svn
alias svn_grep_c="svn status | grep '^C' | awk '{ print $2}'"
#alias svn_resol_c="svn resolved `svn status | grep '^C' | awk '{ print $2}'`" # can't escape back qupte `
# key bind
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line


# 最後に打ったコマンドステータス行に
if [ "$TERM" = "xterm-256color" ]; then
        chpwd () { echo -n "_`dirs`^[\\" }
        preexec() {
                # see [zsh-workers:13180]
                # http://www.zsh.org/mla/workers/2000/msg03993.html
                emulate -L zsh
                local -a cmd; cmd=(${(z)2})
                case $cmd[1] in
                        fg)
                                if *1; then
                                        cmd=(builtin jobs -l %+)
                                else
                                        cmd=(builtin jobs -l $cmd[2])
                                fi
                                ;;
                        %*)
                                cmd=(builtin jobs -l $cmd[1])
                                ;;
                        cd)
                                if *2; then
                                        cmd[1]=$cmd[2]
                                fi
                                ;&
                        *)
                                echo -n "k$cmd[1]:t\\"
                                return
                                ;;
                esac

                local -A jt; jt=(${(kv)jobtexts})

                $cmd >>(read num rest
                        cmd=(${(z)${(e):-\$jt$num}})
                        echo -n "k$cmd[1]:t\\") 2>/dev/null
        }
        chpwd
fi

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

# http://qiita.com/items/325cffc755fc1ff91928
setopt prompt_subst
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  color=%F{green}
  echo "$color$name$action%f%b "
}

# -------------- how to use ---------------- #
RPROMPT='`rprompt-git-current-branch`'

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
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# go
export GOROOT=$HOME/local/go
export GOPATH=$HOME/local/gocode
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
