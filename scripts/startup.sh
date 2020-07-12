#!/bin/bash

echo "Hello World"
#var=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/my-metadata -H "Metadata-Flavor: Google")
curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/serverIp -H "Metadata-Flavor: Google" >> /etc/serverip.txt
#installing ansible
sudo yum install ansible -y
sudo curl https://raw.githubusercontent.com/UrsysC/terraform-gcp-pihole-ha/master/ansible/playbook.yml -o /opt/playbook.yml
ansible-playbook /opt/playbook.yml
