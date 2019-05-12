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

  config.vm.define "dev01" do |dev01|
    dev01.vm.box = "ubuntu/xenial64"
    dev01.vm.hostname = "dev01"
    #dev01.vm.network "forwarded_port", guest: 80, host: 8080

    dev01.vm.provider "virtualbox" do |v|
      v.name = "#{dev01.vm.hostname}"
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision "file", 
      source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

    config.vm.provision "shell",
      inline: "grep -F '# My SSH Key' /home/vagrant/.ssh/authorized_keys || (echo '# My SSH Key' >> /home/vagrant/.ssh/authorized_keys && cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys)"      
  
    dev01.trigger.before [:destroy] do |trigger|
      trigger.info = "Remove VM from known_hosts..."
      trigger.run = {inline: "ssh-keygen -R #{dev01.vm.hostname}"}
    end
  end

  config.vm.define "dev02" do |dev02|
    dev02.vm.box = "centos/7"
    dev02.vm.hostname = "dev02"

    dev02.vm.provider "virtualbox" do |v|
      v.name = "#{dev02.vm.hostname}"
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision "file", 
      source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

    config.vm.provision "shell",
      path: "scripts/copy-ssh-keys.sh"

    dev02.trigger.before [:destroy] do |trigger|
      trigger.info = "Remove VM from known_hosts..."
      trigger.run = {inline: "ssh-keygen -R #{dev02.vm.hostname}"}
    end
  end

  config.vm.define "ops01" do |ops01|
    ops01.vm.box = "ubuntu/xenial64"
    #ops01.vm.box = "centos/7"
    ops01.vm.hostname = "ops01"

    ops01.vm.provider "virtualbox" do |v|
      v.name = "#{ops01.vm.hostname}"
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision "file", 
      source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

    config.vm.provision "file", 
      source: "~/.ssh/id_rsa", destination: "~/.ssh/id_rsa"

    config.vm.provision "shell",
      path: "scripts/copy-ssh-keys.sh"
    
    ops01.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/ops-console.yml"
    end    

    ops01.trigger.before [:destroy] do |trigger|
      trigger.info = "Remove VM from known_hosts..."
      trigger.run = {inline: "ssh-keygen -R #{ops01.vm.hostname}"}
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
