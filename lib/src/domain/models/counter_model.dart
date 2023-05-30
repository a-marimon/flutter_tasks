import 'package:cloud_firestore/cloud_firestore.dart';

class CounterModel {
  final String? name;
  final int? value;

  CounterModel({
    this.name,
    this.value,
  });

  factory CounterModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CounterModel(
      name: data?['name'],
      value: data?['value'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (value != null) "value": value,
    };
  }

  factory CounterModel.fromMap(Map<String, dynamic> map) {
    return CounterModel(
      name: map['name'],
      value: map['value'],
    );
  }

  Map<String, double> toMap() {
    return {
      if (name != null)
        "Contador ${name!.toUpperCase()}": (value ?? 0).toDouble(),
    };
  }
}
