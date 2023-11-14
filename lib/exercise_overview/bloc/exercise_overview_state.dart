part of 'exercise_overview_bloc.dart';

sealed class ExerciseOverviewState extends Equatable {
  const ExerciseOverviewState();

  @override
  List<Object> get props => [];
}

final class ExerciseOverviewInitial extends ExerciseOverviewState {}

final class ExerciseOverviewGetInProgress extends ExerciseOverviewState {}

final class ExerciseOverviewGetSuccess extends ExerciseOverviewState {
  final List<Exercise> exercises;

  const ExerciseOverviewGetSuccess({required this.exercises});

  @override
  List<Object> get props => [exercises];
}

final class ExerciseOverviewGetFailure extends ExerciseOverviewState {
  final RepositoryError error;

  const ExerciseOverviewGetFailure({required this.error});

  @override
  List<Object> get props => [error];
}
