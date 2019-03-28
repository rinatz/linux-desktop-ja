#!/bin/bash
set -eux

function main() {
  yum install -y kernel-devel kernel-devel-$(uname -r) gcc binutils make perl bzip2
}

main "$@"
