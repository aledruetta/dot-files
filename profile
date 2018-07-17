# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "${PS1-}" ]; then
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# bash-git-prompt
export GIT_PROMPT_ONLY_IN_REPO=0

# export GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# export GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# export GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# export GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# export GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# export GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# export GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# export GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# export GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# export GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

source ~/.bash-git-prompt/gitprompt.sh

# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Add ~/Devel/bin to the PATH
if [ -d "$HOME/Devel/bin" ]; then
	export PATH="$PATH:$HOME/Devel/bin"
fi
