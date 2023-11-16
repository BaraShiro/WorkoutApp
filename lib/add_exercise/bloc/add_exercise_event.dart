part of 'add_exercise_bloc.dart';

sealed class AddExerciseEvent extends Equatable {
  const AddExerciseEvent();

  @override
  List<Object> get props => [];
}

final class AddExerciseNameChangedEvent extends AddExerciseEvent {
  final String name;

  const AddExerciseNameChangedEvent({required this.name});

  @override
  List<Object> get props => [name];
}

final class AddExerciseDescriptionChangedEvent extends AddExerciseEvent {
  final String description;

  const AddExerciseDescriptionChangedEvent({required this.description});

  @override
  List<Object> get props => [description];
}

final class AddExerciseRepsChangedEvent extends AddExerciseEvent {
  final int reps;

  const AddExerciseRepsChangedEvent({required this.reps});

  @override
  List<Object> get props => [reps];
}

final class AddExerciseRestChangedEvent extends AddExerciseEvent {
  final int rest;

  const AddExerciseRestChangedEvent({required this.rest});

  @override
  List<Object> get props => [rest];
}

final class AddExerciseSetsChangedEvent extends AddExerciseEvent {
  final int sets;

  const AddExerciseSetsChangedEvent({required this.sets});

  @override
  List<Object> get props => [sets];
}

final class AddExerciseWeightChangedEvent extends AddExerciseEvent {
  final double weight;

  const AddExerciseWeightChangedEvent({required this.weight});

  @override
  List<Object> get props => [weight];
}

final class AddExerciseSubmitEvent extends AddExerciseEvent {}