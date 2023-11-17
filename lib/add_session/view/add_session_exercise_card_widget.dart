import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout_model/workout_model.dart';
import 'package:workout/add_session/add_session.dart';

class AddSessionExerciseCardWidget extends StatelessWidget {
  final Exercise exercise;
  final int index;

  const AddSessionExerciseCardWidget({super.key, required this.exercise, required this.index});

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
      child: ListTile(
        isThreeLine: true,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Icon(
          Symbols.exercise,
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
            onPressed: () => context.read<AddSessionBloc>().add(RemoveExerciseFromListEvent(index: index)),
            icon: Icon(
              Symbols.delete,
              color: Theme.of(context).colorScheme.error,
            )
        ),
      ),
    );
  }

}