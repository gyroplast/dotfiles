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

# non-vendored bash completions
[[ -s /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

# source aliases and functions

for src in functions aliases; do
  [[ -s "${HOME}/.bash/${src}" ]] && source "${HOME}/.bash/${src}"
  [[ -s "${HOME}/.bash/${src}.local" ]] && source "${HOME}/.bash/${src}.local"
done
