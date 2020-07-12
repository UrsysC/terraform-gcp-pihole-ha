#!/bin/bash

echo "Hello World"
#var=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/my-metadata -H "Metadata-Flavor: Google")
echo "check metadata download"
sudo curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/serverIp -H "Metadata-Flavor: Google" >> /opt/serverip.txt
#installing ansible
echo "install epel-release"
sudo yum -y install epel-release
echo "install ansible"
sudo yum -y install ansible 
echo "downloads playbook"
sudo curl https://raw.githubusercontent.com/UrsysC/terraform-gcp-pihole-ha/master/ansible/playbook.yml -o /opt/playbook.yml
echo "run playbook"
ansible-playbook /opt/playbook.yml
