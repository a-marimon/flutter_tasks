import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/domain/models/user_model.dart';

abstract class UserDataSource {
  Future<void> createuser(String id);
}

@Injectable(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore db;

  UserDataSourceImpl(this.db);

  @override
  Future<void> createuser(String id) async {
    final user = User(id: id);

    final docRef = db
        .collection('User')
        .withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: (User user, options) => user.toFirestore(),
        )
        .doc(id);

    await docRef.set(user);
  }
}
