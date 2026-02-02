# Roadtrip App

A beautiful Flutter application for selecting your roadtrip companions with smooth animations and an elegant purple-themed UI.

## Screenshots

### 🏠 Home Screen
```
User can select multiple companions for their roadtrip:
- Beautiful purple gradient theme
- Character selection with animated checkboxes
- Smooth entrance animations
- Car animation at the top
- Clean Material Design 3 UI
```

### 🎉 Success Screen
```
After selecting companions:
- Success confirmation message
- Smooth transition animations
- Beautiful gradient background
- Option to go back to home and select again
```

See detailed screenshots in the [screenshots](screenshots/) folder.

## Features

✨ **Smooth Animations**
- Entrance animations for cards and lists
- Car animation with continuous horizontal movement
- Scale and fade transitions for interactive elements

🎨 **Beautiful UI**
- Modern Material Design 3
- Custom purple gradient color palette
- Responsive layout with clean architecture

👥 **Character Selection**
- Select multiple companions for your roadtrip
- Animated checkboxes with gradient backgrounds
- Success confirmation screen

## Project Structure

```
lib/
├── main.dart                    # App entry point and routing
├── constans.dart               # Color and animation constants
├── models/
│   └── character.dart          # Character data model
├── widgets/
│   ├── car_container.dart      # Car animation widget
│   └── character_checkbox.dart # Reusable checkbox widget
└── screens/
    ├── home_screen.dart        # Main character selection screen
    └── success_screen.dart     # Success confirmation screen
```

## Getting Started

### Prerequisites
- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/roadtrip-app.git
cd roadtrip-app
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Architecture

This project follows **Clean Architecture** principles:
- **Models**: Data structures (`character.dart`)
- **Widgets**: Reusable UI components (`car_container.dart`, `character_checkbox.dart`)
- **Screens**: Full-page widgets with business logic (`home_screen.dart`, `success_screen.dart`)
- **Constants**: Centralized color and animation durations (`constans.dart`)

## Technologies

- **Framework**: Flutter
- **Design**: Material Design 3
- **State Management**: StatefulWidget with AnimationController
- **Animation**: SlideTransition, FadeTransition, ScaleTransition

## Color Palette

The app uses a custom purple color palette with multiple shades and alpha variants:
- Primary Purple: `#7C3AED`
- Dark Purple: `#5B21B6`
- Light Purple: `#A78BFA`
- Accent Purple: `#DDD6FE`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

Your Name - [GitHub Profile]

---

For more information about Flutter development, visit the [official Flutter documentation](https://docs.flutter.dev/)
