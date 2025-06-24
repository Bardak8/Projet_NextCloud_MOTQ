# ☁️ Projet Cloud - Déploiement de Nextcloud avec OnlyOffice sur AWS

## 🧾 Synopsis

Ce projet a pour objectif de mettre en place une **infrastructure cloud**, reposant sur **Nextcloud** et son module collaboratif **OnlyOffice**, déployée automatiquement dans AWS.

L’approche "Infrastructure as Code" est utilisée pour automatiser :

- **La création de l’infrastructure** (machines virtuelles, réseau, sécurité) avec **Terraform**
- **La configuration du serveur** (installation, déploiement d’applications, sécurisation) avec **Ansible**

Le service ainsi déployé doit permettre à un utilisateur :
- De stocker et partager des fichiers depuis un navigateur ou une application mobile
- D’éditer des documents en ligne via OnlyOffice

Un **load balancer** et un second serveur Nextcloud peuvent être ajoutés pour la **haute disponibilité**.

Ce projet illustre un cas concret de déploiement automatisé d'une application cloud open-source sur AWS, avec une attention portée à la portabilité, la sécurité, et l’expérience utilisateur.

---

## ✅ Fonctionnalités principales

- 🌩️ Déploiement d’un serveur Nextcloud sur AWS
- 🧩 Intégration du module d’édition OnlyOffice
- 🔐 Accès sécurisé via HTTPS avec Let’s Encrypt
- 📱 Connexion depuis l’application mobile Nextcloud
- ⚙️ Automatisation complète avec Terraform + Ansible
- ♻️ (Optionnel) Mise en place d’une architecture redondante

---

## 🛠️ Technologies utilisées

| Outil       | Utilisation principale                    |
|-------------|--------------------------------------------|
| **Terraform** | Création de l’infrastructure AWS         |
| **Ansible**   | Configuration logicielle du serveur      |
| **Docker**    | Déploiement de Nextcloud & OnlyOffice    |
| **Nginx**     | Reverse proxy et gestion du SSL          |
| **Let’s Encrypt** | Certificat SSL gratuit via Certbot |
| **Nextcloud** | Plateforme de cloud personnel            |
| **OnlyOffice**| Éditeur de documents en ligne            |

---

## 📌 Réalisé par

> 🧑‍🎓 Master 1 InfraCloud Aix
> 👤 Trigramme : **Maxime Obry** et **Thomas Quadro**