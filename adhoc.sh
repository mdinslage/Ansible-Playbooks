#!/bin/bash

ansible all -u root --connection-password-file password -m user -a 'name=ansible state=present shell=/bin/bash'
ansible all -u root --connection-password-file password -m authorized_key -a 'user=ansible key={{ lookup("file", "/home/ansible/.ssh/id_ed25519.pub") }}'
ansible all -u root --connection-password-file password -m copy -a 'content="ansible ALL=(ALL) NOPASSWD:ALL" dest=/etc/sudoers.d/ansible'
