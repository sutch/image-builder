image-builder
=============

Overview
--------

The purpose of image-builder is to automate the building of machine images.

The secondary uses of image-builder is better understand and test this process and the technologies, and to act as a kickstarter for improving the development/deployment processes.

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

The simplest way to use image-builder (and to obtain the most consistent results) is to run an image-builder machine.

### Prerequisites
  1. VirtualBox
  2. Vagrant (optional, but recommended)
  3. the image-builder machine image base box
  4. internet connectivity

### Steps to run the image

Note: These steps assume that Vagrant is installed.

  1. place the image-builder machine image base box (TBD: provide location on filesystem and/or syntax for adding to Vagrant)
  2. create a Vagrant configuration file (TBD: command syntax)
  3. execute: vagrant up
  4. execute: vagrant ssh

### Steps to generate a machine image

  1. get the configuration for a machine
  5. change directory to the configuration
  6. execute: packer (TBD: command syntax; similar to 'packer build image-builder.json')

### Using the machine image

Assuming the above steps successfully built an image, they should result in the box folder containing a base box.  The following shell commands should be available:
  * vagrant box add [vagrant name] box/[base box name].box
  * vagrant init [vagrant name]
  * vagrant up
  * vagrant ssh
  * vagrant halt

How to build the image-builder machine image
--------------------------------------------

This describes how to build the image builder machine image when the image-builder machine image base box is not available.  This also describes how image-builder is built and how it builds machine images.

### Create the configuration files

Note: The steps for creating configuration files for another machine image is similar.

  1. create a folder to contain the configuration files; change working directory to this folder
  2. create a Packer template - [Packer Documentation: Templates](http://www.packer.io/docs/templates/introduction.html)
  3. create a folder named 'http' to contain content for Packer's HTTP server
  4. create a preconfiguration file in the HTTP server folder - [Ubuntu Community Help Wiki: InstallCDCustomization](https://help.ubuntu.com/community/InstallCDCustomization), [Ubuntu Documentation: Installing Ubuntu 14.04: Automating the installation using preseeding](https://help.ubuntu.com/14.04/installation-guide/amd64/apb.html)
  5. create a folder named 'script' for scripts
  6. create scripts in the scripts folder
  7. use git to manage; push to repo

### Generate the base box

  1. install VirtualBox
  2. install Vagrant
  3. install Packer
  4. obtain the machine's configuration (the image-builder configuration is available at [TBD: location])
  5. change working directory to [TBD]
  6. execute: packer (TBD: command syntax)

### Using the base box

The above steps result in the box folder containing the VirtualBox base box for image-builder.  The following shell commands should be available:
  * vagrant box add image-builder box/image-builder.box
  * vagrant init image-builder
  * vagrant up
  * vagrant ssh
  * vagrant halt

How to contribute to image-builder
----------------------------------

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

  * save images to shared folder on host OS
  * image-builder provides web interface to documentation
  * image-builder provides web interface for all functionality

Technologies used by image-builder
----------------------------------

  * [VirtualBox](https://www.virtualbox.org/) for running and building virtual machines
  * [Vagrant](https://www.vagrantup.com/) for managing machine instances running in VirtualBox
  * [Packer](http://www.packer.io/) for creating identical machine images for multiple platforms from configuration files
  * [Git](http://git-scm.com/) for version control
  * [Nanoc](http://nanoc.ws/) for generating documentation
