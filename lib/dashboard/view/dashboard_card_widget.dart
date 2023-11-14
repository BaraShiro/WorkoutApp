import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_model/workout_model.dart';
import 'package:workout/dashboard/dashboard.dart';
import 'package:workout/session/session.dart';

class DashboardCardWidget extends StatelessWidget {
  final Workout workout;

  const DashboardCardWidget({super.key, required this.workout});

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
        onTap: () => Navigator.push(context, SessionPage.route(workout.uuid))
            .whenComplete(
                () => context.read<DashboardBloc>().add(GetAllSessionsEvent()),
        ),
        child: ListTile(
          isThreeLine: true,
          leading: Icon(
            Icons.directions_run,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ),
          title: switch (workout.state) {
            WorkoutState.notStarted => const Text("New session"),
            WorkoutState.running => const Text("Running session"),
            WorkoutState.paused => const Text("Paused session"),
            WorkoutState.finished => const Text("Finished session"),
          },
          // subtitle: Text('Number of exercises: ${workout.exercises.length} \n$startedOn'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Number of exercises: ${workout.exercises.length}'),
              switch (workout.state) {
                WorkoutState.notStarted => Text("Not started yet"),
                WorkoutState.running => Text(
                    workout.startTime != null
                        ? "Started on: ${shortFormatFormatter.format(workout.startTime!)}"
                        : "Not started yet"
                ),
                WorkoutState.paused => Text(
                    workout.startTime != null
                        ? "Started on: ${shortFormatFormatter.format(workout.startTime!)}"
                        : "Not started yet"
                ),
                WorkoutState.finished => Text(
                    workout.stopTime != null
                        ? "Finished on: ${shortFormatFormatter.format(workout.stopTime!)}"
                        : "Not finished yet"
                ),
              },
            ]
          ),
          trailing: IconButton(
              onPressed: () => context.read<DashboardBloc>().add(DeleteSessionEvent(uuid: workout.uuid)),
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