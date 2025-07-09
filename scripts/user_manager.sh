#!/bin/bash

# Simple user manager script

case "$1" in
  add)
    sudo useradd "$2"
    echo "User $2 added"
    ;;
  del)
    sudo userdel "$2"
    echo "User $2 deleted"
    ;;
  list)
    cut -d: -f1 /etc/passwd
    ;;
  *)
    echo "Usage: $0 {add|del|list} [username]"
    ;;
esac
