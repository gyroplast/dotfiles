alias config='git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}"'
alias az="docker --context default run -it --rm -v ${HOME}/.ssh/airnex/azure_deh:/root/.ssh/id_rsa:ro -v ${HOME}/.ssh/airnex/azure_deh.pub:/root/.ssh/id_rsa.pub:ro -v ${HOME}/.azure:/root/.azure mcr.microsoft.com/azure-cli az"
alias makepkg-docker="docker --context default run -it --rm -v \"\$(pwd)\":/pkg -e EXPORT_PKG=yes -e EXPORT_SRC=yes -e PACKAGER docker-makepkg"
#alias virsh="virsh -c qemu:///system"
alias pacorphans="sudo pacman -Qtdq | sudo pacman -Rns -"
alias ktech="docker --context default run -it --rm -v \"$(pwd)\":/data viktorpopkov/ktools ktech"
