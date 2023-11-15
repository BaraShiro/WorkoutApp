import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_model/workout_model.dart';
import 'package:workout/exercise_overview/exercise_overview.dart';
import 'package:workout/exercise/exercise.dart';

class ExerciseOverviewCardWidget extends StatelessWidget {
  final Exercise exercise;

  const ExerciseOverviewCardWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(50),
        onTap: () => Navigator.push(context, ExercisePage.route(exercise.uuid))
            .whenComplete(
              () => context.read<ExerciseOverviewBloc>().add(GetAllExercisesEvent()),
        ),
        child: ListTile(
          isThreeLine: true,
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(
            Icons.fitness_center,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ),
          title: Text(exercise.name),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.description),
                Text("${exercise.numberOfSets} ${exercise.numberOfRepetitions} ${exercise.restTimeInMinutes} ${exercise.weightInKilograms}"),
              ],
          ),
          trailing: IconButton(
              onPressed: () => context.read<ExerciseOverviewBloc>().add(DeleteExercisesEvent(exerciseUuid: exercise.uuid)),
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              )
          ),
        ),
      ),
    );
  }

}