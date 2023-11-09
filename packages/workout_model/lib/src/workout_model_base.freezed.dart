// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_model_base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  String get uuid => throw _privateConstructorUsedError;
  WorkoutState get state => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get stopTime => throw _privateConstructorUsedError;
  DateTime? get resumedTime => throw _privateConstructorUsedError;
  Duration get workoutDuration => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {String uuid,
      WorkoutState state,
      DateTime? startTime,
      DateTime? stopTime,
      DateTime? resumedTime,
      Duration workoutDuration,
      List<Exercise> exercises});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? state = null,
    Object? startTime = freezed,
    Object? stopTime = freezed,
    Object? resumedTime = freezed,
    Object? workoutDuration = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as WorkoutState,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopTime: freezed == stopTime
          ? _value.stopTime
          : stopTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resumedTime: freezed == resumedTime
          ? _value.resumedTime
          : resumedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workoutDuration: null == workoutDuration
          ? _value.workoutDuration
          : workoutDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      WorkoutState state,
      DateTime? startTime,
      DateTime? stopTime,
      DateTime? resumedTime,
      Duration workoutDuration,
      List<Exercise> exercises});
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? state = null,
    Object? startTime = freezed,
    Object? stopTime = freezed,
    Object? resumedTime = freezed,
    Object? workoutDuration = null,
    Object? exercises = null,
  }) {
    return _then(_$WorkoutImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as WorkoutState,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopTime: freezed == stopTime
          ? _value.stopTime
          : stopTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resumedTime: freezed == resumedTime
          ? _value.resumedTime
          : resumedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workoutDuration: null == workoutDuration
          ? _value.workoutDuration
          : workoutDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WorkoutImpl extends _Workout {
  _$WorkoutImpl(
      {required this.uuid,
      required this.state,
      required this.startTime,
      required this.stopTime,
      required this.resumedTime,
      required this.workoutDuration,
      required final List<Exercise> exercises})
      : _exercises = exercises,
        super._();

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  final String uuid;
  @override
  final WorkoutState state;
  @override
  final DateTime? startTime;
  @override
  final DateTime? stopTime;
  @override
  final DateTime? resumedTime;
  @override
  final Duration workoutDuration;
  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'Workout._def(uuid: $uuid, state: $state, startTime: $startTime, stopTime: $stopTime, resumedTime: $resumedTime, workoutDuration: $workoutDuration, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.stopTime, stopTime) ||
                other.stopTime == stopTime) &&
            (identical(other.resumedTime, resumedTime) ||
                other.resumedTime == resumedTime) &&
            (identical(other.workoutDuration, workoutDuration) ||
                other.workoutDuration == workoutDuration) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      state,
      startTime,
      stopTime,
      resumedTime,
      workoutDuration,
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutImplToJson(
      this,
    );
  }
}

abstract class _Workout extends Workout {
  factory _Workout(
      {required final String uuid,
      required final WorkoutState state,
      required final DateTime? startTime,
      required final DateTime? stopTime,
      required final DateTime? resumedTime,
      required final Duration workoutDuration,
      required final List<Exercise> exercises}) = _$WorkoutImpl;
  _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  String get uuid;
  @override
  WorkoutState get state;
  @override
  DateTime? get startTime;
  @override
  DateTime? get stopTime;
  @override
  DateTime? get resumedTime;
  @override
  Duration get workoutDuration;
  @override
  List<Exercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
