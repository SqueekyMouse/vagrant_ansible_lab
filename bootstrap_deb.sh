#!/bin/sh

# to remove su in debin???
sed -e 's/#auth.*required pam_wheel.so.*/auth   required pam_wheel.so/g' -i /etc/pam.d/su

# add user, group and set sudo access
# no wheel by default in  in debin, add wheel group and set in sudoers
groupadd wheel
useradd  -mG wheel sree -s /bin/bash
echo "sree:sreetest123" | chpasswd # debin specific!!

echo "%wheel\tALL=(ALL)\tNOPASSWD: ALL" >> /etc/sudoers

# enable plain text ssh password!!
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service sshd restart