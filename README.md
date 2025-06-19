# 🎬 MovieDemoApp

A modern iOS app built with **SwiftUI**, **SwiftData**, and [TMDb API](https://www.themoviedb.org/), allowing users to browse popular movies, search for specific titles, and save favorites locally. Built with modular architecture and complete with UI testing.

## ✨ Features

- 🔍 Search popular and trending movies via [TMDb API](https://www.themoviedb.org/)
- 🖼 Display poster thumbnails in a responsive **2-column grid**
- ❤️ Add/remove movies from Favorites (persisted using **SwiftData**)
- 📱 Clean and adaptive SwiftUI interface
- ✅ Full **UI Testing** for major user flows

## 📸 Preview
### Add/remove movies from Favorites
https://github.com/user-attachments/assets/4a05f799-7dbb-4dc4-8603-cd785e65bf49

### Search popular Movie on title
https://github.com/user-attachments/assets/b35827a8-233e-422a-b87d-7b7e6993646b

## 🛠 Technologies Used

- **SwiftUI**
- **SwiftData** (local persistence)
- **The Movie Database (TMDb) API**
- **XCTest** & **XCUITest**

## 📦 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/bhumika-ios/MovieDemoApp.git
   cd MovieDemoApp
   
2. Open MovieDemoApp.xcodeproj in Xcode
3. Run on iOS 16+ Simulator or Device
4. Add your TMDb API key in APIService.swift:
    ```bash
   private let apiKey = "YOUR_API_KEY"
   
## 🧪 Unit & UI Tests

- Api fetch Loading
- testMovieGridLoads
- testAddAndRemoveFromFavorites

## 🧾 Requirements

- Xcode 15+
- iOS 16+
- Internet access for API calls
  
## 🙏 Acknowledgements

- TMDb API
- Swift community for great tools and documentation
  
## 👩‍💻 Author

Made with ❤️ by BhumikaiOS
https://bhumikaios.com/
