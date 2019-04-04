Vagrant.configure("2") do |config|
  config.vm.network "private_network", :type => 'dhcp'
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.box_check_update = false
  config.vbguest.auto_update = false
  config.vagrant.plugins = ["vagrant-hostmanager", "vagrant-vbguest"]

  config.trigger.before [:up, :provision] do |trigger|
    trigger.info = "Create host SSH key if it is not exist..."
    trigger.run = {path: "./scripts/create-ssh-keys.sh"}
  end

  config.vm.define "app01" do |app01|
    app01.vm.box = "ubuntu/xenial64"
    app01.vm.hostname = "app01"
    #app01.vm.network "forwarded_port", guest: 80, host: 8080

    app01.vm.provider "virtualbox" do |v|
      v.name = "#{app01.vm.hostname}"
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision "file", 
      source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

    config.vm.provision "shell",
      inline: "grep -F '# My SSH Key' /home/vagrant/.ssh/authorized_keys || (echo '# My SSH Key' >> /home/vagrant/.ssh/authorized_keys && cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys)"      
  
    app01.trigger.before [:destroy] do |trigger|
      trigger.info = "Remove VM from known_hosts..."
      trigger.run = {inline: "ssh-keygen -R #{app01.vm.hostname}"}
    end
  end

  config.vm.define "app02" do |app02|
    app02.vm.box = "centos/7"
    config.vm.box_version = "1804.02"
    app02.vm.hostname = "app02"

    app02.vm.provider "virtualbox" do |v|
      v.name = "#{app02.vm.hostname}"
      v.memory = 1024
      v.cpus = 1
    end
    config.vm.provision "file", 
      source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

    config.vm.provision "shell",
      path: "scripts/copy-ssh-keys.sh"

    app02.trigger.before [:destroy] do |trigger|
      trigger.info = "Remove VM from known_hosts..."
      trigger.run = {inline: "ssh-keygen -R #{app02.vm.hostname}"}
    end    
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    `vagrant ssh #{vm.name} -c "hostname -I"`.split()[1]
  end
end
