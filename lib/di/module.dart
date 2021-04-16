import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class Module {
  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();
}
