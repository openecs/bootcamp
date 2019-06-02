#!/bin/bash

# RHEL 7
# subscription-manager repos --enable rhel-7-server-ansible-2.6-rpms

# CentOS 7
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum update
yum install -y git ansible

mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/openecs/bootcamp.git
cd bootcamp/playbooks
ansible-playbook --connection=local -i localhost, ops-console.yml
