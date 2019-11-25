# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 st=2 et :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.box_check_update = false


  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  end

  # Configure 'master'
  config.vm.define 'control' do |machine|
    machine.vm.provider "virtualbox" do |vb|
      vb.gui = false                                                            # No GUI
      vb.memory = "2048"                                                        # Give some RAM
      vb.cpus = 2                                                               # Give some CPU
    end

    machine.vm.hostname = "control"
    machine.vm.network "private_network", ip: "192.168.50.200"

    machine.vm.network "forwarded_port", guest: 80, host: 80                    # HTTP
    machine.vm.network "forwarded_port", guest: 5000, host: 5000                # Future Use
    machine.vm.network "forwarded_port", guest: 8080, host: 8080                # Future Use

    machine.vm.synced_folder ".", "/vagrant", disabled: true                    # Disable default folder syncing
    machine.vm.synced_folder "provision/files/control", "/provision-files", type: "rsync"  # Sync the contents of sync-master to /provision-files

    # Provisioning
    machine.vm.provision "shell", path: "provision/scripts/install-base-package.sh"
    machine.vm.provision "shell", path: "provision/scripts/install-ansible.sh"
    machine.vm.provision "shell", path: "provision/scripts/install-ssh-key.sh", env: {"KEY_NAME" => "github", "USER" => "vagarant"}
    machine.vm.provision "shell", path: "provision/scripts/install-ssh-key.sh", env: {"KEY_NAME" => "ansible", "USER" => "vagarant"}
    machine.vm.provision "shell", path: "provision/scripts/install-authorize-ssh-key.sh", env: {"KEY_NAME" => "ansible", "USER" => "root"}
    machine.vm.provision "shell", path: "provision/scripts/copy-files.sh", env: {"SRC" => "ansible", "DEST" => "ansible", "USER" => "vagrant", "USE_HOME" => true}
    machine.vm.provision "shell", path: "provision/scripts/copy-files.sh", env: {"SRC" => "src", "DEST" => "src", "USER" => "vagrant", "USE_HOME" => true}
    machine.vm.provision "shell", path: "provision/scripts/install-hosts.sh"
  end

  # Configure cluster nodes server0 ... server3
  # 3.times do |id|
  #   config.vm.define "server#{id}.infra" do |machine|
  #     machine.vm.provider "virtualbox" do |vb|
  #       vb.gui = false                                                          # No GUI
  #       vb.memory = "1024"                                                      # Give less RAM
  #       vb.cpus = 1                                                             # Give less CPU
  #     end
  #
  #     machine.vm.hostname = "server#{id}.infra"
  #     machine.vm.network "private_network", ip: "192.168.50.#{100+id}"
  #
  #     # Provisioning
  #     machine.vm.synced_folder ".", "/vagrant", disabled: true                    # Disable default folder syncing
  #     machine.vm.synced_folder "provision/files/server", "/provision-files", type: "rsync"  # Sync the contents of sync-master to /provision-files
  #
  #     # Provisioning
  #     machine.vm.provision "shell", path: "provision/scripts/install-base-package.sh"
  #     machine.vm.provision "shell", path: "provision/scripts/install-authorize-ssh-key.sh", env: {"KEY_NAME" => "ansible", "USER" => "root"}
  #     machine.vm.provision "shell", path: "provision/scripts/install-hosts.sh"
  #   end
  # end
end
