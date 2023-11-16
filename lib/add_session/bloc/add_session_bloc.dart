import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workout_model/workout_model.dart';

part 'add_session_event.dart';

part 'add_session_state.dart';

class AddSessionBloc extends Bloc<AddSessionEvent, AddSessionState> {
  final WorkoutRepository _workoutRepository;
  final ExerciseRepository _exerciseRepository;

  AddSessionBloc(
      {required WorkoutRepository workoutRepository,
      required ExerciseRepository exerciseRepository})
      : _workoutRepository = workoutRepository,
        _exerciseRepository = exerciseRepository,
        super(const AddSessionState()) {
    on<AddSessionEvent>((AddSessionEvent event, Emitter<AddSessionState> emit) async {
      switch (event) {
        case InitialEvent():
        _handleInitialEvent(event, emit);
        case AddExerciseToListEvent():
          _handleAddExerciseToListEvent(event, emit);
        case RemoveExerciseFromListEvent():
          _handleRemoveExerciseFromListEvent(event, emit);
        case SubmitEvent():
          _handleSubmitEvent(event, emit);
      }
    });
  }

  Future<void> _handleInitialEvent(event, emit) async {
    Either<RepositoryError, List<Exercise>> result = await _exerciseRepository.list();

    result.match(
            (l) => emit(state), // TODO: Error handling
            (r) => emit(state.copyWith(allExercises: r))
    );
  }

  void _handleAddExerciseToListEvent(AddExerciseToListEvent event, Emitter<AddSessionState> emit) {
    state.selectedExercises.add(event.exercise);
    emit(state.copyWith(selectedExercises: state.selectedExercises));
  }

  void _handleRemoveExerciseFromListEvent(RemoveExerciseFromListEvent event, Emitter<AddSessionState> emit) {
    state.selectedExercises.removeAt(event.index);
    emit(state.copyWith(selectedExercises: state.selectedExercises));
  }

  Future<void> _handleSubmitEvent(SubmitEvent event, Emitter<AddSessionState> emit) async {
    emit(state.copyWith(status: SubmissionStatus.inProgress));

    Workout workout = Workout(exercises: state.selectedExercises);

    Either<RepositoryError, Workout> result = await _workoutRepository.create(workout);

    result.match(
            (l) => emit(state.copyWith(status: SubmissionStatus.failure)),
            (r) => emit(state.copyWith(status: SubmissionStatus.success))
    );
  }
}
