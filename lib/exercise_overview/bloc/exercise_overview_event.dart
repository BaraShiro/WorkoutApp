part of 'exercise_overview_bloc.dart';

sealed class ExerciseOverviewEvent extends Equatable {
  const ExerciseOverviewEvent();

  @override
  List<Object> get props => [];
}

final class GetAllExercisesEvent extends ExerciseOverviewEvent {}

final class AddExerciseEvent extends ExerciseOverviewEvent {
  final Exercise exercise;

  const AddExerciseEvent({required this.exercise});

  @override
  List<Object> get props => [exercise];
}

final class DeleteExercisesEvent extends ExerciseOverviewEvent {
  final UUID exerciseUuid;

  const DeleteExercisesEvent({required this.exerciseUuid});

  @override
  List<Object> get props => [exerciseUuid];
}