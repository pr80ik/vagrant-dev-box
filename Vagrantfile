# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "vagrant-dev" do |c|

    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    # Every Vagrant virtual environment requires a box to build off of.
    c.vm.box = "ubuntu/trusty64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    # config.vm.box_url = "http://domain.com/path/to/above.box"

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    c.vm.network :forwarded_port, guest: 80,  host: 8080, id: "http"
    c.vm.network :forwarded_port, guest: 443, host: 8443, id: "https"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    c.vm.network :private_network, ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network :public_network

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    # config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    c.vm.synced_folder "../data", "/vagrant_data/"
    c.vm.synced_folder "./", "/vagrant/"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    c.vm.provider :virtualbox do |vb|
      # Don't boot with headless mode
      # vb.gui = true

      # Use VBoxManage to customize the VM. For example to change memory:
      vb.customize ["modifyvm", :id, "--memory", "1024"]

      # Give the VBox a name
      vb.customize ["modifyvm", :id, "--name", "vagrant-dev"]
    end

    #
    # View the documentation for the provider you're using for more
    # information on available options.

    # setup the vm through the setup.sh shell script
    c.vm.provision "shell", path: "provisioning/shell/setup.sh"

    # setup the vm through the Ansible playbook.
    # see https://docs.ansible.com/ansible/playbooks.html
    # not supported well on Windows
    #
    #c.vm.provision "ansible" do |ansible|
    #  ansible.playbook = "./provisioning/ansible/vagrant-playbook.yml"
    #  ansible.groups = { "vagrant-servers" => ["vagrant-dev"] }
    #  ansible.extra_vars = { ansible_ssh_user: "vagrant" }
    #  ansible.sudo = true
    #end
  end
end
