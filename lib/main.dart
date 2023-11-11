import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_model/workout_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Needs to run before getApplicationDocumentsDirectory()
  Directory documentsDirectory = await getApplicationDocumentsDirectory(); // Platform agnostic document path
  await ExerciseRepository.instance.initialize(filePath: documentsDirectory.path);
  await WorkoutRepository.instance.initialize(filePath: documentsDirectory.path);

  runApp(const App());
}
