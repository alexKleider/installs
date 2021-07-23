###  RUN THIS WITH ROOT PRIVILEGES  ##

#Sat Aug 23 19:10:50 PDT 2014
#Installed Ubuntu v14.04
#Sat Apr  9 09:54:03 PDT 2016
#Reinstalled Ubuntu v14.04
#Fri Jun 17 16:44:55 PDT 2016
#Installed ubuntu-16.04-desktop-amd64 on x301.4
#Mon Jul  4 13:39:37 PDT 2016
#Installed xubuntu16.04 on x301-1
# enp0s25   HWaddr 00:22:68:0c:68:f9  
# wls1      HWaddr 00:1e:65:c6:1a:06  
# Fri Nov 16 17:10:59 PST 2018 "one" Ubuntu 18.04LTS installed



date && apt-get -y update && apt-get -y upgrade && date
# sudo apt install net-tools
sudo apt install iproute2
# The net-tools package is being deprecated in favor of iproute2
# https://wiki.ubuntu.com/LibreOffice
# sudo apt-get remove openoffice.org-core
# sudo apt autoremove
# sudo apt-get install libreoffice
# openoffice not installed on 18.04

apt install cups lpr
apt install wodim cdrkit-doc
apt-get -y install vim git git-doc vim-doc vim-scripts openssh-server msmtp
apt install curl tree
# bring in .ssh, .vim/, and .vimrc.
# .profile has my customized addendum setting EDITOR, jing,
# work and rng variables. It also runs (and therefore depends
# upon) my ~/bin/path.sh script which sets my PYTHONPATH variable.
# .bashrc is not modified by me (but is by bringing in node.js.)
# rsync comes by default so doesn't need to be installed.
# edit /etc/profile: export EDITOR=vim  (already done in ~/)
# ~/Notes/sysAdmin/Hosts/hosts.master
apt-get install -y screen arp-scan tofrodos flip inxi
apt-get install -y dnsutils   # Brings in dig.
apt-get install -y ucommon-utils  # Brings in mdsum
apt-get install -y tree  # list in tree output format
apt-get install -y w3m   # text base browser
apt-get install -y build-essential  # checkinstall no longer available
# brings in gcc, make, libtools, and other dev tools.
# required to build node.js  See below
apt-get install -y lynx-cur
# to provide for the following:
# lynx -dump http://linuxmafia.com/mailman/listinfo/sf-lug
# suggest piping the above into grep 'run by'

# also:
mkdir /usr/share/unicode && cd /usr/share/unicode
wget http://www.unicode.org/Public/UNIDATA/UnicodeData.txt
apt-get -y install unicode
apt-get -y install msmtp mutt
apt install acpi  # reports battery status (in greater detail than
# by the 'pwr' alias defined in ~/.bashrc:
# alias pwr="cat /sys/class/power_supply/BAT0/capacity")

apt-get -y install virtualenv  # Includes setuptools, wheel, etc.
# apt-get -y install python3-venv isn't available.
apt-get -y install ipython ipython3 python3-pip
apt-get -y install pylint
#http://stackoverflow.com/questions/10763440/how-to-install-python3-version-of-package-via-pip
#http://nvie.com/posts/pin-your-packages/

# If encounter a <package-name> package cannot be verified message:
# apt-key update            #| These commands
# apt-get update            #| fix the problem.

apt-get -y install docbook5-xml  # Depends: xml-core
#! docbook5-defguide   # Suggested but doesn't exist.
apt-get -y install libxml2-utils  # Provides xmllint for validation.
apt-get -y install docbook-xsl-ns  # Stylesheets for processing
                        # DocBook 5 XML to various output formats
apt-get -y install jing  # RELAX NG validator
# ...and possibly the following two:
apt-get -y install jing-trang-doc  # Jing Trang and dtdinst documentation
apt-get -y install libjing-java  # RELAX NG validator - library

apt-get -y install xmlto  # XML-to-any converter

# For servers:
# apt-get install apache2 postfix mutt ipset
# also will want a name server:
# Note: not sure about unbound- dnsmasq might be better.

# for pathagar see ~/olpcSF/phInfo
# git clone https://github.com/pathagarbooks/pathagar.git


#When changing computers and/or before swaping out hard drive:
#1. Make a note of the mac addresses of eth0 and wlan0 so can
#subsequently edit: /etc/udev/rules.d/70-persistent-net.rules 
#Fri Apr  8 22:24:06 PDT 2016
#eth0      Link encap:Ethernet  HWaddr 00:1c:25:9d:e1:f0  
#lo        Link encap:Local Loopback  
#          inet addr:127.0.0.1  Mask:255.0.0.0
#wlan0     Link encap:Ethernet  HWaddr 00:21:6b:a1:81:44  
#          inet addr:10.0.0.8  Bcast:10.0.0.255  Mask:255.255.255.0
#
# one:
#: enp0s25: link/ether 00:22:68:0c:68:f9 
#: wls1: link/ether 00:1e:65:c6:1a:06 



#Fri Jun 17 19:12:45 PDT 2016 ubuntu-16.04 ==> x301.4:
#enp0s25   Link encap:Ethernet  HWaddr 00:1c:25:9f:98:59  # eth0
#wls1      Link encap:Ethernet  HWaddr 00:22:fa:5f:83:3c  # wlan
#
#2. Back up to other media!!!
#
#Javascript:
#Sat Jun 18 13:20:03 PDT 2016 Several methods of installing js follow.
#The following might be prefered:
#http://blog.teamtreehouse.com/install-node-js-npm-linux
# apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

#Then add the following 3 lines to your .bashrc or .zshrc file:

#  export PATH="$HOME/.linuxbrew/bin:$PATH"
#  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
#
#$ brew update
#$ brew install node  # then wait!
#$ node -v
#$ npm -v
#$ brew upgrade node

#Should you ever want to:
#$ brew uninstall node
#
#Other methods I think I've used in the past:

##JavaScript
# apt-get install nodejs npm
# lsn -s /usr/bin/nodejs /usr/bin/node
#$ npm install prompt


#http://www.hostingadvice.com/how-to/install-nodejs-ubuntu-14-04/#node-version-manager
#    apt-get install build-essential checkinstall
#    apt-get install libssl-dev
#     curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
# => Cloning into ~/.nvm
# => Appending source string to ~/.bashrc
# => Close and reopen your terminal to start using nvm
#    command -v nvm
#    nvm install 5.0
#    nvm use 5.0
#    nvm alias default node


https://www.techrepublic.com/article/how-to-connect-a-linux-machine-to-google-cloud-print/
sudo add-apt-repository ppa:simon-cadman/niftyrepo

=============================================================================
from Mats Wichmann (on python tutor)


I have done it this way, assuming I don't want to replace the system
Python. This is a completely optional framework, but I've found it
useful.

One time only:
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# set up environment variables for use by pyenv,
# as noted in pyenv readme:
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

Any time I want to install a Python version:
$ pyenv rehash
$ pyenv install 3.7.0

Inside a project that wants to use 3.7.0:
$ pyenv local 3.7.0

To see what is available to install:
$ pyenv install list

To simplify creating virtualenvs, there is a pyenv-virtualenv plugin
described here:
https://github.com/pyenv/pyenv-virtualenv
