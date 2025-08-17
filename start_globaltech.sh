#!/bin/bash

# 📁 Remplace ceci par le chemin réel de ton projet
PROJECT_DIR=~/Documents/globaltechnologie_app

# 📁 Dossier de destination pour le APK généré
EXPORT_DIR=~/Documents/apk_globaltechnologie

# 🔁 Accès au projet
cd .
  exit 1
}

echo "🚀 Nettoyage du projet..."
flutter clean

echo "📦 Téléchargement des dépendances..."
flutter pub get

echo "⚙️ Compilation en mode release..."
flutter build apk --release

# 📤 Copier le APK vers le dossier de destination
APK_SOURCE="$PROJECT_DIR/build/app/outputs/flutter-apk/app-release.apk"

mkdir -p "$EXPORT_DIR"

if [ -f "$APK_SOURCE" ]; then
  cp "$APK_SOURCE" "$EXPORT_DIR"
  echo "✅ APK généré et copié dans : $EXPORT_DIR"
else
  echo "❌ APK non trouvé. Vérifie les erreurs de build."
fi

