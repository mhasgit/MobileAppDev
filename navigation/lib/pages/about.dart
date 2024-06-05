import 'package:flutter/material.dart';
import 'package:navigation/pages/setting.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key, required this.title});
  final String title;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


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
              Container(child: Text("About Screen"),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: gotoHome,
                  child: Text("Back to main!")),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: gotoSetting,
                  child: Text("Go to Setting!"))
            ],
          ),
        )
    );
  }

  void gotoSetting(){
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => const
    SettingPage(title: 'Go to About page'))
    );
  }
  
  void gotoHome() {
    Navigator.pop(context);
  }
}