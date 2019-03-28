#!/bin/bash
set -eux

function sudoers() {
  echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant
}

function sshd() {
  echo "UseDNS no" >> /etc/ssh/sshd_config
}

function vagrant() {
  mkdir -p /home/vagrant/.ssh
  curl -fsSL "https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub" > /home/vagrant/.ssh/authorized_keys
  chmod 700 /home/vagrant/.ssh
  chmod 600 /home/vagrant/.ssh/authorized_keys
  chown -R vagrant /home/vagrant/.ssh
}

function virtualbox() {
  mkdir -p /tmp/VBoxGuestAdditions
  mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /tmp/VBoxGuestAdditions
  bash /tmp/VBoxGuestAdditions/VBoxLinuxAdditions.run || true
  umount /tmp/VBoxGuestAdditions
  rm -rf /tmp/VBoxGuestAdditions
  rm -f /home/vagrant/VBoxGuestAdditions.iso
}

function main() {
  sudoers
  sshd
  vagrant
  virtualbox
}

main "$@"
