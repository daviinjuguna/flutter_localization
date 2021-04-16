import 'dart:convert';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:locale_clean_code/model/locale_model.dart';
import 'package:locale_clean_code/utils/constants.dart';
import 'package:locale_clean_code/utils/exeptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<void> setLocale({required LocaleModel model});
  Future<Locale> fetchLocale();
  Future<void> clearPrefs();
}

@LazySingleton(as: LocalDataSource)
class LocaleDataSourceImpl implements LocalDataSource {
  final SharedPreferences _prefs;

  LocaleDataSourceImpl(this._prefs);
  @override
  Future<Locale> fetchLocale() {
    try {
      String? locale = _prefs.getString(LOCALE);
      if (locale != null) {
        LocaleModel model = LocaleModel.fromJson(json.decode(locale));
        return Future.value(Locale(model.locale, model.countryCode));
      } else {
        //return onglee
        return Future.value(Locale("en", "EN"));
      }
    } catch (e) {
      print(e.toString());
      throw CacheExeption();
    }
  }

  @override
  Future<void> setLocale({required LocaleModel model}) {
    try {
      return _prefs.setString(LOCALE, json.encode(model.toJson()));
    } catch (e) {
      print(e.toString());
      throw CacheExeption();
    }
  }

  @override
  Future<void> clearPrefs() {
    try {
      return _prefs.clear();
    } catch (e) {
      print(e.toString());
      throw CacheExeption();
    }
  }
}
