import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(100),
        onTap: () => Navigator.push(context, ExercisePage.route(exercise.uuid))
            .whenComplete(
              () => context.read<ExerciseOverviewBloc>().add(GetAllExercisesEvent()),
        ),
        child: ListTile(
          isThreeLine: true,
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(
            Symbols.exercise,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 48,
          ),
          title: Text(exercise.name),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.description),
                Text("${exercise.weightInKilograms} Kg"),
                Text("${exercise.numberOfSets} sets with ${exercise.numberOfRepetitions} reps, ${exercise.restTimeInMinutes} min rest time "),
              ],
          ),
          trailing: IconButton(
              onPressed: () => context.read<ExerciseOverviewBloc>().add(DeleteExercisesEvent(exerciseUuid: exercise.uuid)),
              icon: Icon(
                Symbols.delete_forever,
                color: Theme.of(context).colorScheme.error,
              )
          ),
        ),
      ),
    );
  }

}