import 'package:freezed_annotation/freezed_annotation.dart';
import "package:workout_model/src/exceptions.dart";
import "package:workout_model/src/i_identifiable.dart";
import "package:workout_model/src/exercise_model.dart";

part 'workout_model_base.freezed.dart';
part 'workout_model_base.g.dart';

/// A set of mutually exclusive states that a [Workout] can be in.
enum WorkoutState {
  /// The workout has yet to be started.
  notStarted,
  /// The workout is in progress.
  running,
  /// The workout has paused and can be resumed.
  paused,
  /// The workout has finished.
  finished,
}

/// A workout consisting of a series of exercises.
@freezed
class Workout with _$Workout implements IIdentifiable {
  /// Whether the workout has not yet started.
  bool get _workoutHasNotStarted => startTime == null || state == WorkoutState.notStarted;

  /// Private constructor with no parameters.
  /// Used by Freezed to enable use of methods in this class.
  const Workout._();

  /// Private constructor with a parameter for [uuid].
  /// Only used for code generation with Freezed.
  @JsonSerializable(explicitToJson: true)
  // ignore: unused_element
  factory Workout._def({
    required UUID uuid,
    required WorkoutState state,
    required DateTime? startTime,
    required DateTime? stopTime,
    required DateTime? resumedTime,
    required Duration workoutDuration,
    required List<Exercise> exercises,
  }) = _Workout;

  /// Constructs a new [Workout] object and sets [uuid] to a random v4 UUID.
  factory Workout({
    required List<Exercise> exercises,
  }) {
    return _Workout(
      uuid: IIdentifiable.generateUuid(),
      state: WorkoutState.notStarted,
      startTime: null,
      stopTime: null,
      resumedTime: null,
      workoutDuration: Duration.zero,
      exercises: exercises,
    );
  }

  /// Constructs a new [Workout] object from [baseWorkout],
  /// copying it's exercises, and sets [uuid] to a random v4 UUID.
  factory Workout.copy({
    required Workout baseWorkout,
  }) {
    return _Workout(
      uuid: IIdentifiable.generateUuid(),
      state: WorkoutState.notStarted,
      startTime: null,
      stopTime: null,
      resumedTime: null,
      workoutDuration: Duration.zero,
      exercises: baseWorkout.exercises,
    );
  }

  /// Constructs a new [Workout] object from a Json object.
  factory Workout.fromJson(Map<String, Object?> json)
  => _$WorkoutFromJson(json);

  /// Adds an [Exercise] to this [Workout].
  Workout updateExercises(Exercise newExercise) {
    return copyWith(exercises: <Exercise>[...exercises, newExercise]);
  }

  /// Adds several [Exercise]s in a [List] to this [Workout].
  Workout updateExercisesWithSeveral(List<Exercise> newExercises) {
    return copyWith(exercises: <Exercise>[...exercises, ...newExercises]);
  }

  /// Removes an [Exercise] from [exercises] at [index].
  ///
  /// Throws [RangeError] if [index] is < 0 or >= [exercises.length].
  Workout removeExerciseAtIndex(int index) {
    List<Exercise> newExercises = <Exercise>[...exercises];
    newExercises.removeAt(index);
    return copyWith(exercises: newExercises);
  }

  /// Sets [state] to [WorkoutState.running] and [startTime] to the current time.
  ///
  /// Throws [WorkoutStateException] if [state] is not [WorkoutState.notStarted].
  Workout startWorkout() {
    if(state != WorkoutState.notStarted) {
      throw WorkoutStateException("Can not start a workout that is running, is paused, or is finished.");
    }

    return copyWith(state: WorkoutState.running, startTime: DateTime.now());
  }

  /// Sets [state] to [WorkoutState.paused], and updates [workoutDuration] accordingly.
  ///
  /// Throws [WorkoutStateException] if [state] is not [WorkoutState.running],
  /// or if [startTime] is [Null].
  Workout pauseWorkout() {
    if(_workoutHasNotStarted || state != WorkoutState.running) {
      throw WorkoutStateException("Can not pause a workout that has not started, is paused, or is finished.");
    }

    final DateTime currentTime = DateTime.now();
    Duration workoutDuration = this.workoutDuration;
    if(resumedTime == null) {
      workoutDuration += currentTime.difference(startTime!);
    } else {
      workoutDuration += currentTime.difference(resumedTime!);
    }
    return copyWith(state: WorkoutState.paused, workoutDuration: workoutDuration);
  }

  /// Sets [state] to [WorkoutState.running] and [resumedTime] to the current time.
  ///
  /// Throws [WorkoutStateException] if [state] is not [WorkoutState.paused].
  Workout resumeWorkout() {
    if(state != WorkoutState.paused) {
      throw WorkoutStateException("Can not resume a workout that has not started, is running, or is finished.");
    }

    final DateTime currentTime = DateTime.now();
    return copyWith(state: WorkoutState.running, resumedTime: currentTime);
  }

  /// Sets [state] to [WorkoutState.finished], sets [stopTime] to the current time,
  /// and updates [workoutDuration] accordingly.
  ///
  /// Throws [WorkoutStateException] if [state] is not [WorkoutState.running],
  /// or if [startTime] is [Null].
  Workout stopWorkout() {
    if(_workoutHasNotStarted || state != WorkoutState.running) {
      throw WorkoutStateException("Can not stop a workout that has not started, is paused, or is finished.");
    }

    final DateTime currentTime = DateTime.now();
    Duration workoutDuration = this.workoutDuration;
    if(resumedTime == null) {
      workoutDuration += currentTime.difference(startTime!);
    } else {
      workoutDuration += currentTime.difference(resumedTime!);
    }
    return copyWith(state: WorkoutState.finished, stopTime: currentTime, workoutDuration: workoutDuration);
  }

  /// Sets [state] to [WorkoutState.notStarted], and resets all recorded times.
  Workout resetWorkout() {
    return copyWith(state: WorkoutState.notStarted, startTime: null, stopTime: null, resumedTime: null, workoutDuration: Duration.zero);
  }
}
