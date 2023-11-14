part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInProgress extends DashboardState {}

final class DashboardSuccess extends DashboardState {
  final List<Workout> workouts;

  const DashboardSuccess({required this.workouts});

  @override
  List<Object> get props => [workouts];
}

final class DashboardFailure extends DashboardState {
  final RepositoryError error;

  const DashboardFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class DashboardInitial extends DashboardState {}

final class DashboardListSessionsInProgress extends DashboardInProgress {}

final class DashboardListSessionsSuccess extends DashboardSuccess {
  const DashboardListSessionsSuccess({required super.workouts});
}

final class DashboardListSessionsFailure extends DashboardFailure {
  const DashboardListSessionsFailure({required super.error});
}

final class DashboardAddSessionInProgress extends DashboardInProgress {}

final class DashboardAddSessionSuccess extends DashboardSuccess {
  const DashboardAddSessionSuccess({required super.workouts});
}

final class DashboardAddSessionFailure extends DashboardFailure {
  const DashboardAddSessionFailure({required super.error});
}

final class DashboardDeleteSessionInProgress extends DashboardInProgress {}

final class DashboardDeleteSessionSuccess extends DashboardSuccess {
  const DashboardDeleteSessionSuccess({required super.workouts});
}

final class DashboardDeleteSessionFailure extends DashboardFailure {
  const DashboardDeleteSessionFailure({required super.error});
}