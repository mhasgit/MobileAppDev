import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField Styling'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,  // Set the width of the TextField
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter value',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0), // Rounded corners
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    // Padding inside the TextField
                    contentPadding: const EdgeInsets.all(10),  // Adjust the padding
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
