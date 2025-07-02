# 📚 Bookly App

## 📝 About  
**Bookly App** is a modern and user-friendly book discovery application built with **Flutter** using the **MVVM architecture** and **Bloc/Cubit** for state management.  
It allows users to browse, search, and view details of thousands of free books retrieved from a public API. The app is designed to deliver a smooth reading experience with a clean UI and responsive layout.

---

## 🌟 Features  
- 📖 Browse thousands of books from a free public API.  
- 🔍 Search for books by title or author.  
- 📘 View detailed book information including title, author, image, and description.   
- 🧭 Smooth navigation with structured MVVM layers.  

---

## 🧱 Architecture Overview  

The app follows the **Clean MVVM Architecture**, promoting separation of concerns and scalable project structure:

lib/
  - ├── core/ # Common resources (theme, constants, error handling)
  - ├── features/
  -    │ └── home/
             -├── data/
             -├── presentation/
  - ├── services/ # API service, network checker, dependency injection
  - ├── main.dart # App entry point
---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| 💙 Flutter | UI development |
| 🎯 Dart | Programming language |
| 🧠 Bloc/Cubit | State management |
| 🏗️ MVVM | Architecture pattern |
| 🌐 Free Books API | Fetch book data |
| 📡 Dio | HTTP client |
| 🧩 GetIt | Dependency injection |
| 🗃️ Cached Network Image | Image caching for smooth UX |

---

## 🌐 API  
This app uses a free public books API to fetch data.  
Example: [Google Books API](https://developers.google.com/books)

## 📸 Screenshots 


https://github.com/user-attachments/assets/3c8ab9cf-a296-4777-aeef-deb7c4dc66f5


