import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.title});
  final String title;

  @override
  State<SettingPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<SettingPage> {


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
              Container(child: Text("Setting Screen"),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: gotoHome,
                  child: Text("Back to About!"))
            ],
          ),
        )
    );
  }

  void gotoHome() {
    Navigator.pop(context);
  }
}