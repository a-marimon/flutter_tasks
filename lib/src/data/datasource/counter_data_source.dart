import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/core/preferences/preferences.dart';

abstract class CounterDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCounters();
}

@Injectable(as: CounterDataSource)
class CounterDtaSourceImpl implements CounterDataSource {
  final FirebaseFirestore db;

  CounterDtaSourceImpl(this.db);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getCounters() async* {
    final id = getIt<Preferences>().deviceId;

    yield* db.collection('User').doc(id).collection('Counter').snapshots();
  }
}
