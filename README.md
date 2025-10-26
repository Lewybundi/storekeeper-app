# Product Management App

A Flutter inventory management app with local database storage, image support, and real-time stock tracking.

## 📥 Download

[![Download APK](https://img.shields.io/badge/Download-APK-green?style=for-the-badge&logo=android)](https://github.com/Lewybundi/storekeeper-app/releases/download/v1.0.0/app-release.apk)

**Version**: 1.0.0 | **Min Android**: 5.0 (API 21)

## 🎥 Demo Video

Watch the app in action: [View Demo Video](https://drive.google.com/file/d/1yG5Fg-ZxCBg2kILrzE38cO5c8549iKs5/view?usp=sharing)

## ✨ Features

- ✅ Add, edit, and delete products with images
- 🔍 Real-time product search
- 📊 Inventory dashboard with total value calculation
- ⚠️ Low stock alerts (quantity < 10)
- 💾 Offline-first with local SQLite database
- 📸 Camera/gallery image support

## 🛠️ Tech Stack

- **Flutter** - UI framework
- **Riverpod** - State management
- **Drift** - SQLite database ORM
- **GetIt** - Dependency injection
- **Image Picker** - Image selection

## 🚀 Quick Start

```bash
# Clone repository
git clone https://github.com/Lewybundi/storekeeper-app.git
cd storekeeper-app

# Install dependencies
flutter pub get

# Generate database code
flutter pub run build_runner build --delete-conflicting-outputs

# Run app
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  drift: ^2.16.0
  drift_flutter: ^0.1.0
  get_it: ^7.6.7
  image_picker: ^1.0.7
  path_provider: ^2.1.2

dev_dependencies:
  drift_dev: ^2.16.0
  build_runner: ^2.4.8
```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry
├── database/                    # Database layer
├── repository/                  # Data access
├── providers/                   # Riverpod providers
├── screens/                     # UI screens
└── service/                     # Service locator
```

## 🏗️ Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## 📝 License

MIT License - see [LICENSE](LICENSE) file

## 👨‍💻 Developer

**Lewy Bundi**

GitHub: [@Lewybundi](https://github.com/Lewybundi)

---

Made with ❤️ using Flutter