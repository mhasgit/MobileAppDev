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

  void getContactInfo() {
    setState(() {
      contactText = 'Contact us @ 03348427188';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bar example'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'portfolio',
                  icon: Icon(Icons.sports_football),
                ),
                Tab(
                  text: 'gallery',
                  icon: Icon(Icons.sports_football),
                ),
                Tab(
                  text: 'portfolio',
                  icon: Icon(Icons.sports_football),
                ),
                Tab(
                  text: 'profile',
                  icon: Icon(Icons.sports_football),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                'This is our portfolio',
                style: TextStyle(color: Colors.redAccent),
              )),
              Center(
                  child: Text(
                'This is our Gallery',
                style: TextStyle(color: Colors.redAccent),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    contactText,
                    style: TextStyle(color: Colors.redAccent),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: getContactInfo, child: Text('Click Me!'))
                ],
              ),
              Center(
                  child: Text(
                'This is our portfolio',
                style: TextStyle(color: Colors.redAccent),
              )),
            ],
          ),
        ));
  }
}
