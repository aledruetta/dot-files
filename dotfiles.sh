#!/bin/bash -eu

# Usage:
#   - Uncomment desired call funtions into main
#   - ./dotfiles.sh

dotfilesDir=$(pwd)
i=0

function linkDotfile {
  dest="${1}/.${2}"
  dateStr="$(date +%Y-%m-%d-%H%M)"

  if [ -L "${dest}" ]; then
    # Existing symlink
    echo "[$((++i))] Removing existing symlink: ${dest}"
    rm "${dest}"

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "[$((++i))] Backing up existing file: ${dest}"
    mv "${dest}"{,."${dateStr}"}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "[$((++i))] Backing up existing dir: ${dest}"
    mv "${dest}"{,."${dateStr}"}
  fi

  echo "[$((++i))] Creating new symlink: ${dest}"
  ln -s "${dotfilesDir}/${2}" "${dest}"
}

function main {
  echo "Start"
  linkDotfile "$HOME" vimrc
  linkDotfile "$HOME" tmux.conf
  linkDotfile "$HOME" bashrc
  linkDotfile "$HOME" bash_alias
  linkDotfile "$HOME" profile
  linkDotfile "$HOME" gitconfig
  linkDotfile "$HOME" gitignore_global
  linkDotfile "$HOME" zshrc
  linkDotfile "$HOME"/.vim ycm_extra_conf.py
  echo "End"
}

main
