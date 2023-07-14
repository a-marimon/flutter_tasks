// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CounterEntity _$$_CounterEntityFromJson(Map<String, dynamic> json) =>
    _$_CounterEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      operation: json['operation'] as String,
      current: json['current'] as int,
    );

Map<String, dynamic> _$$_CounterEntityToJson(_$_CounterEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'datetime': instance.datetime.toIso8601String(),
      'operation': instance.operation,
      'current': instance.current,
    };
