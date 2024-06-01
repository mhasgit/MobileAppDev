import 'package:flutter/material.dart';
import 'iq_test_screen.dart';
import 'results_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('IQ Checker'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'IQ Tests'),
              Tab(text: 'Results'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IQTestScreen(),
            ResultsScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
