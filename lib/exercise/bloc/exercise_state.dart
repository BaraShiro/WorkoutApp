part of 'exercise_bloc.dart';

sealed class ExerciseState extends Equatable {
  const ExerciseState();

  @override
  List<Object> get props => [];
}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseGetInProgress extends ExerciseState {}

final class ExerciseGetSuccess extends ExerciseState {
  final Exercise exercise;

  const ExerciseGetSuccess({required this.exercise});

  @override
  List<Object> get props => [exercise];
}

final class ExerciseGetFailure extends ExerciseState {
  final RepositoryError error;

  const ExerciseGetFailure({required this.error});

  @override
  List<Object> get props => [error];
}
