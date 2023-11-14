import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:workout_model/workout_model.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WorkoutRepository _workoutRepository;

  DashboardBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(DashboardInitial()) {
    on<DashboardEvent>((DashboardEvent event, Emitter<DashboardState> emit) async {
      switch (event) {
        case GetAllSessionsEvent():
          await _handleGetAllSessionsEvent(event: event, emit: emit);
        case AddSessionEvent():
          await _handleAddSessionEvent(event: event, emit: emit);
        case DeleteSessionEvent():
          await _handleDeleteSessionEvent(event: event, emit: emit);
      }
    });
  }

  Future<void> _handleGetAllSessionsEvent({required GetAllSessionsEvent event, required Emitter<DashboardState> emit}) async {
    emit(DashboardListSessionsInProgress());
    Either<RepositoryError, List<Workout>> result = await _workoutRepository.list();

    result.match(
            (l) => emit(DashboardListSessionsFailure(error: l)),
            (r) => emit(DashboardListSessionsSuccess(workouts: r))
    );
  }

  Future<void> _handleAddSessionEvent({required AddSessionEvent event, required Emitter<DashboardState> emit}) async {
    emit(DashboardAddSessionInProgress());

    Either<RepositoryError, Workout> addResult = await _workoutRepository.create(event.workout);

    await addResult.match(
            (l) async => emit(DashboardAddSessionFailure(error: l)),
            (r) async {
              Either<RepositoryError, List<Workout>> listResult = await _workoutRepository.list();

              listResult.match(
                      (l) => emit(DashboardAddSessionFailure(error: l)),
                      (r) => emit(DashboardAddSessionSuccess(workouts: r))
              );
            }
    );
  }

  Future<void> _handleDeleteSessionEvent({required DeleteSessionEvent event, required Emitter<DashboardState> emit}) async {
    emit(DashboardDeleteSessionInProgress());

    Option<RepositoryError> removeResult = await _workoutRepository.delete(event.uuid);

    await removeResult.match(
            () async {
              Either<RepositoryError, List<Workout>> listResult = await _workoutRepository.list();

              listResult.match(
                      (l) => emit(DashboardDeleteSessionFailure(error: l)),
                      (r) => emit(DashboardDeleteSessionSuccess(workouts: r))
              );
            },
            (t) async => emit(DashboardDeleteSessionFailure(error: t))
    );
  }
}
