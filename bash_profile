# Imports for my bashrc
for file in ~/dotfiles/bashrc/{bash_prompt,aliases,functions,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

eval "$(hub alias -s)"

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash
# https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
source ~/.hub.bash_completion.sh

export NVM_DIR="/Users/luckyrye/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Base16 Shell
# https://github.com/chriskempson/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
