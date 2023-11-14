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
          const Text("New session"),
        ],
        WorkoutState.running => [
          const Text("Running session"),
          Text(
              workout.startTime != null
                  ? "Started on: ${longFormatFormatter.format(workout.startTime!)}"
                  : "Not started yet"
          ),
        ],
        WorkoutState.paused => [
          const Text("Paused session"),
          Text(
              workout.startTime != null
                  ? "Started on: ${longFormatFormatter.format(workout.startTime!)}"
                  : "Not started yet"
          ),
        ],
        WorkoutState.finished => [
          const Text("Finished session"),
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