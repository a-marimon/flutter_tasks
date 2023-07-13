import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_entity.freezed.dart';

part 'api_entity.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginatorResponse<T> with _$PaginatorResponse<T> {
  const factory PaginatorResponse.response({required int count, String? next, String? previous, @Default([]) List<T> result}) = _PaginatorResponse;

  factory PaginatorResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$PaginatorResponseFromJson(json, fromJsonT);
}
