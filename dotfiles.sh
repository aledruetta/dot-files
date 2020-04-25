#!/usr/bin/env bash

# Usage:
#   - Uncomment desired call funtions into main
#   - ./dotfiles.sh [-vtgbz] distro

set -o errexit      # Abort script at first error
set -o nounset      # Error when attempt to use undefined variable
# set -o xtrace       # Verbose
set -o pipefail     # Pipeline return the exit status

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

  final_msg=""

  while getopts ":vtbgz" opt; do
    case "$opt" in
      v  ) # vim
        if [[ ! -d ~/.vim/bundle ]]; then
          git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
          final_msg+="\n- Uncomment vim plugins and run :PluginsInstall"
        fi
        linkDotfile "$HOME" common vimrc
        linkDotfile "${HOME}/.vim" common ycm_extra_conf.py
        ;;
      t  ) # tmux
        if [[ ! -d ~/.tmux ]]; then
          git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
          final_msg+="\n- Install tmux plugins with 'C-b + I'"
        fi
        linkDotfile "$HOME" common tmux.conf
        ;;
      b  ) # bash
        linkDotfile "$HOME" common bash_aliases
        linkDotfile "$HOME" "${distro}" bashrc
        linkDotfile "$HOME" "${distro}" bash_logout
        linkDotfile "$HOME" "${distro}" profile
        ;;
      g  ) # git
        if [[ ! -d ~/.bash-git-prompt ]]; then
          git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
        fi

        cat <<END >> ~/.bashrc

# Git completion
. ~/.git-completion.bash
END
        cat <<END >> ~/.bashrc

# Git prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_THEME=Default_Ubuntu
    source $HOME/.bash-git-prompt/gitprompt.sh
fi
END
        linkDotfile "$HOME" common gitconfig
        linkDotfile "$HOME" common gitignore_global
        linkDotfile "$HOME" common git-completion.bash
        # linkDotfile "$HOME" common git-prompt.sh
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

  echo -e "$final_msg"
  echo -e "\nEnd..."
}

main "$@"
