// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'register_module.dart' as _i15;
import 'src/core/preferences/preferences.dart' as _i12;
import 'src/data/datasource/counter_data_source.dart' as _i9;
import 'src/data/datasource/user_data_source.dart' as _i6;
import 'src/data/repositories/counter_repository_impl.dart' as _i11;
import 'src/data/repositories/user_repository_impl.dart' as _i8;
import 'src/domain/repositories/counter_repository.dart' as _i10;
import 'src/domain/repositories/user_repository.dart' as _i7;
import 'src/presentation/bloc/counter_a/counter_a_cubit.dart' as _i13;
import 'src/presentation/bloc/counter_b/counter_b_cubit.dart' as _i14;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.BaseDeviceInfo>(
    () => registerModule.info,
    preResolve: true,
  );
  gh.lazySingleton<_i4.FirebaseFirestore>(() => registerModule.storage);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i6.UserDataSource>(
      () => _i6.UserDataSourceImpl(gh<_i4.FirebaseFirestore>()));
  gh.factory<_i7.UserRepository>(
      () => _i8.UserRepositoryImpl(gh<_i6.UserDataSource>()));
  gh.factory<_i9.CounterDataSource>(
      () => _i9.CounterDtaSourceImpl(gh<_i4.FirebaseFirestore>()));
  gh.factory<_i10.CounterRepository>(() => _i11.CounterRepositoryImpl(
        gh<_i9.CounterDataSource>(),
        gh<_i6.UserDataSource>(),
      ));
  gh.factory<_i12.Preferences>(() => _i12.Preferences(
        gh<_i3.BaseDeviceInfo>(),
        gh<_i5.SharedPreferences>(),
        gh<_i7.UserRepository>(),
      ));
  gh.factory<_i13.CounterACubit>(
      () => _i13.CounterACubit(gh<_i10.CounterRepository>()));
  gh.factory<_i14.CounterBCubit>(
      () => _i14.CounterBCubit(gh<_i10.CounterRepository>()));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
