import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_tasks/domain/entity/counter/counter_entity.dart';

part 'dash_entity.freezed.dart';

part 'dash_entity.g.dart';

@freezed
@immutable
class DashEntity with _$DashEntity {
  const DashEntity._(); // Added constructor for personal functions
  const factory DashEntity({
    required String name,
    required int count,
    @Default([]) List<CounterEntity> operations,
  }) = _DashEntity;

  int current() => operations.isEmpty ? 0 : operations[0].current;

  factory DashEntity.fromJson(Map<String, Object?> json) => _$DashEntityFromJson(json);
}
