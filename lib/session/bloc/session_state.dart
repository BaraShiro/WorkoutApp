part of 'session_bloc.dart';

@immutable
sealed class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

final class SessionInitial extends SessionState {}

final class SessionGetInProgress extends SessionState {}

final class SessionGetSuccess extends SessionState {
  final Workout workout;

  const SessionGetSuccess({required this.workout});

  @override
  List<Object> get props => [workout];
}

final class SessionGetFailure extends SessionState {
  final RepositoryError error;

  const SessionGetFailure({required this.error});

  @override
  List<Object> get props => [error];
}