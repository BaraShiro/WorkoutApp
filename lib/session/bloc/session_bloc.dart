import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workout_model/workout_model.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final WorkoutRepository _workoutRepository;

  SessionBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(SessionInitial()) {
    on<SessionEvent>((SessionEvent event, Emitter<SessionState> emit) async {
      switch (event) {
        case SessionInitEvent():
          await _handleSessionInitEvent(event: event, emit: emit);
        case SessionStartEvent():
          await _handleSessionStartEvent(event: event, emit: emit);
        case SessionPauseEvent():
          await _handleSessionPauseEvent(event: event, emit: emit);
        case SessionResumeEvent():
          await _handleSessionResumeEvent(event: event, emit: emit);
        case SessionFinishEvent():
          await _handleSessionFinishEvent(event: event, emit: emit);
        case SessionDeleteEvent():
          await _handleSessionDeleteEvent(event: event, emit: emit);
      }
    });
  }

  Future<void> _handleSessionInitEvent({required SessionInitEvent event, required Emitter<SessionState> emit}) async {
    emit(SessionGetInProgress());

    Either<RepositoryError, Workout> readResult = await _workoutRepository.read(event.sessionUuid);

    readResult.match(
            (l) => emit(SessionGetFailure(error: l)),
            (r) => emit(SessionGetSuccess(workout: r))
    );
  }

  Future<void> _handleSessionStartEvent({required SessionStartEvent event, required Emitter<SessionState> emit}) async {
    emit(SessionGetInProgress());

    Either<RepositoryError, Workout> readResult = await _workoutRepository.read(event.sessionUuid);

    await readResult.match(
            (l) async => emit(SessionGetFailure(error: l)),
            (r) async {
              Workout modifiedWorkout = r.startWorkout();
              Either<RepositoryError, Workout> updateResult = await _workoutRepository.update(event.sessionUuid, modifiedWorkout);

              updateResult.match(
                      (l) => emit(SessionGetFailure(error: l)),
                      (r) => emit(SessionGetSuccess(workout: r))
              );
            }
    );
  }

  Future<void> _handleSessionPauseEvent({required SessionPauseEvent event, required Emitter<SessionState> emit}) async {
    emit(SessionGetInProgress());

    Either<RepositoryError, Workout> readResult = await _workoutRepository.read(event.sessionUuid);

    await readResult.match(
            (l) async => emit(SessionGetFailure(error: l)),
            (r) async {
          Workout modifiedWorkout = r.pauseWorkout();
          Either<RepositoryError, Workout> updateResult = await _workoutRepository.update(event.sessionUuid, modifiedWorkout);

          updateResult.match(
                  (l) => emit(SessionGetFailure(error: l)),
                  (r) => emit(SessionGetSuccess(workout: r))
          );
        }
    );
  }

  Future<void> _handleSessionResumeEvent({required SessionResumeEvent event, required Emitter<SessionState> emit}) async {
    emit(SessionGetInProgress());

    Either<RepositoryError, Workout> readResult = await _workoutRepository.read(event.sessionUuid);

    await readResult.match(
            (l) async => emit(SessionGetFailure(error: l)),
            (r) async {
          Workout modifiedWorkout = r.resumeWorkout();
          Either<RepositoryError, Workout> updateResult = await _workoutRepository.update(event.sessionUuid, modifiedWorkout);

          updateResult.match(
                  (l) => emit(SessionGetFailure(error: l)),
                  (r) => emit(SessionGetSuccess(workout: r))
          );
        }
    );
  }

  Future<void> _handleSessionFinishEvent({required SessionFinishEvent event, required Emitter<SessionState> emit}) async {
    emit(SessionGetInProgress());

    Either<RepositoryError, Workout> readResult = await _workoutRepository.read(event.sessionUuid);

    await readResult.match(
            (l) async => emit(SessionGetFailure(error: l)),
            (r) async {
          Workout modifiedWorkout = r.stopWorkout();
          Either<RepositoryError, Workout> updateResult = await _workoutRepository.update(event.sessionUuid, modifiedWorkout);

          updateResult.match(
                  (l) => emit(SessionGetFailure(error: l)),
                  (r) => emit(SessionGetSuccess(workout: r))
          );
        }
    );
  }

  Future<void> _handleSessionDeleteEvent({required SessionDeleteEvent event, required Emitter<SessionState> emit}) async {
    // TODO: remove
  }
}
