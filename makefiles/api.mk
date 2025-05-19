# makefiles/api.mk — Setup de l'environnement backend Afrispots

REPO_URL ?= https://github.com/michaelmisi/afrispots-api.git
TARGET_DIR ?= ~/afrispots/afrispots-project

SSH_USER ?= root
SSH_HOST ?= 192.162.70.198
PROJECT_PATH ?= /home/afrispots/afrispots-project

# 📦 Cloner le projet
api-init:
	mkdir -p ~/afrispots
	git clone $(REPO_URL) $(TARGET_DIR)
	@echo "✅ Repo cloné dans $(TARGET_DIR)"

# 🔧 Lancer le backend local (build + up)
api-up:
	cd $(TARGET_DIR) && docker compose up --build

# 🔁 Redémarrer les conteneurs
api-restart:
	cd $(TARGET_DIR) && docker compose restart

# 🗑️ Stopper et supprimer les conteneurs
api-down:
	cd $(TARGET_DIR) && docker compose down

# 🔍 Logs (local et SSH)
api-logs:
	ssh $(SSH_USER)@$(SSH_HOST) 'cd $(PROJECT_PATH) && docker compose logs -f backend db'

api-logs-local:
	cd $(TARGET_DIR) && docker compose logs -f backend db

# ⚙️ Générer un .env basique
api-env-init:
	echo "DJANGO_SECRET_KEY=changeme_secret" > $(TARGET_DIR)/.env
	echo "DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1" >> $(TARGET_DIR)/.env
	echo "DB_NAME=afrispots_db" >> $(TARGET_DIR)/.env
	echo "DB_USER=postgres" >> $(TARGET_DIR)/.env
	echo "DB_PASSWORD=yourpassword" >> $(TARGET_DIR)/.env
	echo "DB_HOST=db" >> $(TARGET_DIR)/.env
	@echo "✅ Fichier .env généré"

# 🧪 Exécuter les tests Django
api-test:
	cd $(TARGET_DIR) && docker compose exec backend python manage.py test

# 📖 Aide
api-help:
	@echo ""
	@echo "🛠️  Commandes API disponibles"
	@echo "-----------------------------"
	@echo "make api-init         : Clone le backend dans ~/afrispots/afrispots-project"
	@echo "make api-up           : Lance docker-compose (build + run)"
	@echo "make api-down         : Stoppe et supprime les conteneurs"
	@echo "make api-restart      : Redémarre les conteneurs Docker"
	@echo "make api-logs         : Affiche les logs depuis le VPS distant"
	@echo "make api-logs-local   : Affiche les logs localement"
	@echo "make api-env-init     : Génère un fichier .env de base"
	@echo "make api-test         : Lance les tests unitaires Django"
	@echo "make api-help         : Affiche cette aide"
	@echo ""
