// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginator_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatorResponse<T> _$PaginatorResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PaginatorResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginatorResponse<T> {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<T> get result => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int count, String? next, String? previous, List<T> result)
        response,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int count, String? next, String? previous, List<T> result)?
        response,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count, String? next, String? previous, List<T> result)?
        response,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginatorResponse<T> value) response,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginatorResponse<T> value)? response,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginatorResponse<T> value)? response,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatorResponseCopyWith<T, PaginatorResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatorResponseCopyWith<T, $Res> {
  factory $PaginatorResponseCopyWith(PaginatorResponse<T> value,
          $Res Function(PaginatorResponse<T>) then) =
      _$PaginatorResponseCopyWithImpl<T, $Res, PaginatorResponse<T>>;
  @useResult
  $Res call({int count, String? next, String? previous, List<T> result});
}

/// @nodoc
class _$PaginatorResponseCopyWithImpl<T, $Res,
        $Val extends PaginatorResponse<T>>
    implements $PaginatorResponseCopyWith<T, $Res> {
  _$PaginatorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginatorResponseCopyWith<T, $Res>
    implements $PaginatorResponseCopyWith<T, $Res> {
  factory _$$_PaginatorResponseCopyWith(_$_PaginatorResponse<T> value,
          $Res Function(_$_PaginatorResponse<T>) then) =
      __$$_PaginatorResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<T> result});
}

/// @nodoc
class __$$_PaginatorResponseCopyWithImpl<T, $Res>
    extends _$PaginatorResponseCopyWithImpl<T, $Res, _$_PaginatorResponse<T>>
    implements _$$_PaginatorResponseCopyWith<T, $Res> {
  __$$_PaginatorResponseCopyWithImpl(_$_PaginatorResponse<T> _value,
      $Res Function(_$_PaginatorResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? result = null,
  }) {
    return _then(_$_PaginatorResponse<T>(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_PaginatorResponse<T> implements _PaginatorResponse<T> {
  const _$_PaginatorResponse(
      {required this.count,
      this.next,
      this.previous,
      final List<T> result = const []})
      : _result = result;

  factory _$_PaginatorResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PaginatorResponseFromJson(json, fromJsonT);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<T> _result;
  @override
  @JsonKey()
  List<T> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'PaginatorResponse<$T>.response(count: $count, next: $next, previous: $previous, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatorResponse<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatorResponseCopyWith<T, _$_PaginatorResponse<T>> get copyWith =>
      __$$_PaginatorResponseCopyWithImpl<T, _$_PaginatorResponse<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int count, String? next, String? previous, List<T> result)
        response,
  }) {
    return response(count, next, previous, result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int count, String? next, String? previous, List<T> result)?
        response,
  }) {
    return response?.call(count, next, previous, result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count, String? next, String? previous, List<T> result)?
        response,
    required TResult orElse(),
  }) {
    if (response != null) {
      return response(count, next, previous, result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginatorResponse<T> value) response,
  }) {
    return response(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginatorResponse<T> value)? response,
  }) {
    return response?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginatorResponse<T> value)? response,
    required TResult orElse(),
  }) {
    if (response != null) {
      return response(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PaginatorResponseToJson<T>(this, toJsonT);
  }
}

abstract class _PaginatorResponse<T> implements PaginatorResponse<T> {
  const factory _PaginatorResponse(
      {required final int count,
      final String? next,
      final String? previous,
      final List<T> result}) = _$_PaginatorResponse<T>;

  factory _PaginatorResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_PaginatorResponse<T>.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<T> get result;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatorResponseCopyWith<T, _$_PaginatorResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
