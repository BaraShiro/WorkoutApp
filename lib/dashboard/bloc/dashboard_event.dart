part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

final class GetAllSessionsEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

final class AddSessionEvent extends DashboardEvent {
  final Workout workout;

  const AddSessionEvent({required this.workout});
  @override
  List<Object?> get props => [workout];
}

final class DeleteSessionEvent extends DashboardEvent {
  final String uuid;

  const DeleteSessionEvent({required this.uuid});
  @override
  List<Object?> get props => [uuid];
}