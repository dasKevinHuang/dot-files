# echo is like puts for bash (bash is the program running in your terminal)
echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# Load RVM into a shell session *as a function*
# Path for RVM

# Path changes are made non-destructive with PATH=new_path;$PATH   This is like A=A+B so we preserve the old path

# Path order matters, putting /usr/local/bin before /usr/bin
# ensures brew programs will be seen and used before another program
# of the same name is called

# Path for brew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#c_reset=$(tput setaf 0)
#  \e[0;31m\ sets the color to red
c_path='\e[0;31m\]'
#c_path=$(tput setaf 55)
# \e[0;32m\ sets the color to green
c_git_clean='\e[0;32m\]'
#c_git_clean=$(tput setaf 2)
# \e[0;31m\ sets the color to red
c_git_dirty='\e[0;31m\]'
#c_git_dirty=$(tput setaf 9)

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND=$PROMPT_COMMAND' PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  # Is this a git directory?
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# Set sublime as the default editor
# which -s subl && export EDITOR="subl --wait"

# Set Vim as the default editor
export EDITOR="vim"

# Useful aliases

alias e="subl"
alias be="bundle exec"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# If you installed the SDK without Android Studio, then it may be something like:
# /usr/local/opt/android-sdk
export ANDROID_HOME="$HOME/Library/Android/sdk"
# Your exact string here may be different.
PATH="$HOME/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH
