part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

final class GetAllSessionsEvent extends DashboardEvent {}

final class AddSessionEvent extends DashboardEvent {
  final Workout workout;

  const AddSessionEvent({required this.workout});
  @override
  List<Object?> get props => [workout];
}

final class DeleteSessionEvent extends DashboardEvent {
  final UUID uuid;

  const DeleteSessionEvent({required this.uuid});
  @override
  List<Object?> get props => [uuid];
}