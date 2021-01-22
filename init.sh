#!/bin/bash
#
# run as root

set -xe

cat << EOF > /etc/apt/sources.list.d/ansible.list
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

apt update
apt install -y \
        ansible \
	python-apt \
	git \
        vim-nox

ansible-galaxy collection install ansible.posix
ansible-playbook configure.yml
