import 'package:flutter/material.dart';
import 'package:workout/exercise/exercise.dart';
import 'package:workout_model/workout_model.dart';

class ExerciseView extends StatelessWidget {
  final Exercise exercise;

  const ExerciseView({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: exerciseDetailsWidget(exercise, context),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   onPressed: () => {context.read<DashboardBloc>().add(AddSessionEvent(workout: Workout(exercises: [Exercise(name: "Exercise", description: "Something", numberOfRepetitions: 2, restTimeInMinutes: 1, numberOfSets: 2, weightInKilograms: 5)])))},
      //   label: const Text("New workout session"),
      //   icon: const Icon(Icons.add),
      // ),
    );
  }

  Widget exerciseDetailsWidget(Exercise exercise, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(exercise.name),
          Text(exercise.description),
          Text("${exercise.weightInKilograms} Kg"),
          Text("${exercise.numberOfSets} sets with ${exercise.numberOfRepetitions} reps, ${exercise.restTimeInMinutes} min rest time "),
        ],
      ),
    );
  }

}