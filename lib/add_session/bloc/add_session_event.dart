part of 'add_session_bloc.dart';

sealed class AddSessionEvent extends Equatable {
  const AddSessionEvent();

  @override
  List<Object> get props => [];
}

final class InitialEvent extends AddSessionEvent {}

final class AddExerciseToListEvent extends AddSessionEvent {
  final Exercise exercise;

  const AddExerciseToListEvent({required this.exercise});

  @override
  List<Object> get props => [exercise];
}

final class RemoveExerciseFromListEvent extends AddSessionEvent {
  final int index;

  const RemoveExerciseFromListEvent({required this.index});

  @override
  List<Object> get props => [index];
}

final class SubmitEvent extends AddSessionEvent {}
