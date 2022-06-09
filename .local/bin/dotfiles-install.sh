#!/bin/bash
_dotfile_repo="${1}"
function config {
	git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" $@
}
git clone --bare "${_dotfile_repo}" "${HOME}"/.dotfiles --recursive
if (( $? == 128 )); then
	printf -- "Refreshing dotfile repo\n"
	config pull --recurse-submodules
fi
config config status.showUntrackedFiles no
config config commit.gpgsign false
config checkout
if (( $? == 0 )); then
	echo "Checked out dotfiles."
else
	echo "Backup existing dotfiles, then run command again:"
	config checkout 2>&1
fi
