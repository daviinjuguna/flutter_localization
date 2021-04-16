import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:locale_clean_code/di/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => await $initGetIt(getIt);
