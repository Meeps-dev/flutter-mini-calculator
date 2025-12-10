📱 Flutter Mini Calculator App

A clean and beginner-friendly calculator app built with Flutter + Dart.
Designed as a mini project to understand functions, parameters, return types, UI interaction, and basic state management.

This calculator performs integer operations with safe handling for invalid cases like division by zero.

✨ Features

🧮 Addition, subtraction, multiplication, division

🚫 Division-by-zero protection

🔢 Default display value of 0

📱 Simple and clean UI layout

⚡ Fast, lightweight, easy to understand

🎓 Perfect for beginners learning Dart functions and calculator logic

📸 Screenshot (Optional)

Add your screenshots here
Example: /screenshots/calculator.png

🛠️ Tech Stack

Flutter (UI framework)

Dart (programming language)

Material Design

Basic function logic (calculate()) using parameters + return types

📂 Project Structure
lib/
  main.dart
  calculator.dart   // your logic and UI code
assets/
README.md


You can adjust this depending on your file organization.

🧠 How It Works

This project uses a simple function:

int calculate(int a, int b, String op) {
  if (op == "+") return a + b;
  if (op == "-") return a - b;
  if (op == "*") return a * b;
  if (op == "/") {
    if (b == 0) return 0; 
    return a ~/ b;
  }
  return 0;
}


This demonstrates:

How functions receive parameters

How they compute values

How they return results back to the UI

▶️ How to Run the App
flutter pub get
flutter run


Make sure you have Flutter installed:
https://docs.flutter.dev/get-started/install

🧪 Future Improvements (Optional)

Add decimal support

Add percentage operator

Add history of calculations

Better UI styling

Turn the calculate function into its own service file

🤝 Contributing

Feel free to fork this repo, open issues, or submit pull requests.

📜 License

This project is open-source and available under the MIT License.
