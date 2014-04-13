# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2")  do |config|

  # base information
  config.vm.box = "scarlettpi_v1"
  config.vm.box_url = "/Users/malcolm/dev/basebox-packer/virtualbox/ubuntu1204-desktop-provisionerless.box"

  # ssh config
  #config.ssh.username = "bossjones"
  #config.ssh.private_key_path = "~/.ssh/id_rsa_ssh"

  # name
  # CHANGME
  config.vm.hostname = "scarlettpidev"

  # networking
  config.vm.network "private_network", ip: "192.168.56.101"
  config.vm.network "forwarded_port", guest: 80, host: 8180
  config.vm.network "forwarded_port", guest: 443, host: 4443

  config.vm.boot_timeout = 800

  config.vm.synced_folder "salt/roots/", "/srv/"

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false

    # use host dns resolver
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--hostonlyadapter2", "vboxnet0"]
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "minion"
    salt.run_highstate = true
    salt.verbose = true
    salt.install_type = "stable"
  end

end
