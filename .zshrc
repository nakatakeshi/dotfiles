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
#¥Ç¥£¥ì¥¯¥È¥êÌ¾¤òÆþÎÏ¤¹¤ë¤È¤½¤Î¥Ç¥£¥ì¥¯¥È¥ê¤Ë°ÜÆ°
setopt auto_cd
#cd»þ¤Ë-[tab]¤Ç²áµî¤Î°ÜÆ°Àè¤òÊä´°
setopt auto_pushd

# ¥³¥Þ¥ó¥É¥é¥¤¥ó¤Î°ú¿ô¤Ç --prefix=/usr ¤Ê¤É¤Î = °Ê¹ß¤Ç¤âÊä´°¤Ç¤­¤ë
setopt magic_equal_subst

TERM=xterm-256color
eval $(dircolors -b ~/.dir_color)
# User specific aliases and functions
alias diff='colordiff'
alias perldoc='env LANG=C perldoc'
alias cpanm="cpanm -l ~/perl5"
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


# ºÇ¸å¤ËÂÇ¤Ã¤¿¥³¥Þ¥ó¥É¥¹¥Æ¡¼¥¿¥¹¹Ô¤Ë
if [ "$TERM" = "screen" ]; then
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
  if [ "$TERM" = "screen" ]; then
    echo -n "k[`basename $PWD`]\\"
  fi
}

# back
setopt autopushd
alias b='popd > /dev/null'

# zsh¤ÎRPROMPT¤Ë¥Ö¥é¥ó¥ÁÌ¾É½¼¨
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

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
