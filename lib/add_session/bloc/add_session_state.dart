part of 'add_session_bloc.dart';

enum SubmissionStatus {initial, inProgress, success, failure}

final class AddSessionState extends Equatable {
  final SubmissionStatus status;
  final List<Exercise> allExercises;
  final List<Exercise> selectedExercises;

  const AddSessionState({
    this.status = SubmissionStatus.initial,
    this.allExercises = const <Exercise>[],
    this.selectedExercises = const <Exercise>[]
  });

  AddSessionState copyWith ({
    SubmissionStatus? status,
    List<Exercise>? allExercises,
    List<Exercise>? selectedExercises,
  }) {
    return AddSessionState(
      status: status ?? this.status,
      allExercises: allExercises ?? this.allExercises,
      selectedExercises: selectedExercises ?? this.selectedExercises,
    );
  }

  @override
  List<Object> get props => [status, allExercises, selectedExercises];
}
