# Imports for my bashrc
for file in ~/dotfiles/bashrc/{bash_prompt,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

eval "$(hub alias -s)"

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash
# https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
source ~/.hub.bash_completion.sh
