// 📦 Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'injection_container.config.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await $initGetIt(getIt);
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => await init();
