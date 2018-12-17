ENV["LC_ALL"] = "en_US.UTF-8"

def nat(config)
    config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--nic2", "natnetwork", "--nat-network2", "test", "--nictype2", "virtio"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
end

config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 1024
    v.cpus = 2
end

Vagrant.configure("2") do |config|
    nat(config)
    config.vm.box = "ubuntu/bionic64"
    config.vm.provision :shell, path: "bootstrap.sh"
end
