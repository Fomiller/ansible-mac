# Ansible Macbook Setup

## Todos
- [x] Homebrew setup
- [x] Rust install 
- [x] Rust update
- [x] Install Cargo binaries
- [x] Go install (installed with homebrew, would like to find different method)
- [x] Go update to latest version
- [x] Python version setup (using pyenv)
- [x] Python virtualenvs setup
- [x] Clone all git repos
- [x] Terraform install (using homebrew)
- [x] Terraform update (using homebrew)
- [x] Terragrunt install (using homebrew)
- [x] Terragrunt update (using homebrew)
- [x] Docker install (using homebrew) 
- [x] Podman install (using homebrew)
- [x] Neovim install
- [ ] Neovim update (will need to get latest tags and parse through to find the latest)
- [x] Tmux install 
- [x] Dotfiles install
- [ ] App install (spotify, chrome, firefox, etc.)?
- [x] Git setup
- [x] Break apart ansible playbook into tasks

## Remote execute setup script
Checks for Homebrew and installs if necessary. Installs Ansible with Homebrew if necessary.
```
bash <(curl -s https://raw.githubusercontent.com/Fomiller/ansible-mac/main/scripts/setup.sh)
```

## Setup from nothing mac 
Set mac to show hidden files in finder
```
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder
```
Add user R/W permissions to .config dir if necessary
Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Install Ansible
```
brew install ansible
```
Clone Ansible playbook
```
git clone https://github.com/Fomiller/ansible-mac
```
Setup vault and become password files
```
echo <your vault pass> vault_pass.txt
echo <your become pass> become_pass.txt
```
