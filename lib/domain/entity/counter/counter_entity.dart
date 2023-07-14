import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_entity.freezed.dart';

part 'counter_entity.g.dart';

@freezed
@immutable
class CounterEntity with _$CounterEntity {
  const CounterEntity._(); // Added constructor for personal functions
  const factory CounterEntity({
    required int id,
    required String name,
    required DateTime datetime,
    required String operation,
    required int current
  }) = _CounterEntity;

  factory CounterEntity.fromJson(Map<String, Object?> json) => _$CounterEntityFromJson(json);
}
