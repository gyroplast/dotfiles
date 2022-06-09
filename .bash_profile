#
# ~/.bash_profile
#
for src in ".bash/env" ".bashrc"; do
  [[ -s "${HOME}/${src}" ]] && source "${HOME}/${src}"
  [[ -s "${HOME}/${src}.local" ]] && source "${HOME}/${src}.local"
done
