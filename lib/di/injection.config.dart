// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../bloc/language_bloc.dart' as _i8;
import '../lang_repo/language_repo.dart' as _i5;
import '../local_source/local_source.dart' as _i4;
import '../usecase/get_locale.dart' as _i7;
import '../usecase/set_locale.dart' as _i6;
import 'module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final module = _$Module();
  await gh.factoryAsync<_i3.SharedPreferences>(() => module.pref,
      preResolve: true);
  gh.lazySingleton<_i4.LocalDataSource>(
      () => _i4.LocaleDataSourceImpl(get<_i3.SharedPreferences>()));
  gh.lazySingleton<_i5.LanguageRepository>(
      () => _i5.LanguageRepositoryImpl(get<_i4.LocalDataSource>()));
  gh.lazySingleton<_i6.SetLocale>(
      () => _i6.SetLocale(get<_i5.LanguageRepository>()));
  gh.lazySingleton<_i7.GetLocale>(
      () => _i7.GetLocale(get<_i5.LanguageRepository>()));
  gh.factory<_i8.LanguageBloc>(
      () => _i8.LanguageBloc(get<_i7.GetLocale>(), get<_i6.SetLocale>()));
  return get;
}

class _$Module extends _i9.Module {}
