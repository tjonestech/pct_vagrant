def nat(config)
    config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--nic2", "natnetwork", "--nat-network2", "test", "--nictype2", "virtio"]
    end
end

Vagrant.configure("2") do |config|
    nat(config)
    config.vm.box = "ubuntu/bionic64"
    config.vm.provision :shell, path: "bootstrap.sh"
end
