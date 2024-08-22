# Flutter Test Project

Welcome to the Flutter Test Project! This project is a Flutter application designed to demonstrate various functionalities and best practices in mobile app development. It is set up with GetX for state management and uses several other packages for various features.

//=================== INFO =================//

App Name Flutter Project Test
Flutter SDK 3.16.2
environment: sdk: '>=3.2.2 <4.0.0'
App Store Identifier: com.flutter.test
Play Store Identifier: com.flutter.test
jks: none
key properties: none
App Icon: Radomly used icon for this app

//=================== INFO =================//

## Project Overview

This Flutter project demonstrates the following functionalities:
- **State Management**: Using GetX for managing app state.
- **User Authentication**: Login through social providers such as Gmail and Apple (Apple login requires an Apple Developer account).
- **Local Storage**: Using SharedPreferences for local data storage.
- **Networking**: Using Dio for network requests and logging responses with Dio interceptors.
- **Pagination**: Fetching posts with pagination (10 posts per page).
- **UI and UX**: Implemented in portrait mode with custom fonts and a consistent design.
- **Error Handling**: Using EasyLoading for loaders and a custom logger for debugging.

## Features

1. **Controllers**:
   - **AuthController**: Manages user login through Gmail and Apple. Apple login is set up but requires an Apple Developer account.
   - **GlobalController**: Manages the global state of the logged-in user (e.g., login status).
   - **HomeController**: Manages fetching posts, deleting posts, and adding posts to favorites.

2. **Local Storage**:
   - **SharedPreferences**: Used as a singleton class for local storage.

3. **Networking**:
   - **Dio**: Used for network requests.
   - **Logger**: Integrated with Dio interceptors for clean and easy debugging.

4. **UI**:
   - The application is restricted to portrait mode.
   - Custom fonts are used (Roboto fonts located in assets).
   - EasyLoading is used for displaying loading indicators.

5. **Post Management**:
   - Adding posts and inserting them locally into the list.
   - Pagination with 10 posts per page.
   - Logout button available on the top.
   - Favorite posts using local storage and matching post IDs.

## Installation and Setup

To get started with this project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone none
   cd flutter-test-project
