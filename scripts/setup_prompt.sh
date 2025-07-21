#!/bin/bash

# === setup_prompt.sh ===
# This script customizes the Bash prompt and enables colored output for ls.

# USAGE:
# 1. Make it executable:
#    chmod +x setup_prompt.sh
#
# 2. Source it into your current shell:
#    source setup_prompt.sh
#
# 3. (Optional) Add it to your ~/.bashrc or ~/.bash_profile to load on every terminal session:
#    grep -qxF "source ~/path/to/setup_prompt.sh" ~/.bashrc || echo "source ~/path/to/setup_prompt.sh" >> ~/.bashrc


# === ENABLE COLORS FOR ls COMMAND ===
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'
fi

# === CUSTOMIZE THE PROMPT (PS1) ===
# Shows the current directory name in green
PS1='\[\e[1;32m\]\W\[\e[0m\] \$ '
