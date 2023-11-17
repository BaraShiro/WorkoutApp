import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(100),
        onTap: () => Navigator.push(context, SessionPage.route(workout.uuid))
            .whenComplete(
          () => context.read<DashboardBloc>().add(GetAllSessionsEvent()),
        ),
        child: ListTile(
          isThreeLine: true,
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(
            Symbols.directions_run,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 48,
          ),
          title: switch (workout.state) {
            WorkoutState.notStarted => const Text("New session"),
            WorkoutState.running => const Text("Running session"),
            WorkoutState.paused => const Text("Paused session"),
            WorkoutState.finished => const Text("Finished session"),
          },
          subtitle:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Number of exercises: ${workout.exercises.length}'),
                    switch (workout.state) {
                    WorkoutState.notStarted => const Text("Not started yet"),
                      WorkoutState.running => Text(workout.startTime != null
                          ? "Started on: ${shortFormatFormatter.format(workout.startTime!)}"
                          : "Not started yet"),
                      WorkoutState.paused => Text(workout.startTime != null
                          ? "Started on: ${shortFormatFormatter.format(workout.startTime!)}"
                          : "Not started yet"),
                      WorkoutState.finished => Text(workout.stopTime != null
                          ? "Finished on: ${shortFormatFormatter.format(workout.stopTime!)}"
                          : "Not finished yet"),
                    },
                  ]
              ),
          trailing: IconButton(
              color: Theme.of(context).colorScheme.errorContainer,
              hoverColor: Theme.of(context).colorScheme.errorContainer,
              onPressed: () => context
                  .read<DashboardBloc>()
                  .add(DeleteSessionEvent(uuid: workout.uuid)),
              icon: Icon(
                Symbols.delete_forever,
                color: Theme.of(context).colorScheme.error,
              )),
        ),
      ),
    );
  }
}
