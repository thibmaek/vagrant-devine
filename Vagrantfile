# -*- mode: ruby -*-
# vi: set ft=ruby :

# Settings for downloading from fideloper/vaprobash
github_username = "fideloper"
github_repo     = "Vaprobash"
github_branch   = "1.3.1"
github_url      = "https://raw.githubusercontent.com/#{github_username}/#{github_repo}/#{github_branch}"

# Server Configuration
server_hostname  = "devine.dev"
server_ip        = "192.168.10.10"
server_timezone  = "UTC"

# Provision path
provision_path        = "./provision"

# Default web server document root
public_folder         = "/vagrant/htdocs"

# To install HHVM instead of PHP, set this to "true"
# http://hhvm.com
hhvm                  = "false"

# Database Configuration
mysql_root_password   = "root"
mysql_version         = "5.5"    # Options: 5.5 | 5.6
mysql_enable_remote   = "true"

# Languages and Packages
php_version           = "5.5"    # Options: 5.5 | 5.6
ruby_version          = "latest"
ruby_gems             = [
  "sass",
  #"compass",
  "bourbon",
  "neat",
]

# PHP Options
composer_packages     = [
  "slim/slim",
  "rych/phpass",
]

# Node Options
nodejs_version        = "0.10"   # Options: vX.X.X | latest
node_modules          = [
  "bower",
  "grunt",
  "gulp",
  "vtop",
  "yo",
]

# Frameworker options
framework             = "thane" # Options: thane | iamdevlopr


Vagrant.configure("2") do |config|

  # Use the Trusty (14.04) box in 64 bit
  config.vm.box = "ubuntu/trusty64"

  # Configure hostname (for the bash prompt)
  config.vm.hostname = server_hostname

  # Configure networking
  config.vm.network :private_network, ip: server_ip
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Configure folder-sharing
  config.vm.synced_folder ".", "/vagrant"

  # Configure name (for virtualbox)
  config.vm.provider :virtualbox do |vb|
    vb.name = "Devine"
  end


  ####
  # Base Items
  ##########

  # Provision Base Packages
  config.vm.provision "shell", path: "#{provision_path}/base.sh"

  # optimize base box
  config.vm.provision "shell", path: "#{provision_path}/base_box_optimizations.sh", privileged: true

  # Provision PHP
  config.vm.provision "shell", path: "#{provision_path}/php.sh", args: [hhvm, php_version]


  ####
  # Web Servers
  ##########

  # Provision Apache Base
  config.vm.provision "shell", path: "#{provision_path}/apache.sh", args: [server_ip, public_folder, server_hostname, github_url]


  ####
  # Databases
  ##########

  # Provision MySQL
  config.vm.provision "shell", path: "#{provision_path}/mysql.sh", args: [mysql_root_password, mysql_version, mysql_enable_remote]


  ####
  # Additional Languages
  ##########

  # Install Nodejs
  config.vm.provision "shell", path: "#{provision_path}/nodejs.sh", privileged: false, args: node_modules.unshift(nodejs_version, github_url)

  # Install Ruby (without RVM)
  config.vm.provision "shell", path: "#{provision_path}/ruby.sh", args: ruby_gems.join(" ")

  # Install Ruby (with RVM)
  #config.vm.provision "shell", path: "#{provision_path}/rvm.sh", privileged: false, args: ruby_gems.unshift(ruby_version)

  ####
  # Frameworks and Tooling
  ##########

  # Provision Composer
  config.vm.provision "shell", path: "#{provision_path}/composer.sh", privileged: false, args: composer_packages.join(" ")

  # Provision Laravel
  # config.vm.provision "shell", path: "#{github_url}/scripts/laravel.sh", privileged: false, args: [server_ip, laravel_root_folder, public_folder, laravel_version]

  # Provision Frameworker (a downloader for IAMDEVLOPR / Thane)
  # https://github.com/thibmaek for more info
  # config.vm.provision "shell", path: "#{provision_path}/frameworker.sh", priviliged: false, args: [framework]


  ####
  # Local Scripts
  # Any local scripts you may want to run post-provisioning.
  # Add these to the same directory as the Vagrantfile.
  ##########
  # config.vm.provision "shell", path: "./local-script.sh"

end
