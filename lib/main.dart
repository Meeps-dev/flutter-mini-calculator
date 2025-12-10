// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<void> fetchData() async {
//   try {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('✅ Data: $data');
//     } else {
//       print('⚠️ Server error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('❌ Network error: $e');
//   }
// }
// // 🧩 What happens here:
// // await waits for the http.get to finish. try/catch safely handles network or server errors.

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiExample extends StatelessWidget {
//   const ApiExample({super.key});

//   Future<Map<String, dynamic>> fetchData() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Server error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("API Example")),
//       body: FutureBuilder(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           // 🔄 While waiting
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           // ❌ If error happens
//           else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           // ✅ If successful
//           else if (snapshot.hasData) {
//             final data = snapshot.data!;
//             return Center(child: Text(data['title']));
//           }
//           return Center(child: Text("No data"));
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String displayText = "";
  int num1 = 0;
  int num2 = 0;
  String operation = "";

  // 👉 Calculator Functions
  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        displayText = "0";
        num1 = 0;
        num2 = 0;
        operation = "";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        num1 = int.parse(displayText);
        num2 = int.parse(displayText);
        operation = value;
        displayText = "";
      } else if (value == "=") {
        int result = calculate(num1, num2, operation);
        displayText = result.toString();
      } else {
        displayText += value;
      }
    });
  }

  // double.parse(displayText)

  int calculate(int a, int b, String op) {
    if (op == "+") return a + b;
    if (op == "-") return a - b;
    if (op == "*") return a * b;
    if (op == "/") return 0;
    return a ~/ b; // Integer division
  }

  // 👉 Building the buttons grid
  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Mini Calculator 🤖"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Text(
              displayText,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("0"),
                  buildButton("C"),
                  buildButton("="),
                  buildButton("+"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
