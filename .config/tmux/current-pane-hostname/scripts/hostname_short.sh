#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/shared.sh

main() {
  get_info "cat /etc/hostname"
  #get_info "hostname -s 2>/dev/null || cat /etc/hostname 2>/dev/null || hostnamectl --static 2>/dev/null || printf unknown-host"
}

main
