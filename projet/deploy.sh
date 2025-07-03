#!/bin/bash

echo "🔧 Lancement de Terraform..."
cd terraform
terraform apply -auto-approve > tf_output.log

# Extraire l'IP publique depuis les outputs Terraform
IP=$(terraform output -raw instance_public_ip)

echo "✅ IP récupérée depuis Terraform : $IP"

# Créer un fichier inventaire dynamique pour Ansible
cd ../ 
cd ansible
chmod 400 ~/.ssh/test.pem
touch hosts.ini || { echo "⛔ Impossible de créer ansible/hosts.ini"; exit 1; }
cat > hosts.ini <<EOF
[owncloud]
$IP ansible_user=admin ansible_ssh_private_key_file=~/.ssh/test.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "🚀 Lancement d'Ansible..."
ansible-playbook -i hosts.ini install.yml

