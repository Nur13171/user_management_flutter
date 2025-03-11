```markdown
# User Management Application - README

This repository contains the source code for a User Management application built using Flutter. This application allows users to perform various operations related to user management, with distinct roles and permissions for Admin and regular Users.

**Table of Contents:**

* [Features](#features)
* [Roles and Permissions](#roles-and-permissions)
* [Getting Started](#getting-started)
    * [Prerequisites](#prerequisites)
    * [Installation](#installation)
    * [Running the Application](#running-the-application)
* [Project Structure](#project-structure)
* [Dependencies](#dependencies)
* [Contributing](#contributing)
* [License](#license)

## Features

* **Secure Authentication:** Utilizes a robust authentication system with password hashing and OTP verification.
    <img src="assets/screenshot/screenshots/1.png" width="200"> 

* **CRUD Operations:** Enables Create, Read, Update, and Delete operations for user management.
    <img src="assets/screenshots/4.png" width="200"> 
    <img src="assets/screenshots/5.png" width="200"> 
    <img src="assets/screenshots/6.png" width="200"> 

* **User-Friendly Interface:** Provides an intuitive and responsive user interface for seamless interaction.
    <img src="assets/screenshots/2.png" width="200"> 
    <img src="assets/screenshots/3.png" width="200"> 



## Roles and Permissions

This application distinguishes between two primary roles:

* **Admin:**
    * Full access to all features.
    * Can create, update, and delete users.
    * Manages user permissions and roles.
* **User:**
    * Can view their own profile and update limited information.
    * Cannot create, update, or delete other users.

## Getting Started

Follow these steps to set up and run the application on your local machine.

### Prerequisites

* **Flutter SDK:** Ensure you have Flutter SDK installed on your system. You can download it from the official Flutter website: [flutter.dev](https://flutter.dev/docs/get-started/install)
* **Android Studio/Xcode (Optional):** Required for running the application on emulators or physical devices.
* **IDE (Integrated Development Environment):** Choose an IDE like VS Code or Android Studio with Flutter and Dart plugins installed.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone [repository URL]
    cd [repository directory]
    ```

2.  **Get dependencies:**

    ```bash
    flutter pub get
    ```

### Running the Application

1.  **Connect a device or start an emulator.**
2.  **Run the application:**

    ```bash
    flutter run
    ```

## Project Structure

Here's an overview of the project's directory structure:

<img src="screenshots/project_structure.png" width="500"> 

The project is organized into the following directories:

* **`lib/`**: Contains the Dart source code for the application.
    * **`controllers/`**: Manages the application's logic and state.
        * `auth_controller.dart`: Handles authentication-related logic.
        * `user_controller.dart`: Manages user-related operations.
    * **`models/`**: Defines the data models used in the application.
        * `user_model.dart`: Represents the user data model.
    * **`screens/`**: Contains the UI screens of the application.
        * `add_user.dart`: Screen for adding a new user.
        * `drawer_screen.dart`: Navigation drawer for the application.
        * `edit_user.dart`: Screen for editing user details.
        * `home_screen.dart`: Main screen of the application.
        * `login_screen.dart`: Login screen.
        * `sign_up_screen.dart`: Registration screen.
        * `user_list.dart`: Screen to display the list of users.
    * **`services/`**: Handles data fetching and API communication.
        * `auth_service.dart`: Manages authentication-related API calls.
        * `user_service.dart`: Handles user-related API calls.
    * **`utils/`**: Contains utility classes and constants.
        * `constants/`: Defines constants used throughout the application.
            * `api.dart`: API endpoints and configurations.
            * `app_config.dart`: Application-wide configurations.
            * `color.dart`: Color definitions.
    * **`routes/`**: Handles navigation routes.
    * **`widgets/`**: Contains reusable UI components.
    * `main.dart`: Entry point of the application.
    * `splash_screen.dart`: Splash screen displayed on app launch.
    * `welcome_screen.dart`: Welcome screen of the application.

## Dependencies

List the dependencies used in the project with their versions. Example:

* `flutter: sdk: flutter`
* `cupertino_icons: ^1.0.2`
* `http: ^0.13.0`
* `provider: ^6.0.0`
* `shared_preferences: ^2.0.0`

You can find the complete list of dependencies in the `pubspec.yaml` file.

## Contributing

Contributions are welcome! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with descriptive messages.
4.  Push your changes to your fork.
5.  Submit a pull request to the main repository.

## License

This project is licensed under the [MIT License](LICENSE) - see the [LICENSE](LICENSE) file for details.

---