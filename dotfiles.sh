#!/bin/bash -eu

# Usage:
#   - Uncomment desired call funtions into main
#   - ./dotfiles.sh

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

function usage {
  echo "Usage: $0 [-vtgbz] distro" 1>&2
  exit 1
}

function main {
  if [[ $# -ne 2 ]]; then
    usage
  fi

  distro="$2"

  echo "Linux distro: $distro"
  echo -e "\nStart...\n"

  while getopts ":vtbgz" opt; do
    case "$opt" in
      v  ) # vim
        linkDotfile "$HOME" common vimrc
        linkDotfile "${HOME}/.vim" common ycm_extra_conf.py
        ;;
      t  ) # tmux
        linkDotfile "$HOME" common tmux.conf
        ;;
      b  ) # bash
        linkDotfile "$HOME" common bash_alias
        linkDotfile "$HOME" "${distro}" bashrc
        linkDotfile "$HOME" "${distro}" profile
        ;;
      g  ) # git
        linkDotfile "$HOME" common gitconfig
        linkDotfile "$HOME" common gitignore_global
        ;;
      z  ) # zsh
        linkDotfile "$HOME" common zshrc
        ;;
      \? ) # usage
        usage
        ;;
      *  ) # else
        usage
        ;;
    esac
  done
  shift $((OPTIND-1))
  echo -e "\nEnd..."
}

main "$@"
