import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/core/preferences/preferences.dart';
import 'package:my_tasks/src/domain/models/counter_model.dart';
import 'package:my_tasks/src/domain/models/event_model.dart';

abstract class CounterDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCounters();
  Stream<QuerySnapshot<Map<String, dynamic>>> getEvents();
  Future<void> setEvent(EventModel event);
  Future<void> increment(CounterModel counter);
  Future<void> decrement(CounterModel counter);
  Future<CounterModel?> getValue(String name);
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

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getEvents() async* {
    final id = getIt<Preferences>().deviceId;

    yield* db.collection('User').doc(id).collection('Event').snapshots();
  }

  @override
  Future<void> setEvent(EventModel event) async {
    final id = getIt<Preferences>().deviceId;
    final docRef = db.collection('User').doc(id);

    final eventRef = docRef
        .collection('Event')
        .withConverter(
          fromFirestore: EventModel.fromFirestore,
          toFirestore: (EventModel event, options) => event.toFirestore(),
        )
        .doc(event.time.toString());

    await eventRef.set(event);
  }

  @override
  Future<void> decrement(CounterModel counter) async {
    final id = getIt<Preferences>().deviceId;

    final docRef = db.collection('User').doc(id);

    final counterRef = docRef
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
  Future<void> increment(CounterModel counter) async {
    final id = getIt<Preferences>().deviceId;

    final docRef = db.collection('User').doc(id);

    final counterRef = docRef
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

  @override
  Future<CounterModel?> getValue(String name) async {
    final id = getIt<Preferences>().deviceId;

    final docRef = db.collection('User').doc(id);

    final ref = docRef
        .collection('Counter')
        .withConverter(
          fromFirestore: CounterModel.fromFirestore,
          toFirestore: (CounterModel counter, _) => counter.toFirestore(),
        )
        .doc(name);

    final docSnap = await ref.get();
    return docSnap.data();
  }
}
