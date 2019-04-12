## Installing Command Line Tools on Mac OS X

1. Launch the Terminal in the Applications/Utilities folder or on the Launchpad
2. Type the following command:

```
xcode-select --install
```

3. A software update popup window will appear. Click the "Install" button. Then agree to the Term of Service to proceed.

This will install the entire XCode development toolkit package to the following directory.
```
/Library/Developer/CommandLineTools/
```
4. Next, install the Homebrew package management system for Mac OS X
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

It will install the following script and directories:
```
==> This script will install:
/usr/local/bin/brew
/usr/local/share/doc/homebrew
/usr/local/share/man/man1/brew.1
/usr/local/share/zsh/site-functions/_brew
/usr/local/etc/bash_completion.d/brew
/usr/local/Homebrew
==> The following new directories will be created:
/usr/local/bin
/usr/local/etc
/usr/local/include
/usr/local/lib
/usr/local/sbin
/usr/local/share
/usr/local/var
/usr/local/opt
/usr/local/share/zsh
/usr/local/share/zsh/site-functions
/usr/local/var/homebrew
/usr/local/var/homebrew/linked
/usr/local/Cellar
/usr/local/Caskroom
/usr/local/Homebrew
/usr/local/Frameworks
```
5. Once Homebrew installed, you can now download this repo and run the brew command to install the rest of the tools specified in the Brewfile. Assume the workspace directory is already created.
```
cd ~/workspace
git clone https://github.com/openecs/bootcamp.git
cd bootscamp
brew bundle
```
Note for High Sierra 10.13 or above, VirtualBox installation will fail unless you allow loading new system extenstion(s) in System Preferences > Security & Privacy. Click the "Allow" button and reinstall with the following command.
```
brew cask install virtualbox
```

6. To verify the tools are installed, open the installed iIterm2 terminal application from Lauchpad and execute the following comand to spin up two virtual machines (VMs) in VirtualBox.
```
cd ~/workspace/bootcamp
vagrant up
```
From the Launchpad, open VirtualBox. You should see the two VMs, app01 and app02, are running.

7. You can connect to a running VM with this command, vagrant ssh <hostname>. For example
```
cd ~/workspace/bootcamp
vagrant ssh app01
```
8. To destroy the two VMs, execute this command inside iTerm2.
```
cd ~/workspace/bootcamp
vagrant destroy
```


## Installing Command Line Tools on Windows


