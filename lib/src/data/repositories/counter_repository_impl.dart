import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/core/preferences/preferences.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';

import '../../domain/repositories/counter_repository.dart';

@Injectable(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  final FirebaseFirestore db;
  CounterRepositoryImpl(this.db);

  @override
  Future<void> decrement(CounterModel counter) async {
    final id = getIt<Preferences>().deviceId;

    final counterRef = db
        .collection('User')
        .doc(id)
        .collection('Counter')
        .withConverter(
          fromFirestore: CounterModel.fromFirestore,
          toFirestore: (CounterModel counter, options) => counter.toFirestore(),
        )
        .doc(counter.name);

    await counterRef.update(
      {'value': counter.value},
    );
  }

  @override
  Future<int> getValue(String name) async {
    final id = getIt<Preferences>().deviceId;

    final ref = db
        .collection('User')
        .doc(id)
        .collection('Counter')
        .withConverter(
          fromFirestore: CounterModel.fromFirestore,
          toFirestore: (CounterModel counter, _) => counter.toFirestore(),
        )
        .doc(name);

    final docSnap = await ref.get();
    final counter = docSnap.data();

    if (counter != null) {
      return counter.value!;
    } else {
      return 0;
    }
  }

  @override
  Future<void> increment(CounterModel counter) async {
    final id = getIt<Preferences>().deviceId;

    final counterRef = db
        .collection('User')
        .doc(id)
        .collection('Counter')
        .withConverter(
          fromFirestore: CounterModel.fromFirestore,
          toFirestore: (CounterModel counter, options) => counter.toFirestore(),
        )
        .doc(counter.name);

    await counterRef.update(
      {'value': FieldValue.increment(1)},
    );
  }
}
