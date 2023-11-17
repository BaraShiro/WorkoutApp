import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:workout_model/workout_model.dart';
import 'package:workout/session/session.dart';

class SessionControlWidget extends StatelessWidget {
  final Workout workout;

  const SessionControlWidget({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: switch (workout.state) {
        WorkoutState.notStarted => [
            FloatingActionButton.extended(
              onPressed: () => {
                context
                    .read<SessionBloc>()
                    .add(SessionStartEvent(sessionUuid: workout.uuid))
              },
              icon: const Icon(Symbols.play_arrow),
              label: const Text("Start"),
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
          ],
        WorkoutState.running => [
            FloatingActionButton.extended(
              onPressed: () => {
                context
                    .read<SessionBloc>()
                    .add(SessionPauseEvent(sessionUuid: workout.uuid))
              },
              icon: const Icon(Symbols.pause),
              label: const Text("Pause"),
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            const Padding(padding: EdgeInsets.all(12)),
            FloatingActionButton.extended(
              onPressed: () => {
                context
                    .read<SessionBloc>()
                    .add(SessionFinishEvent(sessionUuid: workout.uuid))
              },
              icon: const Icon(Symbols.stop),
              label: const Text("Finish"),
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
          ],
        WorkoutState.paused => [
            FloatingActionButton.extended(
              onPressed: () => {
                context
                    .read<SessionBloc>()
                    .add(SessionResumeEvent(sessionUuid: workout.uuid))
              },
              icon: const Icon(Symbols.resume),
              label: const Text("Resume"),
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
          ],
        WorkoutState.finished => [
            FloatingActionButton.extended(
              onPressed: () => {
                context
                    .read<SessionBloc>()
                    .add(SessionResetEvent(sessionUuid: workout.uuid))
              },
              icon: const Icon(Symbols.replay),
              label: const Text("Reset"),
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
          ],
      },
    );
  }
}
