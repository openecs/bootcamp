#!/bin/bash

sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/openecs/bootcamp.git
cd bootcamp/playbooks
ansible-playbook --connection=local -i ops01, ops-console.yml