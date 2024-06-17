import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List names = ['Ali', 'Hafs', 'Suddais', 'Adil'];
  String name = '';
  TextEditingController tcName = TextEditingController();
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();

  double num1 = 0, num2 = 0, result = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
    );
  }

  //seventh class work
  Widget listgeneratenamesGrid(){
    return GridView.count(crossAxisCount: 3,
      children: List.generate(names.length, (index) =>
          Container(width: 100, height: 100, color: Colors.blue, margin: EdgeInsets.all(5), child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                Text(names[index])
              ],
            ),
          ),
          )
      ),
    );
  }

  Widget listgenerateGrid(){
    return GridView.count(
        crossAxisCount: 3,
        children:
        List.generate(100, (index) =>
            getContainer(100, 100, Colors.yellowAccent)
        )
    );
  }

  Widget simpleGrid(){
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: [
        getContainer(100, 100, Colors.blueAccent),
        getContainer(100, 100, Colors.red),
        getContainer(100, 100, Colors.yellowAccent)

      ],
    );
  }

  //sixth Task
  Widget sixthTask(){
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) =>
            GestureDetector(
              onTap: clickMe,
              child: Container(height: 50, margin: EdgeInsets.all(5) ,color: Colors.blueAccent,child: Center(child: Text(names[index]))),
            )
    );
  }

  // fifth class work
  void clickMe(){
    setState(() {
      counter++;
    });
  }
  Widget fifthTask(){
    return GestureDetector(
      onTap: clickMe,
      child: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              color: Colors.blueAccent,
              child:  Text('ClickMe',),
            ),
            Text("Click $counter Times")
          ],
        ),
      ),
    );
  }

  //fourth class work
  Widget fourthTask(){
    return Stack(
      alignment: Alignment.center,
      children: [
        getContainer(200, 200, Colors.red),
        getContainer(100, 100, Colors.blue),
        getContainer(50, 50, Colors.yellowAccent),
      ],
    );
  }

  //third class work
  void Add(){
    setState(() {
      num1 = double.parse(tcNum1.text);
      num2 = double.parse(tcNum1.text);
      result = num1 + num2;
    });
  }

  Widget thirdTask(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Addition App'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('x'),
              SizedBox(width: 200, child: TextField(controller: tcNum1, textAlign: TextAlign.center,)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('y'),
              SizedBox(width: 200, child: TextField(controller: tcNum2, textAlign: TextAlign.center,)),
            ],
          ),
          ElevatedButton(onPressed: Add, child: Text('Add')),
          result == 0 ? Text("") : Text('The sum is: $result')
        ],
      ),
    );
  }

  //second class work
  void getName(){
    setState(() {
      name = tcName.text;
    });
  }
  Widget secondTask(){
   return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Greeting app', style: TextStyle(fontSize: 50)),
          SizedBox(height: 30),
          Text('What is your name?'),
          SizedBox(height: 30),
          SizedBox(width: 100, child: TextField(controller: tcName,)),
          SizedBox(height: 10),
          ElevatedButton(onPressed: getName, child: Text('Submit')),
          SizedBox(height: 10),
          name == '' ? Text('') : Text('Hi $name')
        ],
      ),
    );
  }

  //first class work
  Widget firstTask(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sarhad University'),
          SizedBox(height: 50),
          Text('Welcome!')
        ],
      ),
    );
  }

  Widget getContainer(_width, _height, _color,){
    return Container(width: _width, height: _height, color: _color, margin: EdgeInsets.all(5));
  }
}
