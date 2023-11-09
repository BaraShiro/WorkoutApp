import 'dart:convert';
import 'dart:io';
import 'package:workout_model/src/hive_repository.dart';
import 'package:workout_model/workout_model.dart';

void main() async {
  final String path = Directory.current.path;
  final JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final Duration duration = const Duration(seconds: 1);

  print("Creating repositories...");
  final ExerciseRepository exerciseRepository = ExerciseRepository.instance;
  final WorkoutRepository workoutRepository = WorkoutRepository.instance;
  await exerciseRepository.initialize(filePath: path);
  await workoutRepository.initialize(filePath: path);
  print("Done!");

  print("");
  print("Create an exercise and store it, read it back and print it. Print any errors.");
  Exercise exercise1 = Exercise(
    name:"An exercise",
    description: "Some exercise that can be done",
    numberOfRepetitions: 4,
    restTimeInMinutes: 1,
    numberOfSets: 5,
    weightInKilograms: 20.0
  );

  await exerciseRepository.create(exercise1).then((value) =>
      value.match(
              (l) => print(l.toString()),
              (r) => null
      )
  );

  await exerciseRepository.read(exercise1.uuid).then((value) =>
      value.match(
              (error) => print(error.toString()),
              (exercise) => print(encoder.convert(exercise.toJson()))
      )
  );

  print("");
  print("Copy and modify an exercise and store it, read it back and print it. Print any errors.");
  Exercise exercise2 = Exercise.copy(exercise1);
  exercise2 = exercise2
      .updateName("An updated exercise")
      .updateNumberOfRepetitions(8);

  await exerciseRepository.create(exercise2).then((value) =>
      value.match(
              (error) => print(error.toString()),
              (exercise) => null
      )
  );

  await exerciseRepository.read(exercise2.uuid).then((value) =>
      value.match(
              (error) => print(error.toString()),
              (exercise) => print(encoder.convert(exercise.toJson()))
      )
  );

  print("");
  print("Create a workout, add both exercises, store it, read it back and print it. Print any errors.");
  Workout workout1 = Workout(exercises: <Exercise>[]);
  workout1 = workout1.updateExercisesWithSeveral([exercise1, exercise2]);

  await workoutRepository.create(workout1).then((value) =>
      value.match(
              (error) => print(error.toString()),
              (workout) => null
      )
  );

  await workoutRepository.read(workout1.uuid).then((value) =>
      value.match(
              (error) => print(error.toString()),
              (workout) => print(encoder.convert(workout.toJson()))
      )
  );

  print("");
  print("Start the workout, pause and resume it a couple of times, and then stop. Print the result.");


  print('Starting workout');
  workout1 = workout1.startWorkout();
  sleep(duration);
  print('Worked out for 1 second');

  print('Pausing workout');
  workout1 = workout1.pauseWorkout();
  sleep(duration);
  print('Paused for 1 second');

  print('Resuming workout');
  workout1 = workout1.resumeWorkout();
  sleep(duration);
  print('Worked out for 1 second');

  print('Pausing workout');
  workout1 = workout1.pauseWorkout();
  sleep(duration);
  print('Paused for 1 second');

  print('Resuming workout');
  workout1 = workout1.resumeWorkout();
  sleep(duration);
  print('Worked out for 1 second');
  print('Stopping workout');
  workout1 = workout1.stopWorkout();

  print(encoder.convert(workout1.toJson()));

  print("");
  print("Cleaning up...");
  await exerciseRepository.destroy();
  await workoutRepository.destroy();
  print("Done!");

}
