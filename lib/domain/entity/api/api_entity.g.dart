// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatorResponse<T> _$$_PaginatorResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_PaginatorResponse<T>(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      result: (json['result'] as List<dynamic>?)?.map(fromJsonT).toList() ??
          const [],
    );

Map<String, dynamic> _$$_PaginatorResponseToJson<T>(
  _$_PaginatorResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'result': instance.result.map(toJsonT).toList(),
    };
