part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

final class DashboardInProgress extends DashboardState {}

final class DashboardSuccess extends DashboardState {
  final List<Workout> workouts;

  DashboardSuccess({required this.workouts});

  @override
  List<Object> get props => [workouts];
}

final class DashboardFailure extends DashboardState {
  final RepositoryError error;

  DashboardFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class DashboardInitial extends DashboardState {}

final class DashboardListSessionsInProgress extends DashboardInProgress {}

final class DashboardListSessionsSuccess extends DashboardSuccess {
  DashboardListSessionsSuccess({required super.workouts});
}

final class DashboardListSessionsFailure extends DashboardFailure {
  DashboardListSessionsFailure({required super.error});
}

final class DashboardAddSessionInProgress extends DashboardInProgress {}

final class DashboardAddSessionSuccess extends DashboardSuccess {
  DashboardAddSessionSuccess({required super.workouts});
}

final class DashboardAddSessionFailure extends DashboardFailure {
  DashboardAddSessionFailure({required super.error});
}

final class DashboardDeleteSessionInProgress extends DashboardInProgress {}

final class DashboardDeleteSessionSuccess extends DashboardSuccess {
  DashboardDeleteSessionSuccess({required super.workouts});
}

final class DashboardDeleteSessionFailure extends DashboardFailure {
  DashboardDeleteSessionFailure({required super.error});
}