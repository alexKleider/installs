# File: source 1R.sh

# before sourcing this file, set user=<name_of_primary_user>

# Insert the carry over data thumb drive (also confusingly being
# referred to as "install"!) and have Root Mount and copy it:

mnt /dev/sdb1 /home/$user/Mnt
cp -pr /home/$user/Mnt/* /home/$user/Notes/
umount /dev/sdb1
# and now the thumb drive can be removed.

rsync -a --delete --exclude='.git' ~/Mnt/Installs ~/Notes
# the above does not require root privileges but no harm done

apt update && upgrade

apt install rsync vim vim-doc vim-scripts git git-doc openssh-server \
    msmtp tree arp-scan tofrodos dnsutils tree build-essential \
    unicode mutt virtualenv python3-pip pylint acpi cups lpr

mkdir /usr/share/unicode
cd /usr/share/unicode

wget http://www.unicode.org/Public/UNIDATA/UnicodeData.txt

