# Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#
# Usage:
# brew bundle [--file=Brewfile]
# brew outdated
# brew upgrade
# brew cleanup [package]
# 

######## 
# add third-party repositories
# 
tap 'caskroom/cask'
tap 'caskroom/versions'
tap 'homebrew/services'
tap 'pivotal/tap'

########
# install cli and tools
# use 'brew info <tool>' to check the available version to install.  
#
brew 'ansible'
brew 'awscli'
brew 'terraform'
brew 'kubernetes-cli'

########
# install apps
# to check the available tab version 'brew search <app>'
#
cask 'iterm2'
#Oracle Java 8 will no longer available
#cask 'caskroom/versions/java8'
#cask 'java8'
cask 'java11'

cask 'virtualbox'
cask 'vagrant'
cask 'vagrant-manager'
cask 'docker'
cask 'textmate'
cask 'visual-studio-code'
cask 'postman'
# need to remove binary if not install with brew
# https://kubernetes.io/docs/tasks/tools/install-minikube/#install-minikube
cask 'minikube'

########
# depends on java
brew 'gradle'
brew 'springboot'
brew 'maven'

