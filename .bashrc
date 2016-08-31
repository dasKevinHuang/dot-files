export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
### Set PostgreSQL directory

export PGDATA="/usr/local/var/postgres"

# added by travis gem
#[ -f /Users/KevinHuang/.travis/travis.sh ] && source /Users/KevinHuang/.travis/travis.sh
#source ~/git-flow-completion.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# If you installed the SDK without Android Studio, then it may be something like:
# /usr/local/opt/android-sdk
export ANDROID_HOME="/Library/Android/sdk"
# Your exact string here may be different.
PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH
