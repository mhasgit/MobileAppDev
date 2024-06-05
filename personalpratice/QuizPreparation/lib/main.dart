import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> names = ['Ali','Haris','Samoon','Affan'];

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: GridView.count(
            crossAxisCount: 10,
            children: List.generate(100, (index) =>
                getContainer()
            )
    )
    ),
    );
    }
  }
  void greeting(){
    print('Hello Stranger');
  }

  Widget getContainer(){
    return Container(width: 100, height: 100, color: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),);
  }

