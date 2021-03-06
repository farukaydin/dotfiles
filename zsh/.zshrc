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

kill_rails_server() {
  rails_process=$(ps aux | grep rails | grep -v grep | awk '{print $2}')
  kill -9 $rails_process
}

remove_pid() {
  rm /usr/local/var/postgres/postmaster.pid
}

remove_remote_branch() {
  $(git push origin --delete $1)
}

PROMPT='%F{green}➜  %F{yellow}$(current_directory) %F{green}$(git_prompt)%f '
RPROMPT='%F{green}$(ruby_prompt)%f'

eval "$(rbenv init -)"

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
