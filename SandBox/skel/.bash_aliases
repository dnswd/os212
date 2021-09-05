# Thu 15 Jul 2021 20:24:15 WIB
# If cores = 2; j=2
export MAKEFLAGS='-j2'

alias cl='clear;echo ""'
alias h='history'  
alias gac='git add -A && git commit'
alias ggg='git pull; git add -A; git commit -m "OS212 cbkadal"; git push;'
alias glog='git log --all --decorate --oneline --graph'
alias mv='mv -i'  
alias rm='rm -i'  
alias sss='. ~/.bash_profile'
extraprompt() {
   local EXSTAMP=$(printf "%8.8X" $(( $(date +%s) & 16#FFFFFFFF )) )
   local EXCHSUM="XXXXXXXX"
   [ "$(hostname)" = "$USER" ] && {
       EXCHSUM=$(echo "$USER$EXSTAMP"|sha1sum|tr '[a-z]' '[A-Z]'| cut -c1-8)
   }
   echo  ZCZC $EXSTAMP $EXCHSUM
}
export PROMPT_COMMAND="extraprompt"
export EDITOR=/usr/bin/vi
export HISTSIZE=2000
export HISTFILESIZE=2000
export LFS=/mnt/lfs
