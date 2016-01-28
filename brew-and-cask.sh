# Refernces:
#   * https://gist.github.com/phatblat/1713458

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    # https://github.com/mxcl/homebrew/wiki/installation
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
    brew update
fi

# airmail
# 1pass
# shush
# tweetbot
#

brew cask install slack
brew cask install macdown
brew cask install google-chrome
brew cask install spotify
brew cask install vlc
brew cask install paw
brew cask install atom
brew cask install postico
brew cask install dash
brew cask install ekitch
brew cask install sketch
brew cask install tower
brew cask install kaleidoscope
brew cask install caffeine
brew cask install cloak
brew cask install divvy
brew cask install djay-pro
brew cask install firefox
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install iterm2
brew cask install navicat-premium-essentials
brew cask install transmit
