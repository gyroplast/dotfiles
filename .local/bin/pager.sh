#!/bin/sh
function chkCmd() { type "$1" >/dev/null 2>&1; }

chkCmd bat  && exec bat -p --pager "less -RFS" "$@"
chkCmd less && exec less -RFS "$@"
chkCmd more && exec more "$@"
exec cat "$@"
