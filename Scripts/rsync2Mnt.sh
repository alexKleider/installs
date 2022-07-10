# File: rsync2Mnt.sh

# no need for root privileges once the thumb drive is mounted
# This loads the (hopefully updated) info onto the thumb drive.

rsync -a --delete --exclude='.git' ~/Notes/Installs ~/Mnt
