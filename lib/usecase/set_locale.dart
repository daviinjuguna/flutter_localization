import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:locale_clean_code/lang_repo/language_repo.dart';
import 'package:locale_clean_code/utils/usecase.dart';

@lazySingleton
class SetLocale extends UseCase<Locale, LanguageParams> {
  SetLocale(this._repository);

  @override
  Future<Either<String, Locale>> call(LanguageParams p) {
    return _repository.changeLanguage(type: p.entity);
  }

  final LanguageRepository _repository;
}
