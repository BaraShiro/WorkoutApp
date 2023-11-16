part of 'add_exercise_bloc.dart';

final class AddExerciseState extends Equatable {
  final FormzSubmissionStatus status;
  final NameInput name;
  final DescriptionInput description;
  final PosIntInput reps;
  final NonNegIntInput rest;
  final PosIntInput sets;
  final NonNegNumInput weight;
  final bool isValid;

  const AddExerciseState({
    this.status = FormzSubmissionStatus.initial,
    this.name = const NameInput.pure(),
    this.description = const DescriptionInput.pure(),
    this.reps = const PosIntInput.pure(),
    this.rest = const NonNegIntInput.pure(),
    this.sets = const PosIntInput.pure(),
    this.weight = const NonNegNumInput.pure(),
    this.isValid = false,
  });

  AddExerciseState copyWith ({
    FormzSubmissionStatus? status,
    NameInput? name,
    DescriptionInput? description,
    PosIntInput? reps,
    NonNegIntInput? rest,
    PosIntInput? sets,
    NonNegNumInput? weight,
    bool? isValid,
  }) {
    return AddExerciseState(
      status: status ?? this.status,
      name: name ?? this.name,
      description: description ?? this.description,
      reps: reps ?? reps ?? this.reps,
      rest: rest ?? this.rest,
      sets: sets ?? this.sets,
      weight: weight ?? this.weight,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, name, description, reps, rest, sets, weight, isValid];
}
