// To parse this JSON data, do
//
//     final counterDto = counterDtoFromMap(jsonString);

import 'dart:convert';

CounterDto counterDtoFromJson(String str) =>
    CounterDto.fromJson(json.decode(str));

String counterDtoToJson(CounterDto data) => json.encode(data.toJson());

class CounterDto {
  final int? id;
  final DateTime? createdAt;
  final int? value;
  final String? operation;
  final bool? current;

  CounterDto({
    this.id,
    this.createdAt,
    this.value,
    this.operation,
    this.current,
  });

  factory CounterDto.initial() => CounterDto(value: 0);

  factory CounterDto.fromJson(Map<String, dynamic> json) => CounterDto(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        value: json["value"],
        operation: json["operation"],
        current: json["current"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "value": value,
        "operation": operation,
        "current": current,
      };
}
