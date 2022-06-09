#!/bin/bash
_dotfile_repo="${1}"
_branch="${2:-common}"
function config {
	git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" $@
}
git clone --branch "${_branch}" --bare "${_dotfile_repo}" "${HOME}"/.dotfiles --recursive
if (( $? == 128 )); then
	printf -- "Refreshing dotfile repo\n"
	config pull --recurse-submodules
fi
config config status.showUntrackedFiles no
config config commit.gpgsign false
config checkout "${_branch}"
if (( $? == 0 )); then
	echo "Checked out dotfiles."
else
	echo "Backup existing dotfiles, then run command again:"
	config checkout "${_branch}" 2>&1
fi
