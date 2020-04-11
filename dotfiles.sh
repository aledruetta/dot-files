#!/bin/bash -eu

# Usage:
#   - Uncomment desired call funtions into main
#   - ./dotfiles.sh

distro="$1"

function linkDotfile {
  dest="${1}/.${3}"
  dateStr="$(date +%Y-%m-%d-%H%M)"

  if [ -L "${dest}" ]; then
    # Removing existing symlink
    echo "Symlink: removing from ${dest}"
    rm "${dest}"

  elif [ -f "${dest}" ]; then
    # Backing up existing file
    echo "File: backing up from ${dest}"
    mv "${dest}"{,."${dateStr}"}

  elif [ -d "${dest}" ]; then
    # Backing up existing dir
    echo "Directory: backing up from ${dest} as ${dest}.${dateStr}"
    mv "${dest}"{,."${dateStr}"}
  fi

  # Creating new symlink
  echo "Symlink: creating new at ${dest}"
  ln -s "$(pwd)/${2}/${3}" "${dest}"
}

function main {
  echo "Start"
  # linkDotfile "$HOME" common vimrc
  # linkDotfile "$HOME" common tmux.conf
  # linkDotfile "$HOME" common bash_alias
  # linkDotfile "$HOME" common gitconfig
  # linkDotfile "$HOME" common gitignore_global
  # linkDotfile "$HOME" common zshrc
  # linkDotfile "${HOME}/.vim" common ycm_extra_conf.py
  # linkDotfile "$HOME" "${distro}" bashrc
  # linkDotfile "$HOME" "${distro}" profile
  echo "End"
}

main
