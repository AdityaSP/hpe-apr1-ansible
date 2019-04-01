# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#
#Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure("2") do |config|
  config.vm.boot_timeout = 500
  config.vm.define "ansnode1" do |ansnode1|
    ansnode1.vm.box = "bento/ubuntu-16.04"
    ansnode1.vm.network "private_network", ip: "192.168.90.2"
	ansnode1.vm.hostname = "ansnode1"
	ansnode1.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
	  vb.name = "ansnode1"
      vb.customize ["modifyvm", :id, "--cableconnected1", "on"]

    end
	ansnode1.vm.provision "shell", inline: <<-SHELL
      sudo echo "192.168.90.1 anscontrol" >> /etc/hosts
	  sudo echo "192.168.90.2 ansnode1" >> /etc/hosts
    SHELL
  end
#  config.vm.define "ansnode2" do |ansnode2|
#    ansnode2.vm.box = "bento/ubuntu-16.04"
#    ansnode2.vm.network "private_network", ip: "192.168.90.3"
#	ansnode2.vm.hostname = "ansnode2"
#	ansnode2.vm.provider "virtualbox" do |vb|
#      vb.memory = "1024"
#	  vb.name = "ansnode2"
#      vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
#
#    end
#	ansnode2.vm.provision "shell", inline: <<-SHELL
#      sudo echo "192.168.90.1 anscontrol" >> /etc/hosts
#	  sudo echo "192.168.90.2 ansnode1" >> /etc/hosts
#	  sudo echo "192.168.90.3 ansnode2" >> /etc/hosts
#    SHELL
#  end
  config.vm.define "anscontrol" do |anscontrol|
    anscontrol.vm.box = "bento/ubuntu-16.04"
    anscontrol.vm.network "private_network", ip: "192.168.90.1"
	anscontrol.vm.hostname = "anscontrol"
	anscontrol.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
	  vb.name = "anscontrol"
      vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
	anscontrol.vm.provision "shell", inline: <<-SUDOSHELL
      sudo echo "192.168.90.1 anscontrol" >> /etc/hosts
	  sudo echo "192.168.90.2 ansnode1" >> /etc/hosts
   	  sudo apt-get -y install sshpass
   	  sudo apt-get update
	  sudo apt-get -y install software-properties-common python-software-properties
      sudo apt-get update
      sudo apt-get -y install ansible
    SUDOSHELL
    
    anscontrol.vm.provision "shell", privileged: false, inline: <<-SHELL
	  ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	  echo "StrictHostKeyChecking no" >> ~/.ssh/config
	  sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@ansnode1
    SHELL
  end
  
end