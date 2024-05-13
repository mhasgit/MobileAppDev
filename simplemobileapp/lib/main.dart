import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Simple Addition App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Add Two Numbers"),
            SizedBox(height: 20),
            SizedBox(
              width: 300,  // Set the width of the TextField
              child: TextField(
                controller: tcNum1,
                decoration: InputDecoration(
                  labelText: 'Enter a Num1: ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  // Padding inside the TextField
                  contentPadding: const EdgeInsets.all(10),  // Adjust the padding
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,  // Set the width of the TextField
              child: TextField(
                controller: tcNum2,
                decoration: InputDecoration(
                  labelText: 'Enter Num2: ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  // Padding inside the TextField
                  contentPadding: const EdgeInsets.all(10), // Adjust the padding

                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addition,
              child: Text("Add"),
            ),
            Text(result),
          ],
        ),
      ),
    );
  }

  void addition() {
    int num1 = int.tryParse(tcNum1.text) ?? 0;
    int num2 = int.tryParse(tcNum2.text) ?? 0;
    int sum = num1 + num2;
    setState(() {
      result = 'The sum is: $sum';
    });
  }
}
