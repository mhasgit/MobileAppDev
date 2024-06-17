import 'package:bottomnavigation/pages/gallery.dart';
import 'package:bottomnavigation/pages/portfolio.dart';

import '/pages/home.dart';
import '/pages/settings.dart';
import '/pages/about.dart';

import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mobile App Development'),
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
  final List pages = [HomePage(), AboutPage(), SettingsPage(), GalleryPage(), Portfolio() ];
  int selectedPage = 0;

  void navChanged(int index) {

    setState(() {
      selectedPage= index;
    });
  }
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body:  pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: navChanged,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
                label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined),
          label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.browse_gallery),
              label: 'gallery'),
          BottomNavigationBarItem(
            icon: Icon(Icons.podcasts_rounded),
            label: 'Porfolio'
          )
        ],
      ),
    );
  }
}