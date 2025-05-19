# 🛠️ Afrispots DevOps

Ce dépôt contient tous les scripts, outils et automatisations liés à l'infrastructure, au développement local, au déploiement et à la maintenance des projets **Afrispots** :

* `afrispots-app` (application mobile React Native)
* `afrispots-api` (backend Django + DRF)

L’objectif est d’unifier les pratiques DevOps, de faciliter l’onboarding des développeurs, et d’automatiser les tâches récurrentes.

---

## ⚙️ Installation

```bash
# Cloner le repo
git clone https://github.com/michaelmisi/afrispots-devops.git
cd afrispots-devops

```


## 📁 Structure du dépôt

```
afrispots-devops/
├── makefiles/
│   ├── app.mk          # Automatisation frontend mobile
│   ├── api.mk          # Automatisation backend Django
│   └── (à venir)       # db.mk, deploy.mk, ci.mk…
├── Makefile            # Point d’entrée global
├── .env.make           # Variables privées (non committées)
├── .gitignore
└── README.md
```

---

## 🚀 Utilisation

Cloner ce dépôt à côté des deux autres projets :

```
~/afrispots/
├── afrispots-app/        # Mobile
├── afrispots-api/        # Backend
└── afrispots-devops/     # DevOps
```

Puis exécuter les commandes depuis ce dossier :

```bash
cd ~/afrispots/afrispots-devops
make help
```

---

## ⚙️ Commandes disponibles

### 🔹 Application mobile (React Native)

```bash
make app-init           # Clone l’app dans ~/afrispots/afrispots-app
make app-install        # Installe les dépendances npm
make app-start          # Lance l’application Expo
make app-lint           # Analyse ESLint
make app-format         # Format Prettier
make app-eslint-init    # Génère une config ESLint
make app-prettier-init  # Génère une config Prettier
make app-help           # Affiche l’aide mobile
```

---

### 🔸 Backend API (Django + DRF)

```bash
make api-init           # Clone le backend dans ~/afrispots/afrispots-project
make api-up             # Lance l’environnement Docker (build + run)
make api-down           # Stoppe et supprime les conteneurs
make api-restart        # Redémarre les conteneurs
make api-env-init       # Génère un fichier .env de base
make api-logs           # Affiche les logs (via SSH)
make api-logs-local     # Affiche les logs localement
make api-test           # Lance les tests Django
make api-help           # Affiche l’aide backend
```

---

## 🔐 Fichier `.env.make`

Ce fichier contient des variables privées (non versionné). Crée-le avec :

```bash
make config
```

Contenu suggéré :

```env
SSH_USER=root
SSH_HOST=192.162.70.198
```

---

## 🦯 Commande d’aide globale

```bash
make help
```

---

## 🔒 Licence

Ce dépôt est privé. Toute diffusion, reproduction ou modification non autorisée est interdite.

---

## 📬 Contact

📧 [contact@afrispots.com](mailto:contact@afrispots.com)
🌐 [https://afrispots.com](https://afrispots.com)
