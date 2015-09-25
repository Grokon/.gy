#!/usr/bin/env bash


# Install Xcode tools
xcode-select --install

# Install newest bash and zsh and make zsh the login shell
brew install bash
brew install bash-completion
echo "`brew --prefix`/bin/bash" | sudo tee -a /etc/shells


###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################
ESC_SEQ="\x1b["
COL_YELLOW=$ESC_SEQ"33;01m"
COL_RESET=$ESC_SEQ"39;49;00m"
COL_GREEN=$ESC_SEQ"32;01m"

function running() {
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}
function ok() {
    echo -e "$COL_GREEN[ok]$COL_RESET "$1
}

#Enable trim for ~>10.4 
sudo trimforce enable

running "Disable local Time Machine snapshots"
sudo tmutil disablelocal;ok

running "Disable hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0;ok

running "Remove the sleep image file to save disk space"
sudo rm -rf /Private/var/vm/sleepimage;ok
running "Create a zero-byte file instead"
sudo touch /Private/var/vm/sleepimage;ok
running "…and make sure it can’t be rewritten"
sudo chflags uchg /Private/var/vm/sleepimage;ok




# Other twiks

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true








