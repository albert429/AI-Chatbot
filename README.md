# AI Chat

A beautiful, galaxy-themed Flutter chatbot that integrates with Google's Gemini API to provide intelligent responses. This app features a modern, cosmic design with subtle animations and a responsive UI.

## ✨ Features

- 🌌 Beautiful galaxy-themed UI
- 💬 Real-time chat interface
- 🤖 Integration with Google's Gemini AI
- ✨ Smooth animations and transitions
- 🌙 Dark mode optimized
- 📱 Responsive design for all screen sizes

## 🚀 Getting Started

### Prerequisites

1. Flutter SDK (latest version)
2. A Google AI Studio API key
3. Any IDE with Flutter support (VS Code, Android Studio, etc.)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/albert429/Structured-Chatbot.git
   cd Structured-Chatbot
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Create a Google AI Studio API key at [Google AI Studio](https://ai.google.dev/)

4. Run the app with your API key:
   ```bash
   flutter run --dart-define=GEMINI_API_KEY=your_api_key_here
   ```

## 🛠️ Built With

- Flutter - UI framework
- Gemini API - AI chat functionality
- Material Design - Design system

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check [issues page](https://github.com/albert429/Structured-Chatbot/issues).

```
flutter run --dart-define=GEMINI_API_KEY=YOUR_KEY_HERE
```

For release/profile builds, pass the same define to your build command.

## Notes

- The app reads the key from `String.fromEnvironment('GEMINI_API_KEY')`.
- No API key is stored in the repository.
