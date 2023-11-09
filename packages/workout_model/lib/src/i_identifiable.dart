import 'package:uuid/uuid.dart';

typedef UUID = String;

/// Something that's identifiable by a universally unique identifier.
abstract interface class IIdentifiable {
  final UUID uuid = generateUuid();

  /// Generates a random version 4 universally unique identifier.
  static UUID generateUuid() {
    final uuid = Uuid();
    return uuid.v4();
  }
}