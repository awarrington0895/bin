# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

green=`tput setaf 2`
reset=`tput sgr0`      

export PATH=$PATH:~/bin
echo "${green}Welcome back Mr. Warrington!${reset}"
alias rm="~/bin/.rem.sh"
alias mksh="~/bin/create-script.sh"
alias l.="ls -a"
alias cpu_util='cpu_util.sh'
alias clean='clean.sh'
alias cmds='cmds.sh'
alias sp='sp.sh'

# This breakpoint dictates where the automated changes to this file start
alias trash="trash.sh"
alias .clean_trash=".clean_trash.sh"
alias .update=".update.sh"
