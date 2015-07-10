VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu-14.04"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8088

  config.vm.define "helloworld" do |hb|
  end

  config.vm.provider "virtualbox" do |box|
	box.name = "helloworld"
    box.memory = 2048
  end

  # Provision with shell script
  #config.vm.provision :shell, :path => "infrastructure/scripts/jdk8.sh"

  # Provision with puppet
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "infrastructure/puppet/manifests"
    puppet.manifest_file = "default.pp"
  end

end