
# 🛠️ Guide d'installation OwnCloud avec ONLYOFFICE sur Amazon Linux 2 (EC2)


## 🔐 1. Connexion à l'instance

```bash
ssh -i vockey.pem ec2-user@<IP_PUBLIC_EC2>
```

---

## 🔧 2. Mise à jour et installation des paquets

```bash
sudo yum update -y
sudo yum install -y epel-release wget unzip nano
```

---

## 🧱 3. Installer Apache, MariaDB, PHP et modules nécessaires

```bash
sudo yum install -y httpd mariadb-server

# Activer PHP 7.4
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install -y php php-mysqlnd php-gd php-dom php-mbstring php-intl php-xml php-zip php-pdo php-json php-curl php-process
```

---

## ⚙️ 4. Démarrer et activer Apache et MariaDB

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

---

## 🔐 5. Sécuriser MariaDB et créer la base de données

```bash
sudo mysql_secure_installation
```

Puis :

```bash
sudo mysql -u root -p
```

```sql
CREATE DATABASE owncloud;
CREATE USER 'ownclouduser'@'localhost' IDENTIFIED BY 'passwordfortdb';
GRANT ALL PRIVILEGES ON owncloud.* TO 'ownclouduser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

---

## 📥 6. Télécharger et installer OwnCloud

```bash
cd /var/www/html
wget https://download.owncloud.com/server/stable/owncloud-complete-latest.tar.bz2
tar -xvjf owncloud-complete-latest.tar.bz2
sudo rm owncloud-complete-latest.tar.bz2
```

---

## 🔐 7. Permissions

```bash
sudo chown -R apache:apache /var/www/html/owncloud
sudo chmod -R 755 /var/www/html/owncloud
```

---

## 🌐 8. Accéder à l’interface Web

Dans un navigateur :

```
http://<IP_PUBLIC_EC2>/owncloud
```

- Créer un admin
- Renseigner :
  - **Dossier des données** : `/var/www/html/owncloud/data`
  - **Base de données** : `owncloud`
  - **Utilisateur** : `ownclouduser`
  - **Mot de passe** : `passwordfortdb`
  - **Hôte** : `localhost`

---

## 🧩 9. Installer l’intégration ONLYOFFICE

### 📥 Télécharger l’application

```bash
cd /var/www/html/owncloud/apps
sudo wget "https://marketplace-storage.owncloud.com/apps/onlyoffice-9.9.1.tar.gz?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=HPRNVWVQLWXJRKK4TWHT%2F20250630%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250630T151601Z&X-Amz-SignedHeaders=host&X-Amz-Expires=1200&X-Amz-Signature=4ae5d748fc9055712fd6d9efa2d0afcdf8d7b8c5e3eb2bf2133e144147d9ec38" -O onlyoffice.tar.gz
sudo tar -xvzf onlyoffice.tar.gz
sudo rm onlyoffice.tar.gz
```

### 🔐 Donner les permissions

```bash
sudo chown -R apache:apache /var/www/html/owncloud/apps/onlyoffice
```

---

## ✅ 10. Activer l’application ONLYOFFICE

```bash
cd /var/www/html/owncloud
sudo -u apache php occ app:enable onlyoffice
```

✅ Si `posix` est requis :

```bash
sudo yum install -y php-process
sudo systemctl restart httpd
```

## 🎉 Résultat

OwnCloud est installé et prêt à être connecté à un serveur OnlyOffice pour édition collaborative.
