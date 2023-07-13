import 'package:my_tasks/device/init.dart';
import 'package:my_tasks/domain/entity/dash/dash_entity.dart';

class DashRepository {
  Future<List<DashEntity>> data() async {
    return await Utils.http.dashboard();
  }
}
