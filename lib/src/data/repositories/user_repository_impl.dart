import 'package:injectable/injectable.dart';
import 'package:my_tasks/src/data/datasource/user_data_source.dart';
import 'package:my_tasks/src/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<void> createUser(String id) async {
    final bool userExist = await userDataSource.userExist(id);

    if (!userExist) {
      await userDataSource.createCollections(id);
    }
  }
}
