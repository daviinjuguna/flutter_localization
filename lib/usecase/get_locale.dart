import 'package:dartz/dartz.dart';
import 'package:flutter/painting.dart';
import 'package:injectable/injectable.dart';
import 'package:locale_clean_code/lang_repo/language_repo.dart';
import 'package:locale_clean_code/utils/usecase.dart';

@lazySingleton
class GetLocale extends UseCase<Locale, NoParams> {
  GetLocale(this._repository);

  @override
  Future<Either<String, Locale>> call(NoParams p) {
    return _repository.fetchLocale();
  }

  final LanguageRepository _repository;
}
