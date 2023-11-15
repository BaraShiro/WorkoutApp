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
      mainAxisAlignment: MainAxisAlignment.center,
      children: switch (workout.state) {
        WorkoutState.notStarted => [
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextButton.icon(
              onPressed: () => {context.read<SessionBloc>().add(SessionStartEvent(sessionUuid: workout.uuid))},
              icon: const Icon(Symbols.play_arrow),
              label: const Text("Start"),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer
              ),
            ),
          ),
        ],
        WorkoutState.running => [
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextButton.icon(
              onPressed: () => {context.read<SessionBloc>().add(SessionPauseEvent(sessionUuid: workout.uuid))},
              icon: const Icon(Symbols.pause),
              label: const Text("Pause"),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextButton.icon(
              onPressed: () => {context.read<SessionBloc>().add(SessionFinishEvent(sessionUuid: workout.uuid))},
              icon: const Icon(Symbols.stop),
              label: const Text("Finish"),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer
              ),
            ),
          ),
        ],
        WorkoutState.paused => [
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextButton.icon(
              onPressed: () => {context.read<SessionBloc>().add(SessionResumeEvent(sessionUuid: workout.uuid))},
              icon: const Icon(Symbols.resume),
              label: const Text("Resume"),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer
              ),
            ),
          ),
        ],
        WorkoutState.finished => [
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextButton.icon(
              onPressed: () => {context.read<SessionBloc>().add(SessionInitEvent(sessionUuid: workout.uuid))},
              icon: const Icon(Symbols.replay),
              label: const Text("Reset"),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer
              ),
            ),
          ),
        ],
      },
    );
  }

}