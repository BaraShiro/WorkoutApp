import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout/dashboard/dashboard.dart';
import 'package:workout/dashboard/view/dashboard_page.dart';
import 'package:workout/loading/loading.dart';
import 'package:workout_model/workout_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: DashboardPage(),
    );
  }

}