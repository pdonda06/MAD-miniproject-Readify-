# Readify

Readify is a modern Flutter application that allows users to read books with a beautiful and intuitive interface. It integrates Firebase for authentication and provides a seamless reading experience across devices.

## Features

- **User Authentication**: Sign up, sign in, and manage sessions securely with Firebase Auth.
- **Book Search**: Search for books using the Google Books API.
- **Book Details**: View detailed information about books, including cover, author, and description.
- **Reading Experience**:
  - Read EPUB, PDF, and HTML books within the app.
  - Smooth page navigation and progress tracking.
  - Text-to-speech functionality for accessible reading.
- **Personal Library**: Save and manage your favorite books.
- **Modern UI**: Beautiful design with Google Fonts and smooth animations.

## Screenshots
![image](https://github.com/user-attachments/assets/bfcea0ad-d979-4ff9-8e2d-d6a1949730f7)
![image](https://github.com/user-attachments/assets/33638861-59c5-471f-b08b-f6d50eb3afce)
![image](https://github.com/user-attachments/assets/f6f1d53c-e60f-44b2-ba1a-12bf9b01a6bc)
![image](https://github.com/user-attachments/assets/0e705493-42a1-4fb7-b33b-cf91eb736d92)
![image](https://github.com/user-attachments/assets/875c655f-ad00-4293-bd57-ffcf27e95416)
![image](https://github.com/user-attachments/assets/daf16948-6732-43cd-8e91-0bac7593d92d)
![image](https://github.com/user-attachments/assets/9a9c9275-a038-4358-a169-32cce99cea48)
![image](https://github.com/user-attachments/assets/b00db1b6-8e3f-4f23-89b4-98b1c18f02ed)
![image](https://github.com/user-attachments/assets/619fdfae-4ff2-468a-be94-afdafae092c8)
![image](https://github.com/user-attachments/assets/b9e86b39-9cdc-44d8-85ae-eee987eedc66)
![image](https://github.com/user-attachments/assets/3cfec82b-a018-4b67-b2a0-d2b83d47b08c)


## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.4.1 <4.0.0)
- Dart
- An editor like VS Code or Android Studio

### Installation

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd readify
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Firebase Setup:**
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the respective directories.
   - Configure Firebase in your project as per the [FlutterFire documentation](https://firebase.flutter.dev/docs/overview/).
4. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

- `lib/`
  - `main.dart` — App entry point
  - `screens/` — UI screens (login, signup, home, book search, reader, etc.)
  - `services/` — Business logic (authentication, book API integration)
  - `models/` — Data models (e.g., Book)
  - `widgets/` — Reusable UI components
  - `utils/` — Utility functions and data
- `assets/` — Images and book files (EPUB, covers, backgrounds)

## Dependencies

Key packages used:
- `firebase_core`, `firebase_auth` — Firebase integration
- `cloud_firestore` — Cloud database
- `google_fonts` — Stylish fonts
- `dio`, `http` — Network requests
- `flutter_html`, `epubx`, `flutter_pdfview` — Book rendering
- `shared_preferences` — Local storage
- `webview_flutter`, `scrollable_positioned_list`, `flutter_tts`, `smooth_page_indicator`, `flutter_animate`

See `pubspec.yaml` for the complete list.

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements and bug fixes.

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a pull request

## License

This project is for educational purposes. Add a license if you intend to share it publicly.

## Contact

*Add your contact info or links here.*

---

*Happy Reading with Readify!*
