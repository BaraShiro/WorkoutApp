part of 'session_bloc.dart';

sealed class SessionEvent extends Equatable {
  final UUID sessionUuid;
  const SessionEvent({required this.sessionUuid});

  @override
  List<Object?> get props => [sessionUuid];
}

final class SessionInitEvent extends SessionEvent {
  const SessionInitEvent({required super.sessionUuid});
}

final class SessionStartEvent extends SessionEvent {
  const SessionStartEvent({required super.sessionUuid});
}

final class SessionPauseEvent extends SessionEvent {
  const SessionPauseEvent({required super.sessionUuid});
}

final class SessionResumeEvent extends SessionEvent {
  const SessionResumeEvent({required super.sessionUuid});
}

final class SessionFinishEvent extends SessionEvent {
  const SessionFinishEvent({required super.sessionUuid});
}

final class SessionDeleteEvent extends SessionEvent {
  const SessionDeleteEvent({required super.sessionUuid});
}