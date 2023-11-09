/// Exception thrown if a name field is empty.
class EmptyNameException implements Exception {
  final String? msg;

  const EmptyNameException([this.msg]);

  @override
  String toString() => msg ?? 'EmptyNameException';
}

/// Exception thrown if a number is not allowed to be non positive, i.e. < 1.
class NonPositiveNumberException implements Exception {
  final String? msg;

  const NonPositiveNumberException([this.msg]);

  @override
  String toString() => msg ?? 'NonPositiveNumberException';
}

/// Exception thrown if a number is not allowed to be negative, i.e. < 0.
class NegativeNumberException implements Exception {
  final String? msg;

  const NegativeNumberException([this.msg]);
  @override
  String toString() => msg ?? 'NegativeNumberException';
}

/// Exception thrown if a [Workout] is in an unsupported state for an operation.
class WorkoutStateException implements Exception {
  final String? msg;

  const WorkoutStateException([this.msg]);
  @override
  String toString() => msg ?? 'WorkoutStateException';
}
