# ansible-playbook -i inventory —private-key=~/.vagrant.d/insecure_private_key -u vagrant playbook.yml —tags=”mytag”
# ansible-playbook -i ./provisioning/inventory -private-key=~/.vagrant.d/insecure_private_key -u vagrant ./provisioning/playbook.yml 
ansible-playbook -i ./provisioning/inventory --private-key=~/.vagrant.d/insecure_private_key --ssh-common-args '-o StrictHostKeyChecking=no' -u vagrant ./provisioning/testbook.yml

