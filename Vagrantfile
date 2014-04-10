# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "scarlettpidev" do |saltnode|

    saltnode.vm.box = "scarlettpi_v1"
    saltnode.vm.box_url = /Users/malcolm/dev/basebox-packer/virtualbox/ubuntu1204-desktop-provisionerless.box
    saltnode.vm.share_folder "salt_file_root", "/srv/salt", Dir.pwd
    saltnode.vm.share_folder "salt_pillar_root", "/srv/pillar", Dir.pwd + "/pillar/" 

    saltnode.vm.hostname = scarlettpidev
    saltnode.vm.network "private_network", ip: "192.168.58.102"
    saltnode.vm.forward_port 80, 8000
    saltnode.vm.forward_port 22, 3022

    saltnode.vm.provision :salt do |salt|
      salt.minion_config = Dir.pwd + "/minion.conf"
      salt.run_highstate = true
      salt.install_type = "stable"
    end    

  end

  config.vm.provider :virtualbox do |vb|

    # Don't boot with headless mode
    vb.gui = false

    # use host dns resolver
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

end
