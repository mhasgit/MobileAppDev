import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(title: Text('Our Portfolio')),
      body: Column(
        children: [
          Text('Hi From Porfolio')
        ],
      ),
    );
  }
}