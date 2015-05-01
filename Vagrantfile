# -*- mode: ruby -*-
# vi: set ft=ruby :

# Server Configuration
server_hostname  = "devine.dev"
server_ip        = "192.168.10.10"
server_timezone  = "UTC"

# Default web server document root
public_folder         = "/vagrant/htdocs"

Vagrant.configure("2") do |config|

  # Use the Trusty (14.04) box in 64 bit
  config.vm.box = "ubuntu/trusty64"

  # Configure hostname (for the bash prompt)
  config.vm.hostname = server_hostname

  # Configure networking
  config.vm.network :private_network, ip: server_ip
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Configure name (for virtualbox)
  config.vm.provider :virtualbox do |vb|
    vb.name = "Devine"
  end

end
