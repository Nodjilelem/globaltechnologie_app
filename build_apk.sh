#!/bin/bash

# 📁 Chemin de ton projet Flutter
PROJECT_DIR=~/Bureau/globaltechnologie_app


# 📁 Dossier de destination pour l'APK généré
EXPORT_DIR=~/Documents/apk_globaltechnologie

# 🔁 Aller dans le projet
cd "$PROJECT_DIR" || { echo "❌ Impossible de trouver le projet"; exit 1; }

# 🚀 Nettoyage du projet
echo "🚀 Nettoyage du projet..."
flutter clean

# 📦 Installation des dépendances
echo "📦 Téléchargement des dépendances..."
flutter pub get

# ⚙️ Compilation en mode release
echo "⚙️ Compilation en mode release..."
flutter build apk --release

# 📤 Copier l'APK vers le dossier de destination
APK_SOURCE="$PROJECT_DIR/build/app/outputs/flutter-apk/app-release.apk"
mkdir -p "$EXPORT_DIR"

if [ -f "$APK_SOURCE" ]; then
  cp "$APK_SOURCE" "$EXPORT_DIR"
  echo "✅ APK généré et copié dans : $EXPORT_DIR/app-release.apk"
else
  echo "❌ APK non trouvé. Vérifie les erreurs de build."
fi
