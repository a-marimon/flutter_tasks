import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/device/utils.dart';
import 'package:my_tasks/domain/entity/dash/dash_entity.dart';

class DashRepository {
  Future<List<DashEntity>> data() async {
    try {
      return await Utils.http.dashboard();
    } catch (e) {
      throw MyException.checkError(e);
    }
  }
}
