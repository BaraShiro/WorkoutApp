import 'package:flutter/material.dart';
import 'package:workout_model/workout_model.dart';

class ExerciseView extends StatelessWidget {
  final Exercise exercise;

  const ExerciseView({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: exerciseDetailsWidget(exercise, context),
    );
  }

  Widget exerciseDetailsWidget(Exercise exercise, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: ListTile(
          isThreeLine: true,
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(exercise.name),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exercise.description),
              Text("${exercise.weightInKilograms} Kg"),
              Text("${exercise.numberOfSets} sets with ${exercise.numberOfRepetitions} reps, ${exercise.restTimeInMinutes} min rest time "),
            ],
          ),
        ),
      ),
    );
  }
}
