import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:workout_model/src/i_identifiable.dart';
import 'package:workout_model/src/exercise_model.dart';
import 'package:workout_model/src/workout_model_base.dart';

/// Represents an error that can occur when using a [HiveRepository].
enum RepositoryError {
  /// The supplied [UUID] was not found in the Hive database.
  notFoundError,
  /// The supplied [UUID] does already exist in the Hive database.
  alreadyExistsError,
  /// Failed to access the Hive database.
  databaseError,
  /// An unknown error occurred.
  unknownError,
}

/// Abstract base class for a repository that uses Hive for persistence.
abstract class HiveRepository<T extends IIdentifiable> {
  abstract String _collectionName;
  late Box<String> box;

  /// Abstract method for serializing an object of type [T] into a [String].
  String serialize(T item);

  /// Abstract method for deserializing a [String] into an object of type [T].
  T deserialize(String serializedItem);

  /// Initializer that sets up and opens a Hive box.
  Future<void> initialize({required String filePath}) async {
    Hive.init('$filePath/hive');
    box = await Hive.openBox<String>(_collectionName);
  }

  /// Creates a new key - value pair in the database, with [item.uuid]
  /// as kay and [item] as value.
  ///
  /// Returns an [Either] containing [item] if no error occurred.
  /// Otherwise an [Either] containing a [RepositoryError].
  Future<Either<RepositoryError, T>> create(T item) async {
    try {
      if (box.containsKey(item.uuid)) {
        return Either<RepositoryError, T>.left(RepositoryError.alreadyExistsError);
      }
      await box.put(item.uuid, serialize(item));
      return Either<RepositoryError, T>.right(item);
    } catch (e) {
      return Either<RepositoryError, T>.left(RepositoryError.databaseError);
    }
  }

  /// Reads the value associated with the key [uuid] in the database.
  ///
  /// Returns an [Either] containing the value if no error occurred.
  /// Otherwise an [Either] containing a [RepositoryError].
  Future<Either<RepositoryError, T>> read(UUID uuid) async {
    try {
      final String? serializedItem = box.get(uuid);
      if (serializedItem == null) {
        return Either<RepositoryError, T>.left(RepositoryError.notFoundError);
      }
      return Either<RepositoryError, T>.right(deserialize(serializedItem));
    } catch (e) {
      return Either<RepositoryError, T>.left(RepositoryError.databaseError);
    }
  }

  /// Updates a key - value pair ijn the database.
  ///
  /// Returns an [Either] containing [item] if no error occurred.
  /// Otherwise an [Either] containing a [RepositoryError].
  Future<Either<RepositoryError, T>> update(UUID uuid, T item) async {
    try {
      if (!box.containsKey(uuid)) {
        return Either<RepositoryError, T>.left(RepositoryError.notFoundError);
      }
      await box.put(uuid, serialize(item));
      return Either<RepositoryError, T>.right(item);
    } catch (e) {
      return Either<RepositoryError, T>.left(RepositoryError.databaseError);
    }
  }

  /// Deletes a key value pair from the database.
  ///
  /// Returns [Some] [RepositoryError] if an error occurred. Otherwise [None];
  Future<Option<RepositoryError>> delete(UUID uuid) async {
    try {
      if (!box.containsKey(uuid)) {
        return Option<RepositoryError>.of(RepositoryError.notFoundError);
      }
      await box.delete(uuid);
      return Option<RepositoryError>.none();
    } catch (e) {
      return Option<RepositoryError>.of(RepositoryError.databaseError);
    }
  }

  /// Lists all values in the database.
  ///
  /// Returns an [Either] containing a [List] of all values if no error occurred.
  /// Otherwise an [Either] containing a [RepositoryError].
  Future<Either<RepositoryError, List<T>>> list() async {
    try {
      final List<T> items = box.values.map((item) => deserialize(item)).toList();
      return Either<RepositoryError, List<T>>.of(items);
    } catch (e) {
      return Either<RepositoryError, List<T>>.left(RepositoryError.databaseError);
    }
  }

  /// Clears the database.
  ///
  /// Returns [Some] [RepositoryError] if an error occurred. Otherwise [None].
  Future<Option<RepositoryError>> clear() async {
    try {
      await box.clear();
      await box.close();
      return Option<RepositoryError>.none();
    } catch (e) {
      return Option<RepositoryError>.of(RepositoryError.databaseError);
    }
  }

  /// Destroys the database.
  ///
  /// Returns [Some] [RepositoryError] if an error occurred. Otherwise [None].
  Future<Option<RepositoryError>> destroy() async {
    try {
      await box.clear();
      await Hive.deleteBoxFromDisk(_collectionName);
      return Option<RepositoryError>.none();
    } catch (e) {
      return Option<RepositoryError>.of(RepositoryError.databaseError);
    }
  }

}

/// A repository containing [Exercise]s, using Hive for persistence.
class ExerciseRepository extends HiveRepository<Exercise> {
  @override
  String _collectionName = "exercises";

  /// Singleton instance.
  static final ExerciseRepository _instance = ExerciseRepository._();

  /// Getter for singleton instance.
  static get instance => _instance;

  /// Private constructor.
  ExerciseRepository._();

  /// Serializes an [Exercise] into a json formatted [String].
  @override
  String serialize(Exercise item) => json.encode(item.toJson());

  /// Deserializes a json formatted [String] into an [Exercise].
  @override
  Exercise deserialize(String serializedItem) => Exercise.fromJson(json.decode(serializedItem));

}

/// A repository containing [Workout]s, using Hive for persistence.
class WorkoutRepository extends HiveRepository<Workout> {
  @override
  String _collectionName = "workouts";

  /// Singleton instance.
  static final WorkoutRepository _instance = WorkoutRepository._();

  /// Getter for singleton instance.
  static get instance => _instance;

  /// Private constructor.
  WorkoutRepository._();

  /// Serializes a [Workout] into a json encoded [String].
  @override
  String serialize(Workout item) => json.encode(item.toJson());

  /// Deserializes a json formatted [String] into an [Workout].
  @override
  Workout deserialize(String serializedItem) => Workout.fromJson(json.decode(serializedItem));

}