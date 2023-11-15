import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workout_model/workout_model.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseBloc({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(ExerciseInitial()) {
    on<ExerciseEvent>((ExerciseEvent event, Emitter<ExerciseState> emit) async {
      switch (event) {

        case ExerciseInitEvent():
          await _handleExerciseInitEvent(event, emit);
        case ExerciseGetEvent():
          await _handleExerciseGetEvent(event, emit);
      }
    });
  }

  _handleExerciseInitEvent(ExerciseInitEvent event, Emitter<ExerciseState> emit) async {
    emit(ExerciseGetInProgress());

    Either<RepositoryError, Exercise> result = await _exerciseRepository.read(event.exerciseUuid);

    result.match(
            (l) => emit(ExerciseGetFailure(error: l)),
            (r) => emit(ExerciseGetSuccess(exercise: r))
    );
  }

  _handleExerciseGetEvent(ExerciseGetEvent event, Emitter<ExerciseState> emit) async {
    emit(ExerciseGetInProgress());

    Either<RepositoryError, Exercise> result = await _exerciseRepository.read(event.exerciseUuid);

    result.match(
            (l) => emit(ExerciseGetFailure(error: l)),
            (r) => emit(ExerciseGetSuccess(exercise: r))
    );
  }
}
