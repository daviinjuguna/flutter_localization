import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:locale_clean_code/entities/Local.dart';
import 'package:locale_clean_code/usecase/get_locale.dart';
import 'package:locale_clean_code/usecase/set_locale.dart';
import 'package:locale_clean_code/utils/usecase.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(this._getLocale, this._setLocale) : super(LanguageInitial());
  final GetLocale _getLocale;
  final SetLocale _setLocale;

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is GetLanguage) {
      // yield LanguageLoading();
      final _locale = await _getLocale.call(NoParams());
      yield _locale.fold(
        (l) => LanguageError(message: l),
        (r) => LanguageSuccess(locale: r),
      );
    }
    if (event is SetLanguage) {
      // yield LanguageLoading();
      final _locale =
          await _setLocale.call(LanguageParams(entity: event.locale));
      yield _locale.fold(
        (l) => LanguageError(message: l),
        (r) => LanguageSuccess(locale: r),
      );
    }
  }
}
