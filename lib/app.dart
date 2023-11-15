import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout/dashboard/dashboard.dart';
import 'package:workout/dashboard/view/dashboard_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout',
      theme: ThemeData(
        useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        // primarySwatch: Colors.lightBlue,
      ),
      home: DashboardPage(),
    );
  }

}