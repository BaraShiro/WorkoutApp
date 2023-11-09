import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_model/src/exceptions.dart';
import 'package:workout_model/src/i_identifiable.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

/// An exercise consisting of a number of repetitions with a certain weight,
/// grouped into sets with rest time in between.
@freezed
class Exercise with _$Exercise implements IIdentifiable {
  /// Private constructor with no parameters.
  /// Used by Freezed to enable use of methods in this class.
  const Exercise._();

  /// Private constructor with a parameter for [uuid].
  /// Only used for code generation with Freezed.
  // ignore: unused_element
  factory Exercise._def({
    required UUID uuid,
    required String name,
    required String description,
    required int numberOfRepetitions,
    required int restTimeInMinutes,
    required int numberOfSets,
    required double weightInKilograms,
  }) = _Exercise;

  /// Constructs a new [Exercise] object and sets [uuid] to a random v4 UUID.
  ///
  /// Throws [EmptyNameException] if [name] is empty.
  /// Throws [NonPositiveNumberException] if [numberOfRepetitions] or [numberOfSets] is a non positive number.
  /// Throws [NegativeNumberException] if [restTimeInMinutes] or [weightInKilograms] is a negative number.
  factory Exercise({
    required String name,
    required String description,
    required int numberOfRepetitions,
    required int restTimeInMinutes,
    required int numberOfSets,
    required double weightInKilograms,
  }) {
    if(name.isEmpty) throw EmptyNameException("Name can not be empty.");
    if(numberOfRepetitions < 1) throw NonPositiveNumberException("Number of repetitions must be a positive integer.");
    if(restTimeInMinutes < 0) throw NegativeNumberException("Rest time in minutes must be a non negative integer.");
    if(numberOfSets < 1) throw NonPositiveNumberException("Number of sets must be a positive integer.");
    if(weightInKilograms < 0) throw NegativeNumberException("Weight in kilograms must be a non negative number.");

    return _Exercise(
      uuid: IIdentifiable.generateUuid(),
      name: name,
      description: description,
      numberOfRepetitions: numberOfRepetitions,
      restTimeInMinutes: restTimeInMinutes,
      numberOfSets: numberOfSets,
      weightInKilograms: weightInKilograms
    );
  }

  /// Constructs a new [Exercise] object, copying data from [exercise],
  /// and sets [uuid] to a random v4 UUID.
  factory Exercise.copy(Exercise exercise) {
    return Exercise(
        name: exercise.name,
        description: exercise.description,
        numberOfRepetitions: exercise.numberOfRepetitions,
        restTimeInMinutes: exercise.restTimeInMinutes,
        numberOfSets: exercise.numberOfSets,
        weightInKilograms: exercise.weightInKilograms
    );
  }

  /// Constructs a new [Exercise] object from a Json object.
  factory Exercise.fromJson(Map<String, Object?> json)
  => _$ExerciseFromJson(json);

  /// Updates the [name] of this [Exercise].
  ///
  /// [newName] must be non empty, otherwise throws [EmptyNameException].
  Exercise updateName(String newName)
  {
    if(newName.isEmpty) throw EmptyNameException("Name can not be empty.");
    return copyWith(name: newName);
  }

  /// Updates the [description] of this [Exercise].
  Exercise updateDescription(String newDescription)
  {
    return copyWith(description: newDescription);
  }

  /// Updates the [numberOfRepetitions] of this [Exercise].
  ///
  /// [newNumberOfRepetitions] must be a positive integer, otherwise throws [NonPositiveNumberException].
  Exercise updateNumberOfRepetitions(int newNumberOfRepetitions)
  {
    if(newNumberOfRepetitions < 1) throw NonPositiveNumberException("Number of repetitions must be a positive integer.");
    return copyWith(numberOfRepetitions: newNumberOfRepetitions);
  }

  /// Updates the [restTimeInMinutes] of this [Exercise].
  ///
  /// [newRestTimeInMinutes] must be a non negative integer, otherwise throws [NegativeNumberException].
  Exercise updateRestTimeInMinutes(int newRestTimeInMinutes)
  {
    if(newRestTimeInMinutes < 0) throw NegativeNumberException("Rest time in minutes must be a non negative integer.");
    return copyWith(restTimeInMinutes: newRestTimeInMinutes);
  }

  /// Updates the [numberOfSets] of this [Exercise].
  ///
  /// [newNumberOfSets] must be a positive integer, otherwise throws [NonPositiveNumberException].
  Exercise updateNumberOfSets(int newNumberOfSets)
  {
    if(newNumberOfSets < 1) throw NonPositiveNumberException("Number of sets must be a positive integer.");
    return copyWith(numberOfSets: newNumberOfSets);
  }

  /// Updates the [weightInKilograms] of this [Exercise].
  ///
  /// [newWeightInKilograms] must be a non negative number, otherwise throws [NegativeNumberException].
  Exercise updateWeightInKilograms(double newWeightInKilograms)
  {
    if(newWeightInKilograms < 0) throw NegativeNumberException("Weight in kilograms must be a non negative number.");
    return copyWith(weightInKilograms: newWeightInKilograms);
  }
}