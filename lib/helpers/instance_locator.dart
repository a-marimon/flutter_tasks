import 'package:get_it/get_it.dart';

import 'alerts.dart';

GetIt instanceLocator = GetIt.instance;

///
void setupGetIt() {
  instanceLocator.registerLazySingleton(
    Alerts.new,
  );
}
