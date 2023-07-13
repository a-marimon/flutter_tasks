// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CounterEntity _$CounterEntityFromJson(Map<String, dynamic> json) {
  return _CounterEntity.fromJson(json);
}

/// @nodoc
mixin _$CounterEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  String get operation => throw _privateConstructorUsedError;
  int get current => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterEntityCopyWith<CounterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterEntityCopyWith<$Res> {
  factory $CounterEntityCopyWith(
          CounterEntity value, $Res Function(CounterEntity) then) =
      _$CounterEntityCopyWithImpl<$Res, CounterEntity>;
  @useResult
  $Res call(
      {int id, String name, DateTime datetime, String operation, int current});
}

/// @nodoc
class _$CounterEntityCopyWithImpl<$Res, $Val extends CounterEntity>
    implements $CounterEntityCopyWith<$Res> {
  _$CounterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? datetime = null,
    Object? operation = null,
    Object? current = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CounterEntityCopyWith<$Res>
    implements $CounterEntityCopyWith<$Res> {
  factory _$$_CounterEntityCopyWith(
          _$_CounterEntity value, $Res Function(_$_CounterEntity) then) =
      __$$_CounterEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, DateTime datetime, String operation, int current});
}

/// @nodoc
class __$$_CounterEntityCopyWithImpl<$Res>
    extends _$CounterEntityCopyWithImpl<$Res, _$_CounterEntity>
    implements _$$_CounterEntityCopyWith<$Res> {
  __$$_CounterEntityCopyWithImpl(
      _$_CounterEntity _value, $Res Function(_$_CounterEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? datetime = null,
    Object? operation = null,
    Object? current = null,
  }) {
    return _then(_$_CounterEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CounterEntity extends _CounterEntity {
  const _$_CounterEntity(
      {required this.id,
      required this.name,
      required this.datetime,
      required this.operation,
      required this.current})
      : super._();

  factory _$_CounterEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CounterEntityFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime datetime;
  @override
  final String operation;
  @override
  final int current;

  @override
  String toString() {
    return 'CounterEntity(id: $id, name: $name, datetime: $datetime, operation: $operation, current: $current)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CounterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.current, current) || other.current == current));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, datetime, operation, current);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CounterEntityCopyWith<_$_CounterEntity> get copyWith =>
      __$$_CounterEntityCopyWithImpl<_$_CounterEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CounterEntityToJson(
      this,
    );
  }
}

abstract class _CounterEntity extends CounterEntity {
  const factory _CounterEntity(
      {required final int id,
      required final String name,
      required final DateTime datetime,
      required final String operation,
      required final int current}) = _$_CounterEntity;
  const _CounterEntity._() : super._();

  factory _CounterEntity.fromJson(Map<String, dynamic> json) =
      _$_CounterEntity.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  DateTime get datetime;
  @override
  String get operation;
  @override
  int get current;
  @override
  @JsonKey(ignore: true)
  _$$_CounterEntityCopyWith<_$_CounterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
