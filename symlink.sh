#!/bin/bash -eu

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${1}/.${2}"
  dateStr="$(date +%Y-%m-%d-%H%M)"

  if [ -L "${dest}" ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm "${dest}"

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv "${dest}"{,."${dateStr}"}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv "${dest}"{,."${dateStr}"}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s "${dotfilesDir}/${2}" "${dest}"
}

function main {
  linkDotfile "$HOME" vimrc
  linkDotfile "$HOME" tmux.conf
  linkDotfile "$HOME" bashrc
  linkDotfile "$HOME" profile
  linkDotfile "$HOME" gitconfig
  linkDotfile "$HOME" gitignore_global
  linkDotfile "$HOME" zshrc
  linkDotfile "$HOME"/.vim ycm_extra_conf.py
}

main "$@"
