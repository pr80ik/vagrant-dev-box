#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# install needed packages for ansible
apt-get install -y -q ansible

cd /vagrant/provisioning/ansible/
ansible-playbook -i "localhost," -c local vagrant-playbook.yml

exit 0
