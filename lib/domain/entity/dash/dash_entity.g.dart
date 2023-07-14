// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashEntity _$$_DashEntityFromJson(Map<String, dynamic> json) =>
    _$_DashEntity(
      name: json['name'] as String,
      count: json['count'] as int,
      operations: (json['operations'] as List<dynamic>?)
              ?.map((e) => CounterEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DashEntityToJson(_$_DashEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'operations': instance.operations,
    };
