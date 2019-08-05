if [[ -r ~/.aliases ]]; then
  source ~/.aliases
fi

setopt PROMPT_SUBST

re-source(){
  source ~/.zshrc
}

current_directory(){
  echo "%1~"
}

ruby_version() {
  rbenv version | cut -d ' ' -f 1
}

ruby_prompt() {
  if [[ -n $(ruby_version) ]]; then
    echo "ruby-$(ruby_version)"
  fi
}

git_prompt() {
  branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ -n $branch ]]; then
    echo "(${branch})"
  fi
}

gpc() {
  current_branch=$(git branch --show-current)
  $(git push origin ${current_branch} $1)
}

remove_pid() {
  rm /usr/local/var/postgres/postmaster.pid
}

PROMPT='%F{green}➜  %F{yellow}$(current_directory) %F{green}$(git_prompt)%f '
RPROMPT='%F{green}$(ruby_prompt)%f'

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
