# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

# Define the number of master and worker nodes
# If this number is changed, remember to update setup-hosts.sh script with the new hosts IP details in /etc/hosts of each VM.

# These vars are not used as of now!!
IP_NW = "192.168.56."
REDHAT_IP_START = 40
UBUNTU_IP_START = 35
DEBIAN_IP_START = 30

REDHAT_BOX="centos/7"
# REDHAT_BOX="rockylinux/8"
UBUNTU_BOX="ubuntu/bionic64"
DEBIAN_BOX="debian/bullseye64"
# DEBIAN_BOX="debian/jessie64"

# Customized machine delais in the list below!!
servers = [
  { :hostname => "AnsibleController", :ip => "192.168.56.30", :memory => "1024", :box => "#{DEBIAN_BOX}", :cpu => 1, :ssh_port => 2720 },
  { :hostname => "AnsibleTarget01", :ip => "192.168.56.31", :memory => "1024", :box => "#{DEBIAN_BOX}", :cpu => 1, :ssh_port => 2721 },
  { :hostname => "AnsibleTarget02", :ip => "192.168.56.32", :memory => "1024", :box => "#{DEBIAN_BOX}", :cpu => 1, :ssh_port => 2722 },
]

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"
#   config.vm.box = "ubuntu/bionic64"
#   config.vm.box = "rockylinux/8"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Provision Nodes in Servers config!!
  servers.each do |conf|
    config.vm.define conf[:hostname] do |node|
      # Name shown in the GUI
      node.vm.box = conf[:box]
      node.vm.provider "virtualbox" do |vb|
        vb.name = conf[:hostname]
        vb.memory = conf[:memory]
        vb.cpus = conf[:cpu]
      end
      node.vm.hostname = conf[:hostname]
      node.vm.network :private_network, ip: conf[:ip]
      node.vm.network "forwarded_port", guest: 22, host: conf[:ssh_port]
      # todo: bridge network with internal ip specified in config!!

      # todo: os specific shell script execution with if os_box condition!!
      # todo: combile shell scripts into one!!
      node.vm.provision "setup-dns", type: "shell", :path => "update-dns.sh"
      node.vm.provision "setup-repo", type: "shell", :path => "pkgs_deb.sh"
      node.vm.provision "add-sudo-user", type: "shell", :path => "bootstrap_deb.sh"
    end
  end
end
