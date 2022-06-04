# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


# GPG agent for SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null


# source aliases and functions

[[ -s "${HOME}"/.bash/functions ]] && source "${HOME}"/.bash/functions
[[ -s "${HOME}"/.bash/aliases ]] && source "${HOME}"/.bash/aliases
