image-builder
=============

Overview
--------

The purpose of image-builder is to automate the building of machine images.

Image-builder is also intended to help us better understand and test the image building process and technologies, and to act as a kickstarter for improving the development/deployment process.

The machine image building process is:
  1. define a machine image in a set of configuration files
  2. store and control the configuration files in a repository
  3. start the image-builder machine
  4. clone the configuration files from the repository
  5. run a script to build the machine image defined by the configuration files

Image-builder contains the image builder machine image configuration files.

Image-builder can build the image-builder machine image.

How to use image-builder
------------------------

### Prerequisites

  1. VirtualBox
  2. Vagrant
  3. internet connectivity
  4. the image-builder machine image base box

Since you'll be developing images, it is expected that you will also have a Git client, an SSH client, and a text editor.

#### Software versions successfully tested

| Date        | OS           | VirtualBox | Vagrant |
-----------------------------------------------------
| 06-Sep-2014 | OS X 10.9.4  | 4.3.14     | 1.6.3   |

### Recommended setup

Below are a set of steps which have been successfully used to prepare for running image-builder in VirtualBox.  These steps result in a directory named image-builder residing in your home directory on the host mache.  The image-builder directory will contain the image-builder base box and folders used for caching of files during the building of new images.

The initial steps vary, depending on whether an image-builder base box is available.  The preferred and simplest path is to use an existing image-builder base box.  Using an existing image-builder base box also provides the most consistent results.

#### Preferred option: use existing image-builder base box

If you have an existing image-builder.box or can obtain this file, use this option.  Otherwise use the alternative option.

  1. create a directory named 'image-builder' in your home directory
  2. change the current working directory to the image-builder directory created in the previous step
  3. create a directory named 'box' (in the image-builder directory)
  4. copy the image-builder base box into the box directory

#### Alternative option: build image-builder base box

Skip this alternative option if you already have the image-builder base box in the box directory.

Additional prerequisite: Packer

  1. in your home directory, execute the followng to create a directory named 'image-builder' and clone the latest version of image-builder code
```
git clone https://github.com/sutch/image-builder.git
```
  2. change the current working directory to the image-builder directory
  3. execute the following to build the image-builder base box (this step will likely take many minutes)
```
packer build image-builder.json
```
  4. when complete, it is recommended that all image-builder source code be removed, including the following (any changes to image-builder configuration should be done from within image-builder)
    * .git
    * .gitignore
    * http folder and its contents
    * image-builder.json
    * README.md
    * script folder and its contents


#### Complete readying the host machine

You should now have the image-builder base box in the box directory.

  1. execute the following to create a Vagrant configuration for the image-builder machine
```
vagrant init image-builder box/image-builder.box
```
  2. create a directory named 'dev' in the image-builder directory to manage your image development artifacts

### Using the image-builder image

The following should be executed in the image-builder directory of the host.

  * vagrant up -- to start the machine
  * vagrant ssh -- to SSH to the machine
  * vagrant halt -- to halt the machine
  * vagrant destroy -- to halt the machine and destroy all resources that were created during the machine creation process

How to modify an existing machine image
---------------------------------------

This section describes how to obtain and modify the image-builder image.

  1. on the host machine with VirtualBox running the image-builder machine
    1. change the working directory to the image-builder directory
    2. if the packer-cache directory does not exist, create it
    3. clone the image-builder configuration to the dev folder
```
git clone https://github.com/sutch/image-builder.git dev/image-builder
```
    4. run an image-builder machine and SSH to the machine
```
vagrant up
vagrant ssh
```

All work on the guest machine will take place from within the image-builder machine's /vagrant folder, which is shared with and accessible from the host's image-builder folder.

  2. change working directory to /vagrant/dev/image-builder
  3. create a soft link to enable caching to the host machine
```
ln -s /vagrant/packer_cache packer_cache
```

How to build a new machine image
--------------------------------

This section describes how to build the image-builder machine image when the image-builder machine image base box is not available.  This also describes how image-builder is built and how it builds machine images.

This process should take place from within an instance of the image-builder machine.

### Create the configuration files

Note: The steps for creating configuration files for another machine image is similar.

  1. create a directory to contain the configuration files; change working directory to this directory
  2. create a Packer template - [Packer Documentation: Templates](http://www.packer.io/docs/templates/introduction.html)
  3. create a directory named 'http' to contain content for Packer's HTTP server
  4. create a preconfiguration file in the HTTP server directory - [Ubuntu Community Help Wiki: InstallCDCustomization](https://help.ubuntu.com/community/InstallCDCustomization), [Ubuntu Documentation: Installing Ubuntu 14.04: Automating the installation using preseeding](https://help.ubuntu.com/14.04/installation-guide/amd64/apb.html)
  5. create a directory named 'script' for scripts
  6. create scripts in the scripts directory
  7. use git to manage; push to repo

### Generate the base box

  1. install VirtualBox
  2. install Vagrant
  3. install Packer
  4. obtain the machine's configuration (the image-builder configuration is available at [TBD: location])
  5. change working directory to [TBD]
  6. execute: packer (TBD: command syntax)

### Using the base box

The above steps result in the box directory containing the VirtualBox base box for image-builder.  The following shell commands should be available:
  * vagrant box add image-builder box/image-builder.box
  * vagrant init image-builder
  * vagrant up
  * vagrant ssh
  * vagrant halt

How to contribute to image-builder
----------------------------------

Always edit the image-builder code from within an image-builder machine instance.  Eating our own dogfood results in discovering issues earlier.

### Updating the configuration
  * git

### Updating this document
  * use Markdown [Wikipedia: Markdown](http://en.wikipedia.org/wiki/Markdown)
  * git

Todo
----

  * Add automatic clone from a git repo
  * Clean up docs
  * Add Nanoc
  * Enable web server for serving docs

Possible future enhancements
----------------------------

  * save images to shared directory on host OS
  * image-builder provides web interface to documentation
  * image-builder provides web interface for all functionality

Technologies used by image-builder
----------------------------------

  * [VirtualBox](https://www.virtualbox.org/) for running and building virtual machines
  * [Vagrant](https://www.vagrantup.com/) for managing machine instances running in VirtualBox
  * [Packer](http://www.packer.io/) for creating identical machine images for multiple platforms from configuration files
  * [Git](http://git-scm.com/) for version control
  * [Nanoc](http://nanoc.ws/) for generating documentation
