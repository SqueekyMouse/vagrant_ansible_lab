# Vagrant scripts for Ansible lab
To deploy Ansible lab virtual machines with Virtualbox

## SSH access
Currently uses private network with VM ssh port forwarded to localhost, so can ssh from host to virtual machines.

eg. for AnsibleController:\
ssh sree@192.168.56.30 -p 2720

The port, VM name etc. are set in the Vagrant file.

Sample ssh config file is given in res/config. Once its placed in \<home\>/.ssh/ , can ssh by given name, ie.\
ssh ansible-controller

For passwordless ssh, ie host-key-based ssh authentication, use ssh-copy command to copy local user key to virtualmachines.

Ofcourse can directly ssh to virtual machines with
vagrant ssh <target>

## Vagrant commands list
vagrant up\
vagrant status\
vagrant ssh <target>\
vagrant halt\
vagrant destroy\
vagrant snapshot list\
vagrant snapshot save \
vagrant snapshot save \<target\>\
vagrant snapshot restore \
vagrant snapshot restore \<target\>

To restore only target nodes:\
for i in 1 2; do vagrant snapshot restore AnsibleTarget0$i \<snapshot_name\>; done