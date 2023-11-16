import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workout/add_exercise/add_exercise.dart';
import 'package:workout_model/workout_model.dart';


part 'add_exercise_event.dart';
part 'add_exercise_state.dart';

class AddExerciseBloc extends Bloc<AddExerciseEvent, AddExerciseState> {
  final ExerciseRepository _exerciseRepository;

  AddExerciseBloc({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(const AddExerciseState()) {
    on<AddExerciseEvent>((AddExerciseEvent event, Emitter<AddExerciseState>emit) async {
      switch (event) {
        case AddExerciseNameChangedEvent():
          _handleAddExerciseNameChangedEvent(event, emit);
        case AddExerciseDescriptionChangedEvent():
          _handleAddExerciseDescriptionChangedEvent(event, emit);
        case AddExerciseRepsChangedEvent():
          _handleAddExerciseRepsChangedEvent(event, emit);
        case AddExerciseRestChangedEvent():
          _handleAddExerciseRestChangedEvent(event, emit);
        case AddExerciseSetsChangedEvent():
          _handleAddExerciseSetsChangedEvent(event, emit);
        case AddExerciseWeightChangedEvent():
          _handleAddExerciseWeightChangedEvent(event, emit);
        case AddExerciseSubmitEvent():
         await _handleAddExerciseSubmitEvent(event, emit);
      }
    });
  }

  void _handleAddExerciseNameChangedEvent(AddExerciseNameChangedEvent event, Emitter<AddExerciseState> emit) {
    final NameInput name = NameInput.dirty(value: event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([
          name,
          state.description,
          state.reps,
          state.rest,
          state.sets,
          state.weight,
        ]),
      ),
    );
  }

  void _handleAddExerciseDescriptionChangedEvent(AddExerciseDescriptionChangedEvent event, Emitter<AddExerciseState> emit) {
    final DescriptionInput description = DescriptionInput.dirty(value: event.description);
    emit(
      state.copyWith(
        description: description,
        isValid: Formz.validate([
          state.name,
          description,
          state.reps,
          state.rest,
          state.sets,
          state.weight,
        ]),
      ),
    );
  }

  void _handleAddExerciseRepsChangedEvent(AddExerciseRepsChangedEvent event, Emitter<AddExerciseState> emit) {
    final PosIntInput reps = PosIntInput.dirty(value: event.reps);
    emit(
      state.copyWith(
        reps: reps,
        isValid: Formz.validate([
          state.name,
          state.description,
          reps,
          state.rest,
          state.sets,
          state.weight,
        ]),
      ),
    );
  }

  void _handleAddExerciseRestChangedEvent(AddExerciseRestChangedEvent event, Emitter<AddExerciseState> emit) {
    final NonNegIntInput rest = NonNegIntInput.dirty(value: event.rest);
    emit(
      state.copyWith(
        rest: rest,
        isValid: Formz.validate([
          state.name,
          state.description,
          state.reps,
          rest,
          state.sets,
          state.weight,
        ]),
      ),
    );
  }

  void _handleAddExerciseSetsChangedEvent(AddExerciseSetsChangedEvent event, Emitter<AddExerciseState> emit) {
    final PosIntInput sets = PosIntInput.dirty(value: event.sets);
    emit(
      state.copyWith(
        sets: sets,
        isValid: Formz.validate([
          state.name,
          state.description,
          state.reps,
          state.rest,
          sets,
          state.weight,
        ]),
      ),
    );
  }

  void _handleAddExerciseWeightChangedEvent(AddExerciseWeightChangedEvent event, Emitter<AddExerciseState> emit) {
    final NonNegNumInput weight = NonNegNumInput.dirty(value: event.weight);
    emit(
      state.copyWith(
        weight: weight,
        isValid: Formz.validate([
          state.name,
          state.description,
          state.reps,
          state.rest,
          state.sets,
          weight,
        ]),
      ),
    );
  }

  Future<void> _handleAddExerciseSubmitEvent(AddExerciseSubmitEvent event, Emitter<AddExerciseState> emit) async {
    if(state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      Exercise exercise = Exercise(
        name: state.name.value,
        description: state.description.value,
        numberOfRepetitions: state.reps.value,
        restTimeInMinutes: state.rest.value,
        numberOfSets: state.sets.value,
        weightInKilograms: state.weight.value,
      );

      Either<RepositoryError, Exercise> result = await _exerciseRepository.create(exercise);

      result.match(
              (l) => emit(state.copyWith(status: FormzSubmissionStatus.failure)),
              (r) => emit(state.copyWith(status: FormzSubmissionStatus.success))
      );
    }

  }



}
