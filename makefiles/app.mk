# makefiles/app.mk — Automatisation de l'environnement mobile Afrispots

REPO_APP ?= https://github.com/michaelmisi/afrispot-app.git
TARGET_APP ?= ~/afrispots/afrispots-app

# 📦 Clone du projet React Native
app-init:
	@echo "📁 Création du dossier de destination : $(TARGET_APP)"
	mkdir -p ~/afrispots
	@echo "🔄 Clonage du dépôt Afrispots App"
	git clone $(REPO_APP) $(TARGET_APP)
	@echo "✅ Projet cloné avec succès."

# 🔧 Installation des dépendances npm
app-install:
	cd $(TARGET_APP) && npm install

# 🚀 Lancement de l'application avec Expo
app-start:
	cd $(TARGET_APP) && npx expo start

# 🧪 Lint + format
app-lint:
	cd $(TARGET_APP) && npx eslint . --ext .js,.jsx,.ts,.tsx || echo "⚠️ Lint terminé avec erreurs"

app-format:
	cd $(TARGET_APP) && npx prettier --write .

# ⚙️ Initialisation de ESLint
app-eslint-init:
	cd $(TARGET_APP) && \
	npm install --save-dev eslint && \
	npx eslint --init || true && \
	echo "✅ ESLint initialisé (si configuration réussie)"

# ⚙️ Initialisation de Prettier
app-prettier-init:
	cd $(TARGET_APP) && \
	npm install --save-dev prettier && \
	echo '{\n  "singleQuote": true,\n  "trailingComma": "all"\n}' > .prettierrc && \
	echo "✅ Fichier .prettierrc créé"

# 🧭 Aide dédiée App
app-help:
	@echo ""
	@echo "📱 Commandes App Afrispots"
	@echo "---------------------------"
	@echo "make app-init           : Clone le repo dans ~/afrispots/afrispots-app"
	@echo "make app-install        : Installe les dépendances npm"
	@echo "make app-start          : Lance l’application avec Expo"
	@echo "make app-eslint-init    : Installe ESLint et initialise un .eslintrc.js"
	@echo "make app-prettier-init  : Installe Prettier et crée un .prettierrc"
	@echo "make app-lint           : Analyse le code avec ESLint (.eslintrc requis)"
	@echo "make app-format         : Reformate le code avec Prettier (.prettierrc requis)"
	@echo "make app-help           : Affiche cette aide"
	@echo ""
