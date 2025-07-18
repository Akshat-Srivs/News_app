# 📰 News Reading App

A simple Flutter application that displays news articles fetched from an external API. The app is designed to showcase Flutter best practices using modern UI components, HTTP networking, and external URL integration.

---

## 🚀 Features

- 🌐 Fetches real-time news articles using a public news API
- 🧭 Opens full articles in browser when clicked
- 🔄 Pull-to-refresh support
- 📱 Clean, minimal UI using Flutter widgets
- ✅ Handles URL launching errors gracefully

---

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (Latest stable)
- Dart SDK
- Android Studio or VS Code
- Working Android emulator or physical device with internet access

---

## 📦 Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/news_reading_app.git
   cd news_reading_app
   ```

2. **Install Dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the App:**

   ```bash
   flutter run
   ```

---

## 📁 Project Structure

```bash
lib/
├── main.dart                 
├── models/
    ├── news_article 
├── providers/ 
    ├── news_provider             
├── services/  
    ├──news_service             
├── screens/
    ├── home_screen
    ├── news_details_screen   
├── widgets/  
    ├── news_card               
```

---

## 🔑 API Usage

- You can integrate your own API (like [NewsAPI.org](https://newsapi.org)) or mock data.
- Example API URL:
  ```
  https://newsapi.org/v2/top-headlines?country=in&apiKey=YOUR_API_KEY
  ```

---

## 📚 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.4.0
  provider: ^6.1.5
  shared_preferences: ^2.5.3
  cached_network_image: ^3.4.1
  google_fonts: ^6.2.1
  connectivity_plus: ^6.1.4
  url_launcher: ^6.3.1
```
## Assets
```yaml
assets:
    - assets/images/
```
---

## 💡 Troubleshooting

- If links fail to open:
  - Ensure you have a browser installed on your device.
  - Test on a real device instead of an emulator.
  - Make sure URL is valid (print in logs for verification).

--- 
Made with ❤️ using Flutter