import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workout_model/workout_model.dart';

part 'exercise_overview_event.dart';
part 'exercise_overview_state.dart';

class ExerciseOverviewBloc extends Bloc<ExerciseOverviewEvent, ExerciseOverviewState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseOverviewBloc({required exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(ExerciseOverviewInitial()) {
    on<ExerciseOverviewEvent>((ExerciseOverviewEvent event, Emitter<ExerciseOverviewState> emit) async {
      switch (event) {
        case GetAllExercisesEvent():
          await _handleGetAllExercisesEvent(event, emit);
        case AddExerciseEvent():
          await _handleAddExerciseEvent(event, emit);
        case DeleteExercisesEvent():
          await _handleDeleteExercisesEvent(event, emit);
      }
    });
  }

  Future<void> _handleGetAllExercisesEvent(GetAllExercisesEvent event, Emitter<ExerciseOverviewState> emit) async {
    Either<RepositoryError, List<Exercise>> result = await _exerciseRepository.list();

    result.match(
            (l) => emit(ExerciseOverviewGetFailure(error: l)),
            (r) => emit(ExerciseOverviewGetSuccess(exercises: r))
    );
  }

  Future<void> _handleAddExerciseEvent(AddExerciseEvent event, Emitter<ExerciseOverviewState> emit) async {

  }

  Future<void> _handleDeleteExercisesEvent(DeleteExercisesEvent event, Emitter<ExerciseOverviewState> emit) async {

  }
}
