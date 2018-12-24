#!/bin/bash
set -eux

function update() {
  sed -i 's,jp.archive.ubuntu.com,ubuntutym.u-toyama.ac.jp,g' /etc/apt/sources.list

  apt-get update
  apt-get -y upgrade
  apt-get install -y curl linux-headers-$(uname -r) build-essential dkms openssh-server software-properties-common

  add-apt-repository -y ppa:ansible/ansible
  apt-get update
  apt-get install -y ansible
}

function sudoers() {
  echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant
}

function sshd() {
  echo "UseDNS no" >> /etc/ssh/sshd_config
}

function vagrant() {
  mkdir -p /home/vagrant/.ssh
  curl -fsSL "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub" > /home/vagrant/.ssh/authorized_keys
  chmod 700 /home/vagrant/.ssh
  chmod 600 /home/vagrant/.ssh/authorized_keys
  chown -R vagrant /home/vagrant/.ssh
}

function virtualbox() {
  mkdir /media/VBoxGuestAdditions
  mount -o loop,ro /home/vagrant/VBoxGuestAdditions.iso /media/VBoxGuestAdditions
  bash /media/VBoxGuestAdditions/VBoxLinuxAdditions.run || true
  umount /media/VBoxGuestAdditions
  rm -rf /media/VBoxGuestAdditions
  rm -f /home/vagrant/VBoxGuestAdditions.iso
}

function main() {
  update
  sudoers
  sshd
  vagrant
  virtualbox
}

main "$@"
