# ☁️ Projet Cloud - Déploiement de Owncloud avec OnlyOffice sur AWS

## 🧾 Synopsis

Ce projet a pour objectif de mettre en place une **infrastructure cloud**, reposant sur **Owncloud** et son module collaboratif **OnlyOffice**, déployée automatiquement dans AWS.

L’approche "Infrastructure as Code" est utilisée pour automatiser :

- **La création de l’infrastructure** (machines virtuelles, réseau, sécurité) avec **Terraform**
- **La configuration du serveur** (installation, déploiement d’applications, sécurisation) avec **Ansible**

Le service ainsi déployé doit permettre à un utilisateur :
- De stocker et partager des fichiers depuis un navigateur ou une application mobile
- D’éditer des documents en ligne via OnlyOffice

Un **load balancer** et un second serveur Owncloud peuvent être ajoutés pour la **haute disponibilité**.

Ce projet illustre un cas concret de déploiement automatisé d'une application cloud open-source sur AWS, avec une attention portée à la portabilité, la sécurité, et l’expérience utilisateur.

---

## ✅ Fonctionnalités principales

- 🌩️ Déploiement d’un serveur Owncloud sur AWS
- 🧩 Intégration du module d’édition OnlyOffice
- 🔐 Accès sécurisé via HTTPS avec Let’s Encrypt
- 📱 Connexion depuis l’application mobile Owncloud
- ⚙️ Automatisation complète avec Terraform + Ansible
- ♻️ (Optionnel) Mise en place d’une architecture redondante

---

## 🛠️ Technologies utilisées

| Outil       | Utilisation principale                    |
|-------------|--------------------------------------------|
| **Terraform** | Création de l’infrastructure AWS         |
| **Ansible**   | Configuration logicielle du serveur      |
| **Docker**    | Déploiement de Owncloud & OnlyOffice    |
| **Nginx**     | Reverse proxy et gestion du SSL          |
| **Let’s Encrypt** | Certificat SSL gratuit via Certbot |
| **Owncloud** | Plateforme de cloud personnel            |
| **OnlyOffice**| Éditeur de documents en ligne            |

---

## Comment déployer le projet

### Prérequis  
Avoir **Ansible** et **Terraform** installés sur la machine.

### Étapes de déploiement

1. Extraire l'archive du projet dans un dossier de votre choix.

2. Configurer AWS (ou tout autre provider cloud) avec la commande suivante :
   ```bash
   aws configure
   ```
   Cette commande vous demandera vos identifiants et la région.

3. Modifier le fichier `provider.tf` pour y renseigner :
   - la bonne région,
   - le provider que vous utilisez (AWS, Azure, etc.).

4. Installer les collections nécessaires avec les commandes suivantes :
   ```bash
   ansible-galaxy collection install community.mysql
   ansible-galaxy collection install community.docker
   ```

5. Exécuter le script de déploiement :
   ```bash
   ./deploy.sh
   ```

⚠️ **Important :** Veillez à bien respecter l’architecture des dossiers telle qu’elle est définie dans le dépôt GitHub.


---


## 📌 Réalisé par

> 🧑‍🎓 Master 1 InfraCloud Aix
> 👤 Trigramme : **Maxime Obry** et **Thomas Quadro**



