# Repository Guidelines

## Project Structure & Module Organization
This is a Flutter mobile app for the WVSU Campus Tour. Application code lives in `lib/`: `screens/` contains page-level UI, `widgets/` reusable UI, `models/` content/data models, `firebase/` authentication integration, `config/` app configuration, and `observers/` bloc observer code. Tests are in `test/`, starting with `test/widget_test.dart`. Static assets are under `assets/images/` and `assets/icon/` and are registered in `pubspec.yaml`. Native project files are in `android/` and `ios/`; edit them only for platform-specific changes.

## Build, Test, and Development Commands
- `flutter pub get`: install Dart and Flutter dependencies from `pubspec.yaml`.
- `flutter run`: launch the app on a connected emulator or device.
- `flutter test`: run the Flutter test suite.
- `flutter analyze`: run static analysis for Dart/Flutter issues.
- `flutter build apk`: create an Android release APK.
- `flutter build ios`: create an iOS release build from macOS with Xcode installed.

The project targets an older Dart SDK range (`>=2.7.0 <3.0.0`), so verify toolchain compatibility before upgrading dependencies.

## Coding Style & Naming Conventions
Use standard Dart formatting with two-space indentation. Run `dart format lib test` before submitting changes. Name Dart files with `snake_case.dart`, classes and widgets with `UpperCamelCase`, and variables, methods, and fields with `lowerCamelCase`. Keep page widgets in `lib/screens/` and reusable components in `lib/widgets/`. Prefer small widgets over large `build` methods.

## Testing Guidelines
Use `flutter_test` for widget tests. Place tests in `test/` and name files with the `_test.dart` suffix, for example `home_screen_test.dart`. Add or update tests when changing navigation, rendering conditions, or user-visible behavior. Run `flutter test` before opening a pull request and `flutter analyze` when Dart code changes.

## Commit & Pull Request Guidelines
Recent history uses short, direct commit messages such as `chore: modernize Flutter Android and iOS build configuration`, `Updated docs`, and `Bump version`. Prefer concise imperative messages, and use a conventional prefix like `chore:`, `fix:`, or `feat:` when it adds clarity.

Pull requests should include a clear description, linked issues when applicable, and screenshots or screen recordings for UI changes. Note any dependency, Firebase, Strapi, Android, or iOS configuration changes explicitly so reviewers can reproduce the build.

## Security & Configuration Tips
Do not commit secrets, signing keys, API credentials, or local environment files. Treat Firebase, Strapi, Android signing, and iOS provisioning changes as sensitive and document required setup without exposing private values.
