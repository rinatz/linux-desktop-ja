# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-14.04"

  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", 4096]
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--vram", "256"]
    vb.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
    vb.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    if [ "$(lsb_release -sc)" == "xenial" ]; then
      rm -f /etc/apt/apt.conf.d/10periodic
    fi
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbooks/site.yml"
    ansible.compatibility_mode = "2.0"
  end
end
