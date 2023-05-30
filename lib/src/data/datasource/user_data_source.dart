import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/counter_model.dart';
import '../../domain/models/user_model.dart';

abstract class UserDataSource {
  Future<bool> userExist(String id);
  Future<void> createCollections(String id);
}

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore db;

  UserDataSourceImpl(this.db);

  @override
  Future<void> createCollections(String id) async {
    final user = UserModel(id: id);
    final counterA = CounterModel(name: 'a', value: 0);
    final counterB = CounterModel(name: 'b', value: 0);

    final docRef = db
        .collection('User')
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(),
        )
        .doc(id);

    final counterARef = docRef
        .collection('Counter')
        .withConverter(
          fromFirestore: CounterModel.fromFirestore,
          toFirestore: (CounterModel user, options) => counterA.toFirestore(),
        )
        .doc(counterA.name);

    final counterBRef = docRef
        .collection('Counter')
        .withConverter(
          fromFirestore: CounterModel.fromFirestore,
          toFirestore: (CounterModel user, options) => counterB.toFirestore(),
        )
        .doc(counterB.name);

    await docRef.set(user);
    await counterARef.set(counterA);
    await counterBRef.set(counterB);
  }

  @override
  Future<bool> userExist(String id) async {
    final result = await db.collection('User').doc(id).get();
    return result.exists;
  }
}
