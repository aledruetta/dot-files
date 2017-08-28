# if [[ -f ~/.bashrc ]]; then source ~/.bashrc; fi

# bash-git-prompt
export GIT_PROMPT_ONLY_IN_REPO=0        # Use the default prompt when not in a git repo.
export GIT_PROMPT_FETCH_REMOTE_STATUS=0 # Avoid fetching remote status
export GIT_PROMPT_SHOW_UPSTREAM=0       # Don't display upstream acking branch
export GIT_SHOW_UNTRACKED_FILES=no      # Don't count untracked files (no, normal, all)
export GIT_PROMPT_THEME=Solarized       # use theme optimized for solarized color scheme

source ~/.bash-git-prompt/gitprompt.sh

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export TERM='screen-256color'

