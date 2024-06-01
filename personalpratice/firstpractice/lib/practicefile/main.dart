import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Point Tab Bar'),
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
  String contactText = '';

  void changeText() {
    setState(() {
      contactText = 'You can contact us at contact123@gmail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Contact', icon: Icon(Icons.contact_mail_outlined)),
              Tab(text: 'Account', icon: Icon(Icons.account_balance)),
              Tab(text: 'Portfolio', icon: Icon(Icons.airport_shuttle_sharp)),
              Tab(text: 'Organizations', icon: Icon(Icons.opacity_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    contactText,
                    style: TextStyle(color: Colors.green, fontSize: 30),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: changeText,
                  child: Text('Get Text'),
                ),
              ],
            ),
            Center(
              child: Text(
                'Your balance is Rs.1299',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                'No Photos yet sorry',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                'We are alone now',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
