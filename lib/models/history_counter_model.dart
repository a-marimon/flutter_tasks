import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CounterAction {
  static const String increment = 'Suma';
  static const String decrement = 'Resta';
}

class HistoryCounterModel {
  final String? name;
  final String? action;
  final num? value;
  final String? lastUpdate;

  HistoryCounterModel({
    this.name,
    this.action,
    this.value,
    this.lastUpdate,
  });

  Timestamp _now() {
    DateTime now = DateTime.now();
    Timestamp timestamp = Timestamp.fromDate(now);
    return timestamp;
  }

  static String formattedDate(Timestamp date) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
    final String formattedDate =
        DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
    return formattedDate;
  }

  factory HistoryCounterModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return HistoryCounterModel(
      name: data?['name'],
      action: data?['action'],
      value: data?['value'],
      lastUpdate: formattedDate(data?['lastUpdate']),
    );
  }

  factory HistoryCounterModel.fromMap(Map<String, dynamic> data) {
    return HistoryCounterModel(
      name: data['name'],
      action: data['action'],
      value: data['value'],
      lastUpdate: formattedDate(data['lastUpdate']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      "action": action,
      if (value != null) "value": value,
      "lastUpdate": _now(),
    };
  }
}
