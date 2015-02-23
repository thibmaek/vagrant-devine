# What is it?
A Vagrant box for http://devine.be students created with [Vaprobash](http://fideloper.github.io/Vaprobash/index.html).  
Runs a Ubuntu (Trusty 64) base box and installs programs trough configurable provisioners.  
Everything is extremely modular and adjustable. If you're a Devine student you probably shouldn't need to change the provisioners or base box.

# Getting Started
1. Make sure [Vagrant](http://vagrantup.com) is installed correctly
2. Clone or download this repo
3. Run `vagrant up` to start downloading or importing the box.  
   This will also start provisioning the box, if you want to start without provisioning run `vagrant up --no-provision` instead.
4. Everything should be configured and ready for `vagrant ssh`
5. Visit `localhost:8080` or `192.168.10.10.xip.io` to view your projects in htdocs

## Configuring the Vagrantfile

### Vagrant Settings & Services
* `config.vm.box` Uses Atlas to download or import a corresponding box. **Defaults to the 14.04 (Trusty) Ubuntu release. This is the recommended box for development inside the devinebox.** Other boxes can always be configured but provisioning may differ on a different box
* `config.vm.network :method, :options` Defines networking methods for the box to use. **Defaults a portforward and private network method.** You can adjust the port to be forwarded and the port to be forwarded to, as well as the server_ip for the private network. The private network is not accessible to the local network (use `:public_network` instead)
* `config.vm.synced_folder` shares folders from the host to the guest vm. **The default is just a share from the Vagrantfile directory to `/vagrant` inside the box**
* `vb.name` a subsetting of `config.vm.provider` which currently only supports Virtualbox. This just prettifies the name for the box in Virtualbox (or other providers if specified)

### Variables
The Vagrantfile is largely built on variable usage to keep it modular and future-proof.  
Below is a list of easily configurable variables:
* `server_ip:` Adjustable IP for visiting in the browser. Since this is set to private it won't be visible on a local network to other computers. This needs to be kept in the range of *192.168.1.1 - 192.168.254.254*. **Defaults to 192.168.10.10**
* `provision_path:` The path where Vagrant looks for provisioning with the shell files. Adjust this only for development purposes.
* `public_folder:` The project folder where LAMP will look for. Default
* `mysql_root_password:` The password for the MySQL client. **Defaults to root** but can easily be adjusted to something else
* `mysql_enable_remote:` Enables remote access to the MySQL client. Default to true so you can access it from elsewhere
* `{program}_version:` Define a specific version for a program to be installed. Options are in the Vagrantfile  
**IMPORTANT: Installing Ruby without RVM doesn't take a version number as an argument but installs the latest ruby by default, and rubygems1.9**
* `ruby_gems, composer_packages, node_modules:` a list of packages to install with their corresponding package manager

## Provisioning
Provisioning is written in shell language and scripts can be added to the `provision_path` variable.  
Most provisioners are switched on by default, if you want to enable/disbale a provisioner just comment it in/out in the Vagrantfile.  
Optionally arguments can be passed to the provisioners.

#### Available provisioners:
* **Base**: Installs some basic settings and core apt packages before installing other components
* **PHP**: Installs PHP or HHVM (not recommended for Devine). A version from `php_version` can be passed to this to install a specific PHP version. There are some preset modules this installs (fpm, curl, mcrypt…) and it also turns extensive error reporting and debugging on.
* **Apache**: Installs latest stable apache2 with some useful presets. Apache uses vhost to configure subdomains and other DNS to the xip.io provider
* **MySQL**: Installs MySQL from the version passed trough. Optionally remote access can be enabled to control the client from anywhere.
* **Node & NPM**: Installs Node and NPM trough [nvm](https://github.com/creationix/nvm). Optionally a version can be passed trough, in case it isn't it defaults to latest. Preset for devine is the 0.10 version. To avoid installing modules with sudo the config path is set to `~/npm`. Modules can be passed trough from `node_modules` and will be installed in the config path. The most common modules are already in the variable.
* **Ruby**: There are two ways of provisioning for Ruby and RubyGems. To keep things simple it has been set to install without [RVM](https://rvm.io). This installs the latest Ruby and RubyGems 1.9. If you prefer to install Ruby with RVM just comment the current provisioner and comment out the provisioner with RVM.  
*Notice: There is an issue with installing compass from the `ruby_gems`. An issue has been created and will be fixed once I found a solution. For now just manually install compass with `sudo gem install compass`*
* **Composer**: Installs composer globally in `/usr/local/bin`. Global packages can be passed trough from the `composer_packages` variable. By default [phpass](https://github.com/rchouinard/phpass) and [slim](http://www.slimframework.com) are installed.
* **~~Laravel~~**: Since devine uses it's own framework ([see a fork here](https://github.com/gerbengeeraerts/IAMDEVLOPR)) this is disabled by default, but can be commented out at any time to be provisioned
* **Own additions**: You can provision your own scripts or packages or programs from a file `local-script.sh` in the Vagrantfile root.

## Disclaimer
Since I am just a devine student I am in no way officialy affiliated with the devine workflow or institution. This box is just a fun project I made and something I hope will help the other students in their development workflow. Also this was a great exercise for me to get to know Vagrant.

This is licensed under the MIT license and is largely based on Vaprobash. Thanks a lot to fideloper for this awesome repo.
