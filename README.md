# task-keeping

Task Keeper

Task Keeper is a simple task management application built with Flutter. It allows users to add, edit, and delete tasks, and set due dates for each task. The application uses a local SQLite database to store tasks.

Features

- Add new tasks with titles, descriptions, and due dates.
- Edit existing tasks.
- Mark tasks as completed.
- Delete tasks.
- View tasks sorted by completion status and due date.

Screenshots



Getting Started

Prerequisites

- Flutter SDK (version 2.5.0 or later)
- Dart SDK (version 2.14.0 or later)
- An IDE with Flutter support (e.g., Visual Studio Code, Android Studio)

Installation

1. Clone the repository:

   git clone https://github.com/Kwaku-Clement/task-keeping
   cd task-keeping


2. Get the dependencies:
   flutter pub get
   

3. Run the application:

   flutter run


Project Structure


task_keeper/
├── lib/
│   ├── controllers/
│   │   └── task_controller.dart
│   ├── database/
│   │   └── database_helper.dart
│   ├── models/
│   │   └── task_model.dart
│   ├── state_management/
│   │   ├── task_bloc.dart
│   │   ├── task_event.dart
│   │   └── task_state.dart
│   ├── widgets/
│   │   ├── task_dialog.dart
│   │   └── task_item.dart
│   ├── main.dart
│   └── task_list_screen.dart
├── pubspec.yaml
├── README.md
└── screenshots/
    

Dependencies
-flutter_bloc: For state management.
-sqflite: For SQLite database operations.
-path: For file path operations. 
-intl: For date formatting.
-google_fonts: For custom fonts.

How to Use

1. Add a Task:
    - Click the floating action button (FAB) to open the task dialog.
    - Enter the task title, description, and set a due date.
    - Click "Add" to save the task.

2. Edit a Task:
    - Click the edit icon next to a task to open the task dialog.
    - Modify the task details and click "Update" to save the changes.

3. Mark a Task as Completed:
    - Click the checkbox next to a task to mark it as completed.

4. Delete a Task:
    - Click the delete icon next to a task to remove it from the list.

Contributing

Contributions are welcome! Please open an issue or submit a pull request.

License

This project is licensed under the MIT License.

Acknowledgments

- Thanks to the Flutter community for their support and contributions.

Contact

For any questions or feedback, please contact [caduasante@gmail.com] or open an issue on GitHub.



How to Set Up the Project

1. Clone the Repository:

   Open your terminal and run the following commands to clone the repository:

   git clone https://github.com/Kwaku-Clement/task-keeping
   cd task_keeping
   

2. Get the Dependencies:

   Run the following command to install the project dependencies:

   flutter pub get
   

3. Run the Application:

   Connect your device or start an emulator, then run the following command to start the application:

 
   flutter run
   

Additional Notes

- Make sure you have the Flutter SDK and Dart SDK installed on your machine.
- Ensure that your development environment is set up correctly for Flutter development.
- You can customize the UI and add more features as per your requirements.
