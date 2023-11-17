import 'package:flutter/material.dart';
import 'package:workout_model/workout_model.dart';
import 'package:workout/session/session.dart';

class SessionStatusWidget extends StatelessWidget {
  final Workout workout;

  const SessionStatusWidget({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: switch (workout.state) {
        WorkoutState.notStarted => [
          Text(
            "New session",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
        WorkoutState.running => [
          Text(
            "Running session",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
              workout.startTime != null
                  ? "Started on: ${longFormatFormatter.format(workout.startTime!)}"
                  : "Not started yet"
          ),
        ],
        WorkoutState.paused => [
          Text(
            "Paused session",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
              workout.startTime != null
                  ? "Started on: ${longFormatFormatter.format(workout.startTime!)}"
                  : "Not started yet"
          ),
        ],
        WorkoutState.finished => [
          Text(
            "Finished session",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
              workout.startTime != null
                  ? "Started on: ${longFormatFormatter.format(workout.startTime!)}"
                  : "Not started yet"
          ),
          Text(
              workout.startTime != null
                  ? "Finished on: ${longFormatFormatter.format(workout.stopTime!)}"
                  : "Not finished yet"
          ),
          Text("Workout duration: ${durationString(workout.workoutDuration)}"),
        ],
      },
    );
  }

}