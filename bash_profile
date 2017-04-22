. ~/.profile
if [[ $- == *i* ]]; then . ~/.bashrc; fi

# Add `~/Devel/bin` to the `$PATH`
export PATH="$HOME/Devel/bin:$PATH"

# Load shell dotfiles
for file in ~/.{bash_prompt,git-prompt.sh}; do
	[ -r "$file" ] && source "$file" && echo "sourced $file"
done
unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export TERM='screen-256color'
