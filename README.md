# Book App

The Book App is designed to allow users to search for books and access detailed information about them. With an emphasis on UI/UX, this app aims to provide a smooth and enjoyable browsing experience, complete with custom animations and efficient data management. The app is built with scalability in mind, enabling easy expansion of features and functionality.

**For full details please check my LinkedIn profile**: [My Profile](https://www.linkedin.com/in/fathi-alghareeb/)


## Features

- **Book Search:** Search for books by title, author, or keywords and receive detailed information about each book.
- **Book Details Overview:** View summaries, author information, publication dates, and more, all within the app.
- **Favorites and Saved Books:** Save books to your favorites or a reading list to revisit them later.
- **Pagination:** Efficiently load large datasets with pagination, ensuring the app remains fast and responsive.
- **Dark Theme Support:** Experience the app in both light and dark modes, providing a user-friendly interface regardless of lighting conditions.
- **Shimmer Effect:** Aesthetic loading animations enhance the user experience while data is being fetched.
- **Refresh Indicator** Just drop the screen down to re-fetch your data
- **Animations** Using some nice and light animations on some pages to enhance the user experience
- **Splash Screen:** A dynamic splash screen that is fully compatible with Android 12 and earlier versions, creating a seamless start-up experience.


## Book App Interface

### **Light Theme**


![Picsart_24-08-09_11-13-04-827](https://github.com/user-attachments/assets/7e1e115a-2df9-4f5d-bef9-28d67660b4db)


### **Dark Theme**


![Picsart_24-08-09_11-17-12-158](https://github.com/user-attachments/assets/90d2e25b-640f-4c22-9301-42599189ae25)



## Technology

1. **Bloc**  
   A state management library that provides a predictable and testable structure, enhancing the reliability of the app.
2. **OpenLibrary API**  
   A comprehensive API is used to fetch detailed information about a vast collection of books, allowing users to explore a wide range of literary works.
3. **MVVM Architecture**  
   The MVVM design pattern promotes a clear separation between the user interface and the underlying logic, making the app more scalable and maintainable.
4. **Retrofit with Dio**  
   A combination of powerful HTTP clients used to handle complex API requests, including pagination and data serialization, ensuring smooth data processing.
5. **Url Launcher**  
   A Flutter plugin that enables the opening of URLs within the mobile platform, allowing users to access external resources directly from the app.
6. **Json Serializable**
   Automatically generates code to convert Dart objects to and from JSON format, making it easier to work with APIs and ensuring type-safe JSON serialization and deserialization.
7. **Get It**
   Is a simple and lightweight dependency injection package for Dart and Flutter. It allows you to manage the creation and lifecycle of objects, making it easy to retrieve instances of classes (like services or repositories) from anywhere in your app, promoting better code organization and testability.
