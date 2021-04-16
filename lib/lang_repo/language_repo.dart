import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:locale_clean_code/entities/Local.dart';
import 'package:locale_clean_code/local_source/local_source.dart';
import 'package:locale_clean_code/model/locale_model.dart';

abstract class LanguageRepository {
  Future<Either<String, Locale>> changeLanguage({required LocaleEntity type});
  Future<Either<String, Locale>> fetchLocale();
}

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  final LocalDataSource _local;

  LanguageRepositoryImpl(this._local);
  @override
  Future<Either<String, Locale>> changeLanguage(
      {required LocaleEntity type}) async {
    try {
      await _local.clearPrefs();
      await _local.setLocale(
        model: LocaleModel(
          locale: type.locale,
          countryCode: type.countryCode,
        ),
      );
      return right(Locale(type.locale, type.countryCode));
    } catch (e) {
      print(e.toString());
      return left("Something went wrong");
    }
  }

  @override
  Future<Either<String, Locale>> fetchLocale() async {
    try {
      final locale = await _local.fetchLocale();
      return right(locale);
    } catch (e) {
      print(e.toString());
      return left("Something went wrong");
    }
  }
}
