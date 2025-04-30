# Iterm2 Title bar text - only show current folder
if [ $ITERM_SESSION_ID ]; then
  precmd() {
    echo -ne "\033]0;${PWD##*/}\007"
  }
fi

# PATH
BASE_PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
HOMEBREW_PATH="/opt/homebrew/bin"
VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
NODE_PATH="/usr/local/opt/node/bin"
RUST_PATH="/Users/mansoor/.cargo/bin"
LIQUIBASE_HOME="/opt/homebrew/opt/liquibase/libexec"
# DOTNET_PATH="/usr/local/share/dotnet:/usr/local/share/dotnet/sdk"
# GO_PATH="/usr/local/go:/usr/local/go/bin"
# HYPER_PATH="/usr/local/bin/hyper"
KITTY_PATH="/Applications/kitty.app/Contents/MacOS"

export PATH=$HOMEBREW_PATH:$BASE_PATH:$NODE_PATH:$VSCODE_PATH:$KITTY_PATH:$RUST_PATH
#export PATH=$BASE_PATH:$NODE_PATH:$VSCODE_PATH:$DOTNET_PATH:$GO_PATH:$(yarn global bin)
export ZSH="/Users/mansoor/.oh-my-zsh"
#export https_proxy='webproxy.itservices.transport.nsw.gov.au:8080'
#export https_proxy='147.200.0.44.:8080'

#export http_proxy="10.28.3.44:8080"
#export https_proxy="10.28.3.44:8080"
#export http_proxy="10.34.100.100"
#export https_proxy="10.34.100.100"
# Hide annoying warning about permissions
ZSH_DISABLE_COMPFIX=true

ZSH_THEME="mnsr"

# auto title
DISABLE_AUTO_TITLE="true"

# HIST
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE="10000"
SAVEHIST="10000"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(git zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

#vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

# zsh binds
bindkey '^ ' autosuggest-accept

# zsh aliases
alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias wezconfig="vim ~/.wezterm.lua"
alias :so="source $1"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
#alias zja="zellij a $(zellij ls | fzf -0 -1)"

# standard aliases
alias dir="ls -GFhAlo"
alias cls="clear" # windows shortcut

# nav aliases
alias gohome="cd ~"
alias godev="cd ~/Development"
alias gostuff="cd /Volumes/Stuff"

# open in finder
alias ee="open ."
alias ehome="open ~"
alias edev="open ~/Development"
alias eapp="open /Applications"
alias emono="open ~/Development/AA_Apps/"

# git aliases
alias gaa="git add *"
alias gp="git pull"
alias gs="git status"
alias gitconf="git config --edit --global"
alias git-publish="git push --set-upstream origin $1"

# tmux aliases
alias tnew="tmux new -s $1"

# app aliases
alias chrome="open -a 'Google Chrome'"

#npm aliases
alias npmg="npm list -g --depth 0"

# postgre
# alias pgstart="pg_ctl -D /usr/local/var/postgres start"
alias pgadmin="open /Applications/PostgreSQL\ 12/pgAdmin\ 4.app"

# added by Snowflake SnowSQL installer v1.2
#export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
# [[ -z $TMUX ]] && exec tmux
source /Users/mansoor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/Users/mansoor/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

source ~/devscripts.sh
# pnpm end
