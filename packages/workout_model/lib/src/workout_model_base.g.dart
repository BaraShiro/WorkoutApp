// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      uuid: json['uuid'] as String,
      state: $enumDecode(_$WorkoutStateEnumMap, json['state']),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      stopTime: json['stopTime'] == null
          ? null
          : DateTime.parse(json['stopTime'] as String),
      resumedTime: json['resumedTime'] == null
          ? null
          : DateTime.parse(json['resumedTime'] as String),
      workoutDuration: Duration(microseconds: json['workoutDuration'] as int),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'state': _$WorkoutStateEnumMap[instance.state]!,
      'startTime': instance.startTime?.toIso8601String(),
      'stopTime': instance.stopTime?.toIso8601String(),
      'resumedTime': instance.resumedTime?.toIso8601String(),
      'workoutDuration': instance.workoutDuration.inMicroseconds,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
    };

const _$WorkoutStateEnumMap = {
  WorkoutState.notStarted: 'notStarted',
  WorkoutState.running: 'running',
  WorkoutState.paused: 'paused',
  WorkoutState.finished: 'finished',
};
