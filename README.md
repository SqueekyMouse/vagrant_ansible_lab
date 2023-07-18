# Vagrant scripts for Ansible lab
To deploy Ansible lab virtual machines with Virtualbox

## SSH access
Currently uses private network with ssh ip forwarded to localhost, so can ssh from host to vms with:

eg. for AnsibleController:
ssh sree@192.168.56.30 -p 2720

Ofcourse can directly ssh to VM's with
vagrant ssh <target>

## Vagrant commands list
vagrant up
vagrant status
vagrant ssh <target>
vagrant halt
vagrant destroy
vagrant snapshot list
vagrant snapshot save <>

for i in 1 2;do vagrant snapshot restore AnsibleTarget0$i system_ready_01;done