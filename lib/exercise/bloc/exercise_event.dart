part of 'exercise_bloc.dart';

sealed class ExerciseEvent extends Equatable {
  final UUID exerciseUuid;

  const ExerciseEvent({required this.exerciseUuid});

  @override
  List<Object?> get props => [exerciseUuid];
}

final class ExerciseInitEvent extends ExerciseEvent {
  const ExerciseInitEvent({required super.exerciseUuid});
}

final class ExerciseGetEvent extends ExerciseEvent {
  const ExerciseGetEvent({required super.exerciseUuid});
}
