import 'package:cloud_firestore/cloud_firestore.dart';

enum Actions { suma, resta }

class EventModel {
  final String? name;
  final String? action;
  final int? value;
  final DateTime? time;

  EventModel({
    this.action,
    this.time,
    this.name,
    this.value,
  });

  factory EventModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return EventModel(
      name: map['name'],
      value: map['value'],
      time: (map['time'] as Timestamp).toDate(),
      action: map['action'],
    );
  }

  factory EventModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return EventModel(
      name: data?['name'],
      value: data?['value'],
      time: (data?['time'] as Timestamp).toDate(),
      action: data?['action'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (value != null) "value": value,
      if (time != null) "time": Timestamp.fromDate(time!),
      if (action != null) "action": action,
    };
  }
}
