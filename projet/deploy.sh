#!/bin/bash

echo "🚀 Lancement de Terraform..."
cd terraform
terraform apply -auto-approve > tf_output.log

# Récupérer les IPs
OWNCLOUD_IP=$(terraform output -raw owncloud_ip)
ONLYOFFICE_IP=$(terraform output -raw onlyoffice_ip)
cd ../

echo "📥 IP OwnCloud : $OWNCLOUD_IP"
echo "📥 IP OnlyOffice : $ONLYOFFICE_IP"

# Création dynamique de l'inventaire Ansible
chmod 400 ~/.ssh/test.pem || exit 1
cat > ansible/hosts.ini <<EOF
[owncloud]
$OWNCLOUD_IP ansible_user=admin ansible_ssh_private_key_file=~/.ssh/test.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[onlyoffice]
$ONLYOFFICE_IP ansible_user=admin ansible_ssh_private_key_file=~/.ssh/test.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "📦 Lancement de l'installation d'OnlyOffice..."
ansible-playbook -i ansible/hosts.ini ansible/install_onlyoffice.yml


echo "📦 Lancement de l'installation d'OwnCloud..."
ansible-playbook -i ansible/hosts.ini ansible/install.yml --extra-vars "onlyoffice_url=$ONLYOFFICE_IP"

