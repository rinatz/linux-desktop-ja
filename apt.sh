#!/bin/bash
set -eux

function main() {
  sed -i 's,http://\(.*\.\)\?archive.ubuntu.com,http://jp.archive.ubuntu.com,g' /etc/apt/sources.list
  apt-get update
  apt-get install -y linux-headers-$(uname -r) build-essential dkms openssh-server curl
}

main "$@"
