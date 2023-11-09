// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get numberOfRepetitions => throw _privateConstructorUsedError;
  int get restTimeInMinutes => throw _privateConstructorUsedError;
  int get numberOfSets => throw _privateConstructorUsedError;
  double get weightInKilograms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String description,
      int numberOfRepetitions,
      int restTimeInMinutes,
      int numberOfSets,
      double weightInKilograms});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? description = null,
    Object? numberOfRepetitions = null,
    Object? restTimeInMinutes = null,
    Object? numberOfSets = null,
    Object? weightInKilograms = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfRepetitions: null == numberOfRepetitions
          ? _value.numberOfRepetitions
          : numberOfRepetitions // ignore: cast_nullable_to_non_nullable
              as int,
      restTimeInMinutes: null == restTimeInMinutes
          ? _value.restTimeInMinutes
          : restTimeInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSets: null == numberOfSets
          ? _value.numberOfSets
          : numberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      weightInKilograms: null == weightInKilograms
          ? _value.weightInKilograms
          : weightInKilograms // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String description,
      int numberOfRepetitions,
      int restTimeInMinutes,
      int numberOfSets,
      double weightInKilograms});
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? description = null,
    Object? numberOfRepetitions = null,
    Object? restTimeInMinutes = null,
    Object? numberOfSets = null,
    Object? weightInKilograms = null,
  }) {
    return _then(_$ExerciseImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfRepetitions: null == numberOfRepetitions
          ? _value.numberOfRepetitions
          : numberOfRepetitions // ignore: cast_nullable_to_non_nullable
              as int,
      restTimeInMinutes: null == restTimeInMinutes
          ? _value.restTimeInMinutes
          : restTimeInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSets: null == numberOfSets
          ? _value.numberOfSets
          : numberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      weightInKilograms: null == weightInKilograms
          ? _value.weightInKilograms
          : weightInKilograms // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl extends _Exercise {
  _$ExerciseImpl(
      {required this.uuid,
      required this.name,
      required this.description,
      required this.numberOfRepetitions,
      required this.restTimeInMinutes,
      required this.numberOfSets,
      required this.weightInKilograms})
      : super._();

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String description;
  @override
  final int numberOfRepetitions;
  @override
  final int restTimeInMinutes;
  @override
  final int numberOfSets;
  @override
  final double weightInKilograms;

  @override
  String toString() {
    return 'Exercise._def(uuid: $uuid, name: $name, description: $description, numberOfRepetitions: $numberOfRepetitions, restTimeInMinutes: $restTimeInMinutes, numberOfSets: $numberOfSets, weightInKilograms: $weightInKilograms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.numberOfRepetitions, numberOfRepetitions) ||
                other.numberOfRepetitions == numberOfRepetitions) &&
            (identical(other.restTimeInMinutes, restTimeInMinutes) ||
                other.restTimeInMinutes == restTimeInMinutes) &&
            (identical(other.numberOfSets, numberOfSets) ||
                other.numberOfSets == numberOfSets) &&
            (identical(other.weightInKilograms, weightInKilograms) ||
                other.weightInKilograms == weightInKilograms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, description,
      numberOfRepetitions, restTimeInMinutes, numberOfSets, weightInKilograms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(
      this,
    );
  }
}

abstract class _Exercise extends Exercise {
  factory _Exercise(
      {required final String uuid,
      required final String name,
      required final String description,
      required final int numberOfRepetitions,
      required final int restTimeInMinutes,
      required final int numberOfSets,
      required final double weightInKilograms}) = _$ExerciseImpl;
  _Exercise._() : super._();

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get description;
  @override
  int get numberOfRepetitions;
  @override
  int get restTimeInMinutes;
  @override
  int get numberOfSets;
  @override
  double get weightInKilograms;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
