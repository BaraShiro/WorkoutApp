import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          TextButton.icon(
            onPressed: () => {context.read<SessionBloc>().add(SessionStartEvent(sessionUuid: workout.uuid))},
            icon: const Icon(Icons.play_arrow),
            label: const Text("Start"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary
            ),
          ),
        ],
        WorkoutState.running => [
          TextButton.icon(
            onPressed: () => {context.read<SessionBloc>().add(SessionPauseEvent(sessionUuid: workout.uuid))},
            icon: const Icon(Icons.pause),
            label: const Text("Pause"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary
            ),
          ),
          TextButton.icon(
            onPressed: () => {context.read<SessionBloc>().add(SessionFinishEvent(sessionUuid: workout.uuid))},
            icon: const Icon(Icons.stop),
            label: const Text("Finish"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary
            ),
          ),
        ],
        WorkoutState.paused => [
          TextButton.icon(
            onPressed: () => {context.read<SessionBloc>().add(SessionResumeEvent(sessionUuid: workout.uuid))},
            icon: const Icon(Icons.play_arrow_outlined),
            label: const Text("Resume"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary
            ),
          ),
        ],
        WorkoutState.finished => [
          TextButton.icon(
            onPressed: () => {context.read<SessionBloc>().add(SessionInitEvent(sessionUuid: workout.uuid))},
            icon: const Icon(Icons.replay),
            label: const Text("Reset"),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary
            ),
          ),
        ],
      },
    );
  }

}