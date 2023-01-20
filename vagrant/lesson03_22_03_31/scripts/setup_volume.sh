#!/bin/bash

# installing lvm
sudo yum -y install lvm2

# create physical volume
sudo pvcreate /dev/sdb
# create volume group
sudo vgcreate tms /dev/sdb
# create logical volume
sudo lvcreate -l+80%FREE -n test tms
# create filesystem
sudo mkfs.ext4 /dev/tms/test
# mounting
sudo mkdir /mnt/data
sudo mount /dev/tms/test /mnt/data/
sudo chown -R vagrant:vagrant /mnt/data/
