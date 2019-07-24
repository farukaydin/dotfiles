if [[ -r ~/.aliases ]]; then
  source ~/.aliases
fi

re-source(){
  source ~/.zshrc
}

current_directory(){
  echo "%1~"
}

ruby_version() {
  ruby -v | awk '{print $2}' | cut -d p -f 1
}

ruby_prompt() {
  echo "ruby-$(ruby_version)"
}


PROMPT="%F{yellow}$(current_directory) "
RPROMPT="%F{green}$(ruby_prompt)%f"
