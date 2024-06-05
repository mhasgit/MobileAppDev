import 'package:navigation/pages/about.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Text("Navigation Demo",
                style: TextStyle(fontSize: 30),),),
              Container(child: Text("Main Screen"),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: aboutScreen, child: Text('Go to about screen'))
            ],
          ),
        )
    );
  }
  void aboutScreen(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const
        AboutPage(title: 'About me!')),
    );
  }
}