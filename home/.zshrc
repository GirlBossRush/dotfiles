ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

TERM=xterm-256color
LC_ALL=en_US.UTF-8

# Saner word deletion
# bindkey -M emacs '^[[3~' kill-word
# bindkey -M emacs '^H' backward-kill-word
# bindkey -M emacs '^[[3;5~' kill-word

bindkey -M emacs '^[[w' kill-word
bindkey -M emacs '^H' backward-kill-word
# Get out of my face with your updates.
DISABLE_UPDATE_PROMPT=true

# OSX
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#### Aliases ####
alias downloads="cd ~/Downloads"
alias be='bundle exec'
alias rr='bundle exec rails s'
alias ....="cd ../../.."
alias resume='tmux attach'
alias s='tig status'
alias t='git commit'
alias p='git pull'
alias pp='git push'
alias meld='noglob git meld -'
# alias qqqq='exit'
alias git='noglob git'
alias before='git co -'
alias fetch='noglob git fetch'
alias zshconfig="vim ~/.zshrc"
alias fluff='source ~/.zshrc'
alias 'add-ppa'='add-apt-repository'
alias irssi='TERM=screen-256color irssi'
alias n='npm'
alias y='yarn'
alias st='code'
alias disconnect-vpn='sudo killall -INT openconnect'
# alias vim="stty stop '' -ixoff ; vim"
# ttyctl -f

stty ixany
stty ixoff -ixon

#### Oh My ZSH ####
ME="$(whoami)"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
source $ZSH/oh-my-zsh.sh
PATH=$PATH:$HOME/.oh-my-vim/bin

PATH=$PATH:$HOME/usr/bin

#### Colors for man pages ####
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#### Environmental Variables ####
export EDITOR=code
GIT_MERGE_AUTOEDIT=no # Disable opening the editor when merging
setopt no_hist_verify # Skip substitution confirmations.
setopt nobeep

export PATH=/usr/local/lib/node_modules:$PATH
export PATH=/usr/local/share/git-core/contrib/diff-highlight:/usr/share/git/diff-highlight:$PATH

# Brew
export PATH=/usr/local/bin:$PATH

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export RUBY_GC_HEAP_INIT_SLOTS=1650000
export RUBY_HEAP_FREE_MIN=200000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=189000000

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Autojump
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# PATH="/Users/teffen/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/Users/teffen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/Users/teffen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/Users/teffen/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/teffen/perl5"; export PERL_MM_OPT;

unalias gp

# Limit `ls` tab completion to directory names.
compdef _dirs ls

if [ -x "$(command -v exa)" ]; then
  compdef _dirs exa
  alias ls="exa"
fi

export PATH="/usr/local/opt/curl/bin:$PATH"

# Coder Enterprise
export PATH=/home/coder/enterprise/devbin:$PATH

# Hide annoying banners.
DISABLE_OPENCOLLECTIVE=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $ITERM_SESSION_ID ]]; then
  # Display the current git repo, or directory, in iterm tabs.
  get_iterm_label() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      local directory
      directory=${PWD##*/}
      echo -ne "\\033];$directory\\007"
    else
      local branch
      local branchdir
      branchdir=$(basename "$(git rev-parse --show-toplevel)")
      branch=$(git branch 2>/dev/null | grep -e '\* ' | sed "s/^..\(.*\)/{\1}/")
      echo -ne "\\033];$branchdir $branch\\007"
    fi
  }
  export PROMPT_COMMAND=get_iterm_label;"${PROMPT_COMMAND}"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/teffen/Downloads/google-cloud-sdk-292.0.0-darwin-x86_64/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/teffen/Downloads/google-cloud-sdk-292.0.0-darwin-x86_64/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/teffen/Downloads/google-cloud-sdk-292.0.0-darwin-x86_64/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/teffen/Downloads/google-cloud-sdk-292.0.0-darwin-x86_64/google-cloud-sdk/completion.zsh.inc'; fi
