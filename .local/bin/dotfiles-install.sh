#!/bin/bash
function config {
	git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" $@
}
git clone --bare gyroplast@vixen:.dotfiles "${HOME}"/.dotfiles --recursive
if (( $? == 128 )); then
	printf -- "Refreshing dotfile repo\n"
	config pull --recurse-submodules
fi
mkdir -p "${HOME}"/.config-backup
config checkout
if [ $? = 0 ]; then
	echo "Checked out dotfiles."
else
	echo "Backing up pre-existing dot files."
	config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} "${HOME}"/.config-backup/{}
fi
config checkout
config config status.showUntrackedFiles no
config config commit.gpgsign false
