#!/bin/bash

SSH_KEY="id_rsa"

if [ ! -f ~/.ssh/${SSH_KEY} ] && [ ! -f ~/.ssh/${SSH_KEY}.pub ]; then
  echo "Create SSH key ~/.ssh/${SSH_KEY}"
  ssh-keygen -t rsa -b 2048 -C "${USER}" -N "" -f ~/.ssh/${SSH_KEY}
fi

# Create the vagrant sync folder
mkdir -p ~/workspace/vagrant