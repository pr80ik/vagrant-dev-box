A template for Vagrant Box for local developement.

contains
--------
  * Ubuntu vm
  * Provisioned via Ansible
    * nginx
    * redis-server
    * postgresql
    * go-lang

Install Vagrant, VirtualBox, Ansible locally then then `vagrant up` to setup the VirtualBox. Run `vagrant ssh` to remote into the VirtualBox.
