#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file


bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
bindkey "^[[3~" backward-kill-line
bindkey "^[[1;5D" backward-kill-line
bindkey "^[[1;5C" kill-line
bindkey "^[undo" undo
bindkey "^[redo" redo
setopt clobber
setopt auto_cd

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
  ;;
esac

alias wb='cd /Users/furlender/gitstore'
alias gs='git status'
alias gu='git add -u'
alias gcm='git commit -m'
alias grc='git commit --amend --no-verify --no-edit'
alias gp='git push'
if [[ -e ${HOME}/.passwords/wb_db ]]; then
  DBPWD=$(<${HOME}/.passwords/wb_db)
  alias sql="mysql -u root -p${DBPWD} --database=weatherbell"
fi
alias gulp='nocorrect gulp'

test -e ${HOME}/.composer && export PATH=$PATH:${HOME}/.composer/vendor/bin/
test -e ${HOME}/.local && export PATH=$PATH:${HOME}/.local/bin/
test -e ${HOME}/anaconda3 && export PATH=$PATH:${HOME}/anaconda3/bin/
test -e /Applications/MAMP && export PATH=$PATH:/Applications/MAMP/Library/bin/
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e ${HOME}/.zsh && fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
if hash thefuck 2>/dev/null; then
  eval "$(thefuck --alias)"
fi
if hash pygmentize 2>/dev/null; then
  alias ccat='pygmentize -O style=monokai -f console256 -g'
fi

